package btbp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.BoardDao;
import btbp.dao.FriendDao;
import btbp.dao.MemberDao;
import btbp.dao.MessageDao;
import btbp.model.BoardVO;
import btbp.model.EmailSender;
import btbp.model.FriendVO;
import btbp.model.MemberVO;
import btbp.model.ProjectVO;

@Controller
public class MainController{
     
	@Autowired
	MemberDao mdao;
	@Autowired
	MessageDao msgdao;
	@Autowired
	BoardDao bdao;
	@Autowired
	FriendDao fdao;
	@Autowired
    EmailSender emailSender;
	
	// 1. 메인 페이지 이동
    @RequestMapping("main")
    public String main(HttpSession session) {
    	if(session.getAttribute("memberId") !=null){
    		mdao.memberLogout((String)session.getAttribute("memberId"));
    	}	
    	// 세션을 삭제함
    	session.removeAttribute("memberId");
    	return "/main/main";
    }
     
	// 2. 로그인 페이지 이동
 	@RequestMapping("MemberLoginPage")
 	public String memberLoginPage(){
 		return "/main/MemberLoginPage";
 	}
 	
 	// 3. 로그인 완료
 	@RequestMapping("MemberLogin")
 	public ModelAndView memberLogin(MemberVO mvo, HttpSession session){
 		MemberVO vo = mdao.memberLogin(mvo);
 		ModelAndView m = new ModelAndView();
 		if(vo == null) {
 			m.addObject("result", "로그인 정보가 일치하지 않습니다.");
 			m.setViewName("/main/MemberLoginPage");
 		} else {
 			mdao.memberLoginOk(vo.getMemberId()); // 로그인 정보 테이블에 입력
 			session.setAttribute("memberId", vo.getMemberId());
 			session.setAttribute("mvo", vo);
 			m.addObject("mvo", vo);
 			m.setViewName("/main/WindowForward");
 		}
 		return m;
 	}
 	
 	// 4. 회원가입 페이지 이동
 	@RequestMapping("MemberSavePage")
 	public String memberSavePage(){
 		return "/main/MemberSavePage";
 	}
 	
 	// 5. 아이디 중복 체크
 	@RequestMapping("MemberIdCheck")
 	public ModelAndView memberIdCheck(MemberVO mvo){
 		int result = 0;
 		String result_str ="(사용 가능한 아이디입니다.)";
 		MemberVO vo = mdao.memberIdCheck(mvo);
 		if(vo != null) {
 			result=1;
 			result_str = "(사용중인 아이디입니다.)";
 		}
 		ModelAndView m = new ModelAndView();
 		m.addObject("memberId", mvo.getMemberId());
 		m.addObject("result", result);
 		m.addObject("result_str", result_str);
		m.setViewName("/main/MemberSavePage");
 		return m;
 	}
 	
 	// 6. 회원가입 완료
 	@RequestMapping("MemberSave.do")
 	public String memberSave(MemberVO mvo){
 		int result = mdao.memberSave(mvo);
 		return "/main/WindowClose";
 	}
 	
 	// 7. 로그인 메인 페이지 이동
 	@RequestMapping("LoginMain")
 	public ModelAndView loginMain(HttpSession session, BoardVO bvo){
 		
 		// 세션 아이디값 얻어오기
 		if(session.getAttribute("memberId") ==null){
 			ModelAndView m = new ModelAndView();
 			m.setViewName("/main/main");
 			return m;
 		}
 		
 		String memberId = (String)session.getAttribute("memberId");
 		bvo.setPageNum(1);
 		
 		// DAO 호출 및 리턴값 받기
 		MemberVO mvo = mdao.memberInfo(memberId);
 		List<ProjectVO> pList = mdao.memberProject(memberId);
 		List<BoardVO> bList = bdao.allBoard(bvo);
 		List<FriendVO> fList = fdao.myFriend(memberId);
 		int noReadMsg = msgdao.noReadMsg(memberId);
 		
 		// View 지정 및 데이터 전달
 		ModelAndView m = new ModelAndView();
		m.setViewName("/main/LoginMain");
		m.addObject("mvo", mvo);
		m.addObject("pList", pList);
		m.addObject("bList", bList);
		m.addObject("fList", fList);
		m.addObject("noReadMsg", noReadMsg);
 		
		return m;
 	}
 	
 	// 8. 친구 초대 메일 보내기
 	@RequestMapping("inviteMail")
 	public String sendEmailAction(String emailAddr) throws Exception{
 			
		emailSender.sendEmail(emailAddr);
 		
 		return "redirect:main.do";
 	}
 	
 	
 	// 9. 아이디 찾기
 	@RequestMapping("idSearch")
 	public ModelAndView idSearch(String page, MemberVO mvo){
 		
 		ModelAndView m = new ModelAndView();
 		m.setViewName("/main/idSearch");
 		
 		if(page.equals("search")){
 			MemberVO vo = mdao.memberIdSearch(mvo);
 			if(vo==null){
 				m.addObject("result", "입력하신 정보가 일치하지 않습니다.");
 			} else {
 				m.addObject("result", "아이디 : "+vo.getMemberId());
 			}
 		}
 		
 		return m;
 	}
 	
 	// 10. 비밀번호 찾기
  	@RequestMapping("pwSearch")
  	public ModelAndView pwSearch(String page, MemberVO mvo) throws Exception {
  		
  		ModelAndView m = new ModelAndView();
 		m.setViewName("/main/pwSearch");
  		
 		if(page.equals("search")){
 			MemberVO vo = mdao.memberPwSearch(mvo);
 			if(vo==null){
 				m.addObject("result", "입력하신 정보가 일치하지 않습니다.");
 			} else {
 				emailSender.sendPwEmail(vo);
 				m.addObject("result", "회원님의 이메일로 비밀번호가 발송 되었습니다.");
 			}
 		}
  		
  		return m;
  	}
 		 
}