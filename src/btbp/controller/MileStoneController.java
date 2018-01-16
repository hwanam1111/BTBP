package btbp.controller;

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
import btbp.dao.MileStoneDao;
import btbp.dao.ProjectDao;
import btbp.dao.ProjectMemberDao;
import btbp.model.FriendVO;
import btbp.model.JobVO;
import btbp.model.MileStoneVO;
import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;


@Controller
public class MileStoneController {

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
	private MileStoneDao mDao;
	
	//알파 카드  클릭했을 때
	@RequestMapping("modalMileStone.do")
	public ModelAndView clickMile(String cardTitle, String rowNo, MileStoneVO mvo, HttpSession session){
		int projectNo = (Integer)session.getAttribute("projectNo");
		mvo.setProjectNo(projectNo);
		String[] checked = new String[5];
		// checkList 가져옴
		List<MileStoneVO> mList = mDao.clickMile(mvo);
		MileStoneVO milestone = mDao.clickMileSelect(mvo);
		ModelAndView m = new ModelAndView();
		
		
		m.setViewName("modalMileStone");
		m.addObject("mList", mList);
		m.addObject("rowNo", rowNo);
		m.addObject("milestone", milestone); // Board_Card 에 있는 Data 값을 가져옴..
		m.addObject("checked", checked);
		return m;
	}
	
	// mileStone List Select 
	@RequestMapping("mileStone")
	public ModelAndView mileStone(HttpSession session, MileStoneVO mvo, ProjectMemberVO pvo){
		String memberId = (String)session.getAttribute("memberId");
		int projectNo = (int)session.getAttribute("projectNo");
		pvo.setMemberId(memberId);
		pvo.setProjectNo(projectNo);
		
//		System.out.println(projectNo);
		mvo.setProjectNo(projectNo);
		int doneRow = 0; // 이미 done 이 되어 있는 row의 갯수 값을 가져옴
		doneRow = mDao.mileStoneDoneCheck(mvo); // done 의 갯수를 DB에서 Return
		// projectNo 가져가기
		mvo.setProjectNo(projectNo);
		
		// 헤더 정보
		ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
		int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
		List<FriendVO> fList = fdao.myFriend(memberId); // 친구 리스트
		List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
		List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
		// 헤더 정보
		
		//DB에 있는 CPP_MILESTONE_BOARD, CPP_MILESTONE_BOARD_CARD  값 가져 오기(ALL SELECT)
		//1. CPP_MILESTONE_BOARD 값 SELECT
		List<MileStoneVO> mListBoard = mDao.mileStoneBoardSelect(mvo);
		//2. CPP_MILESTONE_BOARD_CARD 값 SELECT
		List<MileStoneVO> mListBoardCard = mDao.mileStoneBoardCardSelect(mvo);
		
		// 어쩔수 없이 여기서 String 배열 선언
		// DB에서 Join해서 가지고 올 수 있지만 매번 DB를 가는 것 보다는 Controller에서 값을 저장해서 html에서 뿌려 줌
		String[] Stakeholder = {"식별", "대표선출", "작업참여", "배포기준 합의", "배포합의", "사용만족"};
		String[] Chance = {"기회식별", "솔루션 필요성 확인", "솔루션 가치 확인", "솔루션 타당성 검증", "솔루션 개발", "이익 발생"};
		String[] Requirements = {"개념 정의","범위 정의", "요건정의", "요건합의", "요건구현", "니즈충족"};
		String[] SoftWareSystem = {"아키텍처 선정", "아키텍처 검증", "사용 가능", "배포준비","운영","운영 종료"};
		String[] Team = {"팀요건 정의", "팀구성","팀빌딩","작업수행","팀해산"};
		String[] Working = {"과업확정","사전준비","작업시작","작업진행","목표달성","작업종료"};
		String[] WorkingMethod={"원칙 수립","작업방식 확정","시범적용","전체적용","작업방식 내재화","사용종료"};
		
		// return 할 ModelAndView 생성
		ModelAndView m = new ModelAndView();
		m.setViewName("MileStone");
		m.addObject("Stakeholder", Stakeholder);
		m.addObject("Chance", Chance);
		m.addObject("Requirements", Requirements);
		m.addObject("SoftWareSystem", SoftWareSystem);
		m.addObject("Team", Team);
		m.addObject("Working", Working);
		m.addObject("WorkingMethod", WorkingMethod);
		m.addObject("mListBoard", mListBoard);	
		m.addObject("mListBoardCard", mListBoardCard);
		m.addObject("doneRow", doneRow);
		
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
	
	// mileStone 저장 버튼 클릭시,
	@RequestMapping("mileStoneSave")
	public ModelAndView mileStoneSave(HttpSession session, String rowNum, MileStoneVO mvo, MileStoneVO mvo2,  String rowNameArr, String Insert_CardNo, String Insert_RowNo){
		int projectNo = (int)session.getAttribute("projectNo");
		int rowNumber = 0;	// 저장 시 화면에 있는 총 row의 갯수
		// 삭제 행을 리턴 받기 위한 변수 선언
		// 입력 행을 리턴 받기 위한 변수 선언
		int doneRow = 0; // 이미 마일스톤 완료 처리가 된 row의 갯수
		int insertBoard = 0; // 입력된 Board의 갯수
		int insertBoardCard = 0; // 입력된 BoardCard의 갯수
		
		// 배열 parameter 배열에다가 담아주기
		String[] ArrRowName = rowNameArr.split(",");
		String[] ArrCardNo = Insert_CardNo.split(",");
		String[] ArrRowNo = Insert_RowNo.split(",");
		mvo.setProjectNo(projectNo);
		// 1. 기존에 있는 Doing 삭제
		// 무결성 제약 조건에 의해서 먼저 BoardCard를 삭제 후, Board를 삭제 삭제 기준은 Doing 이냐 아니냐에 따라 결정
		rowNumber = Integer.parseInt(rowNum);
		doneRow = mDao.mileStoneDoneCheck(mvo);
		 mDao.mileStoneBoardCardDelete(projectNo);
		 mDao.mileStoneBoardDelete(projectNo);
//		System.out.println("doneRow 값"+ doneRow);
		// 2. 입력cardNoArr
		// 무결성 제약 조건에 의해서 Board를 입력 후 BoardCard 를 입력

		
		for(int i= doneRow+1; i<=rowNumber; i++){
			// 2.1. Board  입력 -- (총 row 개수 - done인 row) 갯수 계산해서 doing인 card Insert
			mvo.setProjectNo(projectNo);
			mvo.setRowName(ArrRowName[i-1]); // 각 row에 대한 Name을 VO에 저장
			mvo.setRowNo(i); // row number 를 VO에 저장
			mDao.mileStoneBoardInsert(mvo); // Dao 로 VO를 가지고 전송 
			
			// 2.2 BoardCard 입력 -- 값을 가져와 
			for(int j=0; j<ArrCardNo.length;j++){
				if( !ArrRowNo[j].equals("") && i == Integer.parseInt(ArrRowNo[j]) ){
					mvo2.setProjectNo(projectNo);
					mvo2.setRowNo(Integer.parseInt(ArrRowNo[j]));
					mvo2.setCardNo(ArrCardNo[j]);
					insertBoardCard = mDao.mileStoneBoardCardInsert(mvo2);
				}
			}
		}
		// 저장 확인 
		ModelAndView m = new ModelAndView(); // ModelAndView 생성
		m.setViewName("redirect:mileStone.do"); // redirect로 다시 select 
		return m; 
	}
	
	//마일스톤 완료  버튼 클릭 시,그 행에 대한 값을 삭제 해주고 입력 해줌
	@RequestMapping("mileStoneComplete")
	public ModelAndView miletoneComplete(String rowName, String rowNo, String cardNoArr, MileStoneVO mvo, HttpSession session){
		int rowNumber = Integer.parseInt(rowNo);
		int projectNo = (int)session.getAttribute("projectNo");
		String[] arrCardNo =  cardNoArr.split(",");

		mvo.setRowNo(rowNumber);
		mvo.setProjectNo(projectNo);
		mvo.setRowName(rowName);
		
		// 해당 row 삭제
		// 1. Board_card 삭제
		mDao.mileStoneComplete_BoardCardDelete(mvo);
		// 2. Board 삭제
		mDao.mileStoneComplete_BoardDelete(mvo);
		
		// 해당 row 입력S
		// 3. Board 입력
		mDao.mileStoneComplete_BoardInsert(mvo);
		// 4. Board_Card 입력
		for(int i = 0; i<arrCardNo.length; i++){
			mvo.setCardNo(arrCardNo[i]);
			mDao.mileStoneComplete_BoardCardInsert(mvo);
		}
		
		ModelAndView m = new ModelAndView(); // ModelAndView 생성
		m.setViewName("redirect:mileStone.do"); // redirect로 다시 select 
		return m; 
	}
	
	// 알파 완료된 알파 카드의 point 값을 입력 
	@RequestMapping("modalMileStoneInsertCheck")
	public ModelAndView modalMileStoneInsert( HttpSession session, String checkPointArray, String cardNoArr, String scoreArr, String rowNoArr, MileStoneVO mvo){
		
		
		int projectNo = (int)session.getAttribute("projectNo");
		String[] arrCheckPointArr = checkPointArray.split(",");
		String arrCardtitle = cardNoArr;
		String[] arrScore = scoreArr.split(",");
		String[] arrRowNo = rowNoArr.split(",");
		
		for(int i=0; i<arrCheckPointArr.length; i++){
			
			mvo.setCheckPointName(arrCheckPointArr[i]);
			mvo.setCardTitle(arrCardtitle);
			mvo.setScore(Integer.parseInt(arrScore[i]));
			mvo.setRowNo(Integer.parseInt(arrRowNo[i]));
			mvo.setProjectNo(projectNo);
			mDao.mileStoneScore_Insert(mvo);

		}
		
		ModelAndView m = new ModelAndView(); // ModelAndView 생성
		m.setViewName("redirect:mileStone.do"); // redirect로 다시 select 
		return m; 
	}
	
	
	// 마일스톤 완료 버튼 클릭시 생기는 오른쪽 버튼 에 대한 이벤트 controller
	@RequestMapping("MileStoneGoodAndBad")
	public ModelAndView MileStoneGoodAndBad(MileStoneVO mvo, HttpSession session){
		int projectNo = (int)session.getAttribute("projectNo");
		MileStoneVO mileStone = null;
		List<MileStoneVO>  list = null;
		mvo.setProjectNo(projectNo);
		mileStone = mDao.mileStoneGoodAndBad_Select(mvo);
		list	  =	mDao.mileStoneGoodAndBad_BoardCardSelect(mvo);
		ModelAndView m = new ModelAndView(); // ModelAndView 생성
		m.setViewName("test"); // redirect로 다시 select 
		m.addObject("mileStone", mileStone); 
		m.addObject("list", list);
		return m; 
		
	}
	
	// 좋은점 나쁜점 입력하기 
	@RequestMapping("MileStoneGoodAndBad_Insert")
	public ModelAndView MileStoneGoodAndBad_Insert(MileStoneVO mvo, HttpSession session){
		int projectNo = (int)session.getAttribute("projectNo");
		mvo.setProjectNo(projectNo);
		mDao.mileStoneGoodAndBad_Insert(mvo);
		
		ModelAndView m = new ModelAndView(); // ModelAndView 생성
		m.setViewName("redirect:MileStoneGoodAndBad.do"); // redirect로 다시 select 
		m.addObject("rowNo",mvo.getRowNo());
		m.addObject("rowName",mvo.getRowName());
		return m; 
	}
}

