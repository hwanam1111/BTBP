package btbp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.MemberDao;
import btbp.model.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberDao mdao;
	
	// 회원정보 수정 시
	@RequestMapping("MemberInfoUpdate")
	public String memberInfoUpdate(HttpSession session, MemberVO mvo){
		
		// 회원정보 수정 시 정보세션 삭제 후 재등록
		MemberVO vo = mdao.memberInfo((String)session.getAttribute("memberId"));
		session.removeAttribute("mvo");
		session.setAttribute("mvo", vo);
		
		mdao.memberInfoUpdate(mvo);
		return "/main/WindowClose";
	}
	
	// 마이페이지 요청 시
	@RequestMapping("MyPage")
	public ModelAndView myPage(HttpSession session){
		
		MemberVO mvo = mdao.memberInfo((String)session.getAttribute("memberId"));
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/MyPage");
		m.addObject("mvo", mvo);
		
		return m;
	}
	
	// 비밀번호 변경 시
	@RequestMapping("memberPwChgOk")
	public ModelAndView memberPwChg(HttpSession session, MemberVO mvo){
		
		mvo.setMemberId((String)session.getAttribute("memberId"));
		
		int result = 0;
		result = mdao.memberPwChg(mvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/memberPwChg");
		m.addObject("result", result);
		
		return m;
	}
	
	// 비밀번호 변경 페이지 요청 시
	@RequestMapping("memberPwChg")
	public String memberPwChg(){
		return "/main/memberPwChg";
	}
	
	// 회원 탈퇴 페이지 요청 시
	@RequestMapping("memberOutPage")
	public String memberOutPage(){
		return "/main/memberOutPage";
	}
	
	// 회원 탈퇴 시
	@RequestMapping("memberOut")
	public ModelAndView memberOut(HttpSession session, MemberVO mvo){
		
		mvo.setMemberId((String)session.getAttribute("memberId"));
		
		int result = 0;
		result = mdao.memberOut(mvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/memberOutPage");
		m.addObject("result", result);
		
		return m;
	}
}
