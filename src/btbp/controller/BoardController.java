package btbp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.BoardDao;
import btbp.dao.FileShareDao;
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
import btbp.model.ReplyVO;

@Controller
public class BoardController {

	@Autowired
	private BoardDao bdao;
	@Autowired
	private ProjectDao pdao;
	@Autowired
	private MemberDao mdao;
	@Autowired
	private FileShareDao Fdao;
	@Autowired
	private ProjectMemberDao pmdao;
	@Autowired
	private MessageDao msgdao;
	@Autowired
	private FriendDao fdao;
	@Autowired
	private JobDao jdao;
	
	
	// 형상 관리 입력 시
	@RequestMapping("VersionSave")
	public String versionSave(HttpSession session, BoardVO bvo){
		bvo.setMemberId((String)session.getAttribute("memberId"));
		bvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		bdao.ProjectBoardInsert(bvo);
		
		return "redirect:ProjectBoard.do?boardType=version";
	}
	
	
	// ★ 팀 게시글 폼
	@RequestMapping("ProjectBoardInsertForm")
	public ModelAndView ProjectBoardInsertForm(String boardType, int pageNo, HttpSession session, ProjectMemberVO pvo){

		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/ProjectBoardInsert");
		m.addObject("status",boardType);
		m.addObject("pageNo",pageNo);
		
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


	// ★ 팀 게시글 입력하기
	@RequestMapping("ProjectBoardWrite")
	public ModelAndView ProjectBoardInsert(HttpSession session, BoardVO bvo, ProjectMemberVO pvo){
		
		ModelAndView m = new ModelAndView();
		
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		// 게시판 XSS 취약점 방지
		if(bvo.getBoardContent().contains("script")){
			m.setViewName("/ProjectBoardInsert");
			return m;
		}

		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		
		bvo.setMemberId((String)session.getAttribute("memberId"));
		bvo.setProjectNo((int)session.getAttribute("projectNo"));

		bdao.ProjectBoardInsert(bvo); 
		
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보
		
		m.setViewName("redirect:ProjectBoard.do?boardType="+bvo.getBoardType()+"&pageNo="+1);
		
		return m;
	}


	// ★ 팀 게시글 목록보기

	// 게시판 리스트 페이지 요청
	@RequestMapping("ProjectBoard")
	public ModelAndView ProjectBoard(HttpSession session, BoardVO boardvo, ProjectMemberVO pvo){

		// 세션 아이디값 얻어오기
		if(session.getAttribute("memberId") == null){
			ModelAndView m = new ModelAndView();
			m.setViewName("/main/main");
			return m;
		}
		
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);

		boardvo.setProjectNo(projectNo);
		
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보

		// DAO 호출 및 리턴값 받기
		MemberVO mvo = mdao.memberInfo(memberId);

		//페이징 하기
		int nowpagenum=1;
		nowpagenum = boardvo.getPageNo();
//		System.out.println("현재 페이지 번호"+nowpagenum);

		int startRecord = nowpagenum*7-(7-1);
		int endRecord = nowpagenum*7;

		boardvo.setStartRecord(startRecord);
		boardvo.setEndRecord(endRecord);

		int totalPage = bdao.boardCount(boardvo); //전체 글의 갯수

		List<BoardVO> bList = bdao.ProjectBoardList(boardvo); // 게시판 리스트 가져오기
		
		// View 지정 및 데이터 전달
		ModelAndView m = new ModelAndView();
		m.setViewName("/ProjectBoard");
		m.addObject("mvo", mvo);
		m.addObject("status",boardvo.getBoardType());
		m.addObject("bList", bList);
		m.addObject("totalPage",totalPage);
		m.addObject("nowpagenum",nowpagenum);
		
		// 헤더 정보
		m.addObject("pInfo", pInfo);
		m.addObject("pList", pList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
		m.addObject("newJobList", newJobList);
		m.addObject("endJobList", endJobList);
		// 헤더 정보
		
		if(boardvo.getBoardType().equals("version")){
			m.setViewName("Version");
		}
		
		return m;
	}



	// ★ 팀 게시글 작성자 검색
	@RequestMapping("WriterFind")
	public ModelAndView WriterFind(HttpSession session, BoardVO bvo){

//		System.out.println("WriterFind");	
		String memberId = (String)session.getAttribute("memberId");
		int projectNo=(int)session.getAttribute("projectNo");
		bvo.setProjectNo(projectNo);//프로젝트 번호 입력해야 해당 프로젝트번호의 게시판 들갈수 있다.

		String btype=bvo.getBoardType();//게시판 타입


		// DAO 호출 및 리턴값 받기
		MemberVO mvo = mdao.memberInfo(memberId);
		List<BoardVO> bList = bdao.WriterFind(bvo);		

		int totalPage = bdao.boardCount(bvo);

		// View 지정 및 데이터 전달
		ModelAndView m = new ModelAndView();
		m.setViewName("/ProjectBoard");//?boardType="+ btype+"&pageNo=1");
		m.addObject("mvo", mvo);
		m.addObject("bList", bList);
		m.addObject("status", btype);
		m.addObject("pageNo", "1");
		m.addObject("totalPage",totalPage);
		m.addObject("nowpagenum","1");


		return m;
	}


	// ★ 팀 게시글 내용 읽기
	@RequestMapping("ProjectBoardDetail")
	public ModelAndView ProjectBoardDetail(HttpSession session, BoardVO bvo, ProjectMemberVO pvo){

		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
		
		BoardVO boardVO;

		boardVO = Fdao.fileShareDetail(bvo);


		//페이징 하기
		int nowpagenum=1;
		nowpagenum = bvo.getPageNo();

		int startRecord = nowpagenum*7-(7-1);
		int endRecord = nowpagenum*7;

		// 게시글 조회 수 +1
		bdao.boardCountPlus(bvo);
		// 게시글 조회
		BoardVO vo = bdao.ProjectBoardDetail(bvo);
		// 게시글에 달린 댓글 리스트 조회
		List<ReplyVO> rList = bdao.ProjectReplyList(bvo);
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보		

		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("/ProjectBoardDetail");
		m.addObject("file", boardVO);
		m.addObject("bvo", vo);
		m.addObject("rList", rList);
		m.addObject("nowpagenum",nowpagenum);
		
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


	// ★ 팀 댓글 달기
	@RequestMapping("ProjectReplySave")
	public String ProjectReplySave(HttpSession session, ReplyVO rvo){

		rvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.ProjectReplySave(rvo);

		return "redirect:ProjectBoardDetail.do?boardNo="+rvo.getBoardNo()+"&boardType="+rvo.getBoardType()+"&pageNo="+rvo.getPageNo();
	}	


	// ★ 팀 게시글 삭제 ( 게시글에 딸린 댓글도 같이 삭제가 됨, BoardDao에서 걸어줌 )
	@RequestMapping("ProjectBoardDelete")
	public String ProjectBoardDelete(HttpSession session, BoardVO bvo, String StringBoardNo){

		String type = bvo.getBoardType();
//		System.out.println("타입"+type);


		bvo.setMemberId((String)session.getAttribute("memberId"));	

//		System.out.println("StringBoardNo"+StringBoardNo);

		if(StringBoardNo!=null){
			String[] arrBoardNo = StringBoardNo.split(",");

			for(int i=0; i<arrBoardNo.length;i++){
//				System.out.println("지울번호"+arrBoardNo[i]);
				bvo.setBoardNo(Integer.parseInt(arrBoardNo[i]));

				bdao.ProjectBoardDelete(bvo);
			}


		}else{
			bdao.ProjectBoardDelete(bvo);
		}
//		System.out.println("페이지번호"+bvo.getPageNo());

		return "redirect:ProjectBoard.do?boardType="+type+"&pageNo="+bvo.getPageNo();
	}


	// ★ 팀 댓글 삭제 (순수 댓글만 삭제)
	@RequestMapping("ProjectBoardReplyDel")
	public String ProjectBoardReplyDel(HttpSession session, ReplyVO rvo){

		rvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.ProjectBoardReplyDel(rvo);

		return "redirect:ProjectBoardDetail.do?boardNo="+rvo.getBoardNo()+"&boardType="+rvo.getBoardType()+"&pageNo="+rvo.getPageNo();
	}	

	/////////////////////////////////////////////////////////////////////////////////
	// ★ 팀 게시글 수정하기 눌렀을때 수정하는 화면에서, "제목", "내용", "파일" 그대로 넘겨받아 화면에 보여주는 것
	@RequestMapping("ProjectBoardModify")
	public ModelAndView ProjectBoardModify(HttpSession session, BoardVO bvo, String boardType){

		// 게시글 조회
		BoardVO vo = bdao.ProjectBoardDetail(bvo);

		//페이징 하기
		int nowpagenum=1;
		nowpagenum = bvo.getPageNo();

		int startRecord = nowpagenum*7-(7-1);
		int endRecord = nowpagenum*7;

		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("/ProjectBoardModify");
		m.addObject("bvo", vo);
		m.addObject("status",boardType);
		m.addObject("nowpagenum",nowpagenum);


		return m;
	}

	// ★ 팀 게시글 수정
	@RequestMapping("ProjectBoardUpdate")
	public String ProjectBoardUpdate(HttpSession session, BoardVO bvo, ReplyVO rvo){

		bvo.setMemberId((String)session.getAttribute("memberId"));
		rvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.ProjectBoardUpdate(bvo);

		return "redirect:ProjectBoardDetail.do?boardNo="+bvo.getBoardNo()+"&boardType="+rvo.getBoardType()+"&pageNo="+rvo.getPageNo();
	}
	///////////////////////////////////////////////



	
// 승민(아래)-------------------------------------------------------------
	
	// 게시판 내용 읽기
	@RequestMapping("boardView")
	public ModelAndView boardView(HttpSession session, BoardVO bvo){
		
		// 게시글 조회 수 +1
		bdao.boardCountPlus(bvo);
		// 게시글 조회
		BoardVO vo = bdao.boardView(bvo);
		// 게시글에 달린 댓글 리스트 조회
		List<ReplyVO> rList = bdao.replyList(bvo);
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/boardView");
		m.addObject("bvo", vo);
		m.addObject("rList", rList);
		
		return m;
	}
	
	// 게시글 수정
	@RequestMapping("boardUpdate")
	public String boardUpdate(HttpSession session, BoardVO bvo){
		
		bvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.boardUpdate(bvo);
		
		return "redirect:boardView.do?boardNo="+bvo.getBoardNo();
	}
	
	// 게시글 삭제
	@RequestMapping("boardDelete")
	public String boardDelete(HttpSession session, BoardVO bvo){
		
		bvo.setMemberId((String)session.getAttribute("memberId"));
		
		if(bvo.getBoardType().equals("version")){
			bvo.setMemberId(null);
			bdao.boardDelete(bvo);
			return "redirect:ProjectBoard.do?boardType=version";
		}
		
		bdao.boardDelete(bvo);
		
		return "/main/WindowClose";
	}
	
	// 댓글 삭제
	@RequestMapping("replyDelete")
	public String replyDelete(HttpSession session, ReplyVO rvo){
			
		rvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.replyDelete(rvo);
			
		return "redirect:boardView.do?boardNo="+rvo.getBoardNo();
	}
	
	// 댓글 달기
	@RequestMapping("replySave")
	public String replySave(HttpSession session, ReplyVO rvo){
		
		rvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.replySave(rvo);
		
		return "redirect:boardView.do?boardNo="+rvo.getBoardNo();
	}
	
	// 게시글 폼
	@RequestMapping("boardWriteForm")
	public String boardWriteForm(){
		return "/main/boardWrite";
	}
	
	// 게시글 작성
	@RequestMapping("boardWrite")
	public String boardWrite(HttpSession session, BoardVO bvo){
		
		// 게시판 XSS 취약점 방지
		if(bvo.getBoardContent().contains("script")){
			return "/main/boardWrite";
		}
		
		bvo.setMemberId((String)session.getAttribute("memberId"));
		bdao.boardWrite(bvo);
		
		return "/main/WindowClose";
	}
	
	// 게시판 리스트 페이지 요청
	@RequestMapping("boardList")
 	public ModelAndView boardList(HttpSession session, BoardVO bvo){
 		
 		// 세션 아이디값 얻어오기
 		if(session.getAttribute("memberId") ==null){
 			ModelAndView m = new ModelAndView();
 			m.setViewName("/main/main");
 			return m;
 		}
 		
 		// 기본 페이지
 		int pageNum = 1;
 		if(bvo.getPageNum() > 1){
 			pageNum = bvo.getPageNum();
 		}
 		
 		String memberId = (String)session.getAttribute("memberId");
 		
 		// DAO 호출 및 리턴값 받기
 		MemberVO mvo = mdao.memberInfo(memberId); // 멤버 정보
 		List<BoardVO> bList = bdao.allBoard(bvo); // 게시판 리스트
 		int pCnt = bdao.allBoardPage(); // 페이지 수
 		
 		// View 지정 및 데이터 전달
 		ModelAndView m = new ModelAndView();
		m.setViewName("/main/boardList");
		m.addObject("mvo", mvo);
		m.addObject("bList", bList);
		m.addObject("pCnt", pCnt);
		m.addObject("pageNum", pageNum);
 		
		return m;
 	}
	
	// 게시글 작성자 검색
	@RequestMapping("writerSearch")
	public ModelAndView writerSearch(HttpSession session, BoardVO bvo){
			
		String memberId = (String)session.getAttribute("memberId");
		
		// DAO 호출 및 리턴값 받기
		List<BoardVO> bList = bdao.writerSearch(bvo);
		MemberVO mvo = mdao.memberInfo(memberId);
		
		// View 지정 및 데이터 전달
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/boardList");
		m.addObject("mvo", mvo);
		m.addObject("bList", bList);
			
		return m;
	}
}
