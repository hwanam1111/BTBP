package btbp.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
public class FileShareController {

	@Autowired
	private BoardDao bdao;
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
	private FileShareDao Fdao;
	
	@RequestMapping("FileShare")
	public ModelAndView fileShareView(String pageno, HttpSession session, ProjectMemberVO pvo, BoardVO boardvo){
		
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

		int startRecord = nowpagenum*7-(7-1);
		int endRecord = nowpagenum*7;

		boardvo.setStartRecord(startRecord);
		boardvo.setEndRecord(endRecord);

		int totalPage = bdao.boardCount(boardvo);//전체 글의 갯수

		List<BoardVO> bList =Fdao.fileSharePagingView(boardvo);
		
		// View 지정 및 데이터 전달
		ModelAndView m = new ModelAndView();
		m.setViewName("/FileShare");
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
		
		return m;
	}
	
	// +(추가 버튼)을 눌렀을 때 page 전환
	public ModelAndView fileShareInsertView(){
		
		ModelAndView m = new ModelAndView();
		m.setViewName("FileShareView");
		
		return m;
	}
	// 각 글을 눌렀을 때 view 페이지 보이기
	@RequestMapping("FileShareDetail")
	public ModelAndView FileShareDetail(BoardVO bvo, HttpSession session, ProjectMemberVO pvo){	
		
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
		BoardVO vo = Fdao.fileShareDetail(bvo);
		// 게시글에 달린 댓글 리스트 조회
		List<ReplyVO> rList = bdao.ProjectReplyList(bvo);
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("/FileShareDetail");
		m.addObject("BoardVO", boardVO);
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
	
//	 각 글에 대해서 삭제 하기
	@RequestMapping("fileShareDelete")
	public String fileShareDelete(BoardVO bvo, String StringBoardNo, HttpSession session ){	
		
//		String[] arrBoardNo = StringBoardNo.split(",");
		String type = bvo.getBoardType();
		
		bvo.setMemberId((String)session.getAttribute("memberId"));	
		
//		for(int i=0; i<arrBoardNo.length; i++){		
//			bvo.setBoardNo(Integer.parseInt(arrBoardNo[i]));
//			 Fdao.fileShareDelete(bvo);
//		}
		
		if(StringBoardNo!=null){
			String[] arrBoardNo = StringBoardNo.split(",");

			for(int i=0; i<arrBoardNo.length;i++){
//				System.out.println("지울번호"+arrBoardNo[i]);
				bvo.setBoardNo(Integer.parseInt(arrBoardNo[i]));

				Fdao.fileShareDelete(bvo);
			}


		}else{
			Fdao.fileShareDelete(bvo);
		}
		
		
			return "redirect:FileShare.do?boardType="+type+"&pageNo="+bvo.getPageNo();
	}
	
	
	// ★ 팀 게시글 폼
	@RequestMapping("fileShareInsertForm")
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
		m.setViewName("/FileShareInsert");
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
	
		// 파일 삽입 insert
		@RequestMapping("fileShareInsertCheck")
		public String fileShareInsert( BoardVO bvo, HttpSession session ){
//			int result = 0;
//			// VO에 memberId, projectNo 삽입
//			int projectNo = (int)session.getAttribute("projectNo");
//			String memberId = (String)session.getAttribute("memberId");
			

			bvo.setMemberId((String)session.getAttribute("memberId"));
			bvo.setProjectNo((int)session.getAttribute("projectNo"));
			
			// db에 insert
			Fdao.fileShareInsert(bvo);
	
			return "redirect:FileShare.do?boardType="+bvo.getBoardType()+"&pageNo="+1;
		}
		
		// 파일 다운로드 
		@RequestMapping("fileDownload")
		public ModelAndView fileDownload(  HttpServletRequest request,  ModelMap model, BoardVO bvo) throws Exception {
		    BoardVO boardVO = null;       
		              
		    /** 첨부파일 상세정보 가져오기 */
		   
		    boardVO = Fdao.fileShareDetail(bvo);
		 
		    /** 첨부 파일 정보 */
		    HashMap<String, Object> fileInfo = new HashMap<String, Object>();
		 
		    fileInfo.put("fileUploadPath", boardVO.getFilePath());
		    fileInfo.put("fileLogicName", boardVO.getFileName());
		    fileInfo.put("filePhysicName", boardVO.getFileSaveName());
		 
		    return new ModelAndView("fileDownloadView", "downloadFile", fileInfo);
		}
		
		@RequestMapping("nextPage")
		public ModelAndView fileDownload( BoardVO bvo ){
		BoardVO boardVO;
			
		boardVO = Fdao.fileShareNextDetail(bvo);
		
		// 리턴 셋팅
		ModelAndView m = new ModelAndView();
		m.setViewName("FileShareDetail");
		m.addObject("BoardVO", boardVO);
			
			return m;
		}
		
		// search 를 통해 아이디 찾기
		// 나중에 Ajax로 바꾸어야 함!
		@RequestMapping("fileShareSearch")
		public ModelAndView fileShareSearch(String search, HttpSession session){
			List<BoardVO> bList;
			String searchPlusCheck = "%"+search+"%";
			HashMap map = new HashMap<>();
			int projectNo = (int)session.getAttribute("projectNo");
			int nowpagenum=1;
	        int startRecord = nowpagenum*10-(10-1);
	        int endRecord = nowpagenum*10;

	        // hashMap에 paging 정보, search 내용, projectNo를 삽입
	        map.put("startrecord", startRecord);
		    map.put("endrecord", endRecord);
			map.put("projectNo", projectNo);
			map.put("search", searchPlusCheck);
			
			bList = Fdao.fileShareSearch(map);
			
			ModelAndView m = new ModelAndView();
			m.setViewName("FileShare");
			m.addObject("bList", bList);
				
				return m;
		}
		
			
}
