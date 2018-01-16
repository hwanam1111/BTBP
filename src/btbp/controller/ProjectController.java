package btbp.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.BoardDao;
import btbp.dao.FriendDao;
import btbp.dao.JobDao;
import btbp.dao.MemberDao;
import btbp.dao.MessageDao;
import btbp.dao.ProjectDao;
import btbp.dao.ProjectMemberDao;
import btbp.model.BoardVO;
import btbp.model.FriendVO;
import btbp.model.JobVO;
import btbp.model.MemberVO;
import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;

@Controller
public class ProjectController {

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
	@Autowired
	private BoardDao bdao;
	
	
	// 요청 페이지로 이동
	@RequestMapping("/{url}.do")  // 계속 계속 필요할때마다 만들면 너무 많아지고 번거로우니까 {url} 이렇게 잡아주면 편함
	public ModelAndView test(@PathVariable String url, HttpSession session, ProjectMemberVO pvo){		
		
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
			
		ModelAndView m = new ModelAndView();
			
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		int sdate = Integer.parseInt(pInfo.getStartDate().replaceAll("-", ""));
		int edate = Integer.parseInt(pInfo.getEndDate().replaceAll("-", ""));
		int totalDay = edate-sdate;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        int today = Integer.parseInt(sdf.format(c1.getTime()));
        long datePer = Math.round((((double)today-(double)sdate)/(double)totalDay)*100);
        
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
				
		// 리턴 값 셋팅
		m.setViewName(url);
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("datePer", datePer);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보

		return m;
	}
	
	// 프로젝트 메인 페이지 요청
		@RequestMapping("ProjectMain")
		public ModelAndView projectMain(HttpSession session, ProjectMemberVO pvo, BoardVO bvo, JobVO jvo){
			// 프로젝트 번호 세션 등록
			session.setAttribute("projectNo", pvo.getProjectNo());
			int MemberCount = 0; // 총 멤버의 수를 알기 위한 변수
			String todo = "";
			String doing = "";
			String done = "";
			String grade = "";
			String memberId = (String)session.getAttribute("memberId");
			int projectNo = (int)session.getAttribute("projectNo");
			bvo.setProjectNo(projectNo);
			jvo.setProjectNo(projectNo);
			pvo.setMemberId(memberId); // 
			pvo.setProjectNo(projectNo);
			int[] countTodo = new int[3];
			int[] countDoing = new int[3];
			int[] countDone = new int[3];
			ModelAndView m = new ModelAndView();
			m.setViewName("/main/WindowForward");
			
			int result = pmdao.projectMain(pvo);
			if(result > 0){
				// 프로젝트 메인화면에 뿌려줄 데이터 가져오기(Dao)
				
				// 헤더 정보
				
				// 헤더 정보
				ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
				List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
				int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
				List<FriendVO> fList = fdao.myFriend(memberId);
				List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
				List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
				// 헤더 정보
				
				//페이징
				int totalPage = bdao.countProjectMainBoardList(bvo);//전체 레코드 갯수 
				HashMap<String, Integer> hash = new HashMap<>();
				hash.put("totalCount", totalPage);
				int pageNo=0;
				if(bvo.getPageNo() == 0){pageNo = 1;}
				else pageNo=bvo.getPageNo();
				hash.put("pageNo", pageNo);
				int start = pageNo*8-(8-1);//해당 페이지 첫번째 열
				int end = pageNo*8;//해당 페이지 마지막 열
				bvo.setStartRecord(start);
				bvo.setEndRecord(end);
				
				HashMap<String, Integer> pageList = countPage(hash);//페이징 처리 함수 호출
				List<BoardVO> bList= bdao.projectMainBoardList(bvo);// 프로젝트 최신 뉴스 보여주기
				List<JobVO> jList = jdao.projectMainJobList(jvo); // 프로젝트 최신 작업(KanBan, KPT, MileStone)
				List<JobVO> list = jdao.projectMainTeamWorkingCheck(jvo); // 팀별 작업 현황(각 grade 별 KANBAN 현황을 보여줌)
				List<JobVO> listGrade = jdao.projectMainTeamWorkingGrade(jvo);
				List<JobVO> kList = jdao.projectMainKanBanCheck(jvo); // 프로젝트 별 Kanban 현황
				
				if (pList.size() >= 4 ){
					MemberCount = 4;
				}else{
					MemberCount = pList.size();
				}
		
				// 리턴 값 셋팅
				m.setViewName("ProjectMain");
				
				// 1. listGrade의 크기를 통해서 countList 의 배열 크기를 잡고, 0으로 초기화
				for( int i=0; i<countTodo.length; i++){
					countTodo[i] = 0;
					countDoing[i] = 0;
					countDone[i] = 0;
				}
				
				// 2. 일단 listGrade에는 중복이 되지 않은 grade가 들어있기 때문에, 이를 grade String에 붙여 넣음
			if(listGrade.size() != 0){
				for(int i=0; i<listGrade.size(); i++){
					grade += "'"+listGrade.get(i).getGrade()+"',";
				}
				grade.substring(grade.length()-1, grade.length());
			}
				
				// 3. countList 배열에 각 필요한 count 값을 넣어줌
			for( int i=0; i<list.size(); i++){
				for(int j=0; j<listGrade.size(); j++){
					if(list.get(i).getGrade().equals(listGrade.get(j).getGrade())){
							if( list.get(i).getJobStatus().equals("todo")){
								countTodo[j] = list.get(i).getCount();
						}else if(list.get(i).getJobStatus().equals("doing")){
							countDoing[j] = list.get(i).getCount();
						}else if(list.get(i).getJobStatus().equals("done")){
							countDone[j] = list.get(i).getCount();
						}
				}
			}
		}
			// 4. countList 배열을 String 으로 변환함
			for(int i=0; i<listGrade.size(); i++){
				todo += countTodo[i]+",";
				doing += countDoing[i]+",";
				done += countDone[i]+",";
			}

			
			if(todo.length() != 0) todo   =  todo.substring(0, todo.length()-1);
			if(doing.length() != 0) doing = doing.substring(0, doing.length()-1);
			if(done.length() != 0)  done  = done.substring(0, done.length()-1);
			
//			System.out.println(todo);
//			System.out.println(doing);
//			System.out.println(done);
			// 헤더 정보
				m.addObject("pInfo", pInfo);
				m.addObject("pList", pList); // 프로젝트 멤버 리스트 pList
				m.addObject("bList", bList); // 프로젝트 최신 뉴스(board, version, fileshare, notice)
				m.addObject("jList", jList); // 프로젝트 최신 작업(KanBan, KPT, MileStone)
				m.addObject("kList", kList);   // 팀 별 Kanban 작업 현황
				m.addObject("todo", todo);
				m.addObject("doing", doing);
				m.addObject("done", done);
				m.addObject("grade", grade);
				m.addObject("MemberCount", MemberCount);
				m.addObject("pageList",pageList);//페이징 리스트
				m.addObject("fList", fList);
				m.addObject("noReadMsg", noReadMsg);
				m.addObject("newJobList", newJobList);
				m.addObject("endJobList", endJobList);
				// 헤더 정보
			}
			return m;
		}
	
		//페이징 처리 함수
		static HashMap<String, Integer> countPage(HashMap<String,Integer> hash){
			int pageno = 0;
			if(hash.get("pageNo")!=null) pageno=(int)hash.get("pageNo");//현재 눌린번호

			if(pageno<1){//현재 페이지
				pageno = 1;
			}

			int totalRecord =(int)(hash.get("totalCount"));//전체 레코드 수
//			System.out.println("총레코드 수" + totalRecord);
			int page_per_record_cnt =8;//한 페이지당 레코드수 
			int group_per_page_cnt =5; //한그룹당 번호개수

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
		
		
	// 프로젝트 정보 수정 시
	@RequestMapping("ProjectInfoUpdate")
	public String projectInfoUpdate(HttpSession session, ProjectVO pvo){
		pdao.projectInfoUpdate(pvo);
		return "redirect:ProjectInfo.do";
	}
	
	// 프로젝트 켈린더 페이지 요청
	@RequestMapping("ProjectCalendar")
	public ModelAndView projectCalendar(HttpSession session, ProjectMemberVO pvo){
						
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
						
		ModelAndView m = new ModelAndView();
						
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		List<JobVO> jList = jdao.jobList(pvo); // 업무 리스트 조회
		// 리턴 값 셋팅
		m.setViewName("ProjectCalendar");
		m.addObject("jList", jList);
		
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
	
	// 프로젝트 목록 조회
	@RequestMapping("ProjectList")
	public ModelAndView projectList(HttpSession session){
		
		String memberId = (String)session.getAttribute("memberId");
		
		MemberVO mvo = mdao.memberInfo(memberId);
 		List<ProjectVO> pList = mdao.memberProject(memberId);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/ProjectList");
		m.addObject("mvo", mvo);
		m.addObject("pList", pList);
		
		return m;
	}
	
	// 프로젝트 생성 창
	@RequestMapping("ProjectCreate")
	public String projectCreate(){
		return "/main/ProjectCreate";
	}
	
	// 프로젝트 생성
	@RequestMapping("ProjectSave")
	public String projectSave(HttpSession session, ProjectVO pvo){
		
		String memberId = (String)session.getAttribute("memberId");
		pvo.setMemberId(memberId);
		
		pdao.projectSave(pvo);
		
		return "/main/WindowClose";
	}
	
}
