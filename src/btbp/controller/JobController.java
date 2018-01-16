package btbp.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.FriendDao;
import btbp.dao.JobDao;
import btbp.dao.MemberDao;
import btbp.dao.MessageDao;
import btbp.dao.ProjectDao;
import btbp.dao.ProjectMemberDao;
import btbp.model.FriendVO;
import btbp.model.JobVO;
import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;

@Controller
public class JobController {

	@Autowired
	private ProjectDao pdao;
	@Autowired
	private MemberDao mdao;
	@Autowired
	private MessageDao msgdao;
	@Autowired
	private ProjectMemberDao pmdao;
	@Autowired
	private FriendDao fdao;
	@Autowired
	private JobDao jdao;
	
	
	//-----------------------------------------------------
	
	//나의 작업 화면 진입
	@RequestMapping("CurrentWork.do")
	public ModelAndView startMywork(HttpSession session, ProjectMemberVO pvo,String wpageNo,String kpageNo){
		//세션에서 프로젝트 번호 받음
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("projectNo", projectNo);
		hash.put("memberId", memberId);
		
		
		//페이징하기
		int kTotal = jdao.countMyKanban(hash);//칸반 전체 데이터 갯수
		int wTotal = jdao.countMyWork(hash); //나의 게시글 전체 데이터 갯수
		
		HashMap<String, Integer> wPageCount = new HashMap<>();
		
		int nowWpage=Integer.parseInt(wpageNo); //현재 나의 게시글 페이지
		int startW = nowWpage *3-(3-1);
		int endW = nowWpage *3;
		
		//나의 게시글 페이징 처리 위한 hash 생성
		wPageCount.put("start", startW);
		wPageCount.put("end", endW);
		wPageCount.put("pageNo", nowWpage);
		wPageCount.put("totalCount", wTotal);
		hash.put("startW", startW);
		hash.put("endW", endW);
		
		HashMap<String, Integer> kPageCount = new HashMap<>();
		int nowKpage=Integer.parseInt(kpageNo);//현재 칸반 페이지
		int startK = nowKpage*3-(3-1);
		int endK = nowKpage*3;
		hash.put("startK", startK);
		hash.put("endK", endK);
		
		kPageCount.put("start", startK);
		kPageCount.put("end", endK);
		kPageCount.put("pageNo", nowKpage);
		kPageCount.put("totalCount", kTotal);
		
		//페이징 처리 함수
		HashMap wHash=countPage(wPageCount);
		HashMap kHash=countPage(kPageCount);
//		System.out.println("WHASH"+wHash);
//		System.out.println("kHash"+kHash);
		
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		//업로드한 파일 리스트
		List<JobVO> fileList =jdao.projectFile(hash);
//		System.out.println(pList.size());
		//나의 작업 리스트
		List<JobVO> wList = jdao.myWork(hash);
		//칸반 보드 리스트
		List<JobVO> kList = jdao.startMyKanban(hash);
		
		//화면 전환에 필요한 변수 셋팅
		ModelAndView m= new ModelAndView();
		m.setViewName("CurrentWork");
		m.addObject("fileList",fileList);
		m.addObject("wList",wList);
		m.addObject("kList",kList);
		
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보

		//페이징
		m.addObject("wHash",wHash);
		m.addObject("kHash",kHash);
		return m;
	}


	static HashMap<String, Integer> countPage(HashMap<String,Integer> hash){
			int pageno = 0;
			if(hash.get("pageNo")!=null) pageno=(int)hash.get("pageNo");//현재 눌린번호
			
			if(pageno<1){//현재 페이지
				pageno = 1;
			}
			
			int totalRecord =(int)(hash.get("totalCount"));//전체 레코드 수
//			System.out.println("총레코드 수" + totalRecord);
			int page_per_record_cnt =3;//한 페이지당 레코드수 
			int group_per_page_cnt =3; //한그룹당 번호개수
			
			int record_end = pageno*page_per_record_cnt;//끝페이지
			int record_start= record_end-(page_per_record_cnt-1);//시작페이지
			if(record_end>totalRecord){
				record_end = totalRecord;
			}
//			System.out.println("끝 페이지"+record_end);//10
			int total_page = totalRecord / page_per_record_cnt + (totalRecord % page_per_record_cnt>0 ? 1 : 0);
			
//			System.out.println("total_page"+total_page);//2
			if(pageno>total_page){//누른 페이지 번호>10;
				pageno = total_page; //누른 페이지 번호 = 10
			}
			
			int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
			//현재 그룹번호 = 현재페이지/페이지당 보여줄 페이지 번호수+(햔재페이지%페이지당 보여줄 번호수>0?1:0)
			int page_eno = group_no*group_per_page_cnt;	//현재 그룹 끝번호	
			int page_sno = page_eno-(group_per_page_cnt-1);	//현재 그룹 시작번호=현재 그룹 끝번호-(페이지당 보여줄 번호수-1)
			
			if(page_sno<0){
				page_sno=1;
			}
			if(page_eno>total_page){
				page_eno=total_page;
			}
			//이전으로 다음으로
			int prev_pageno = pageno-1;
			int next_pageno = pageno+1;
			if(prev_pageno<1){
			//	이전 페이지 번호가 1보다 작을 경우		
				prev_pageno=1;
			//	이전 페이지를 1로
			}
			if(next_pageno>total_page){
			//	다음 페이지보다 전체페이지 수보다 클경우		
				next_pageno=total_page;
				//total_page/group_per_page_cnt*group_per_page_cnt+1
		}
	HashMap<String, Integer> result = new HashMap<>();
	result.put("prev", prev_pageno);//이전으로
	result.put("next", next_pageno);//다음으로
	result.put("sNo", page_sno);//페이징 시작
	result.put("eNo", page_eno);//페이징 끝 번호
	
	return result;
	}
	   


	
	
	
	// ----------------------------------------------------------
	
	// 업무 상세정보 조회
	@RequestMapping("JobInfo")
	public ModelAndView jobInfo(HttpSession session, JobVO jvo, ProjectMemberVO pvo){
		
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		JobVO jInfo = jdao.jobInfo(jvo);
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		ModelAndView m = new ModelAndView();
		m.setViewName("JobInfo");
		m.addObject("jInfo", jInfo);
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보
		
		return m;
	}
	
	// 간트차트 리스트 조회
	@RequestMapping("GanttList")
	public ModelAndView ganttList(HttpSession session, ProjectMemberVO pvo){
		
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		// 간트차트 리스트 조회
		List<JobVO> jList = jdao.ganttList(pvo);
		
		// 날짜를 위한 date 객체 생성
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포멧
		ArrayList<String> pDate = new ArrayList<String>();
		
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		// 프로젝트 날짜 구하기
		try{
			
			//Date타입으로 변경
			Date d1 = df.parse( pInfo.getStartDate() );
			Date d2 = df.parse( pInfo.getEndDate() );
			
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			
			//Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
			c1.setTime( d1 );
			c2.setTime( d2 );
			
			//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
			while( c1.compareTo( c2 ) !=1 ){
				pDate.add(df.format(c1.getTime()));
				c1.add(Calendar.DATE, 1); //시작날짜 + 1 일
			}
			
		
		} catch (Exception e){
			e.getMessage();
		}
		// --------------
		
		ModelAndView m = new ModelAndView();
		m.setViewName("Gantt");
		m.addObject("jList", jList);
		m.addObject("pDate", pDate);
		m.addObject("today", df.format(new Date()));
		
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보
		
		return m;
	}
	
	
	// 칸반 리스트 조회
	@RequestMapping("Kanban")
	public ModelAndView kanbanList(HttpSession session, ProjectMemberVO pvo){
			
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
			
		// 칸반 리스트 조회
		List<JobVO> kList = jdao.kanbanList(pvo);
			
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
			
		ModelAndView m = new ModelAndView();
		m.setViewName("Kanban");
		m.addObject("kList", kList);
		
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보
			
		return m;
	}
	
	@RequestMapping("kanbanAlldel")
	public String kanbanAlldel(HttpSession session, JobVO jvo){
		
		jvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		jdao.kanbanAlldel(jvo);
		
		return "redirect:Kanban.do";
	}
	
	@RequestMapping("KanbanStatusUp")
	public String kanbanStatusUp(HttpSession session, JobVO jvo){
		// 칸반 상태 업데이트
		jdao.kanbanStatusUp(jvo);
		return "redirect:Kanban.do";
	}
	
	@RequestMapping("jobDelete")
	public String jobDelete(JobVO jvo){
		// 업무 삭제
		jdao.jobDelete(jvo);
		
		if(jvo.getJobType().equals("gantt")){
			return "redirect:GanttList.do";
		}
		
		return "redirect:Kanban.do";
	}
	
	@RequestMapping("jobInsert")
	public String jobInsert(HttpSession session, JobVO jvo){
		// 업무 등록
		jvo.setProjectNo((int)session.getAttribute("projectNo"));
		jvo.setMemberId((String)session.getAttribute("memberId"));
//		System.out.println("신규 일정 등록");
		jdao.jobInsert(jvo);
		
		if(jvo.getJobType().equals("gantt")){
			return "redirect:GanttList.do";
		}
		
		return "redirect:Kanban.do";
	}
	
	@RequestMapping("jobUpdate")
	public String jobUpdate(JobVO jvo){
		// 업무수정
		jdao.jobUpdate(jvo);
		
		if(jvo.getJobType().equals("gantt")){
			return "redirect:GanttList.do";
		} else {
			return "redirect:Kanban.do";
		}
	}
	
} // CLASS END
