package btbp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.FriendDao;
import btbp.dao.MemberDao;
import btbp.dao.ProjectMemberDao;
import btbp.model.FriendVO;
import btbp.model.MemberVO;
import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;

@Controller
public class ProjectMemberController {

	@Autowired
	private FriendDao fdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private ProjectMemberDao pmdao;
	
	// 프로젝트 관리자 변경
	@RequestMapping("PMtransferOk")
	public String pMtransferOk(HttpSession session, ProjectMemberVO pvo){
		
		System.out.println("프로젝트 관리자 변경 작업 실행 : ProjectMemberController.pMtransferOk() ");
		
		pvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		try {
			pmdao.pMtransfer(pvo, (String)session.getAttribute("memberId"));
		} catch (Exception e) {
			System.out.println("프로젝트 관리자 변경 오류 : ProjectMemberController.pMtransferOk() ");
			e.printStackTrace();
		}
		
		return "/main/WindowClose";
	}
	
	// 프로젝트 관리자 변경 창
	@RequestMapping("PMtransfer")
	public ModelAndView pMtransfer(HttpSession session, ProjectMemberVO pvo){
		
		List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("PMtransfer");
		m.addObject("pList", pList);
		
		return m;
	}
	
	// 프로젝트 멤버 상세정보 보기
	@RequestMapping("ProjectMemberInfo")
	public ModelAndView projectMemberInfo(HttpSession session, FriendVO fvo){
		
		fvo.setMemberId((String)session.getAttribute("memberId"));
		
		MemberVO mInfo = mdao.memberInfo(fvo.getFriendId());
		List<ProjectVO> pList = fdao.togetherProject(fvo);
		int friendCheck = fdao.friendAddCheck(fvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("ProjectMemberInfo");
		m.addObject("mInfo", mInfo);
		m.addObject("pList", pList);
		m.addObject("friendCheck", friendCheck);
		
		return m;
	}
	
	// 프로젝트 멤버 등급 수정
	@RequestMapping("MemberGradeUpdate")
	public String memberGradeUpdate(HttpSession session, ProjectMemberVO pmvo){
		
		pmvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		pmdao.memberGradeUpdate(pmvo);
		
		return "redirect:ProjectMember.do";
	}
	
	// 프로젝트 멤버 삭제
	@RequestMapping("MemberDel")
	public String projectMemberDelete(HttpSession session, ProjectMemberVO pmvo){
		
		pmvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		pmdao.projectMemberDelete(pmvo);
		
		if(pmvo.getMemberId().equals((String)session.getAttribute("memberId"))){
			return "redirect:LoginMain.do";
		}
		
		return "redirect:ProjectMember.do";
	}
	
	// 프로젝트 멤버 추가
	@RequestMapping("MemberAddInsert")
	public ModelAndView memberAddInsert(HttpSession session, ProjectMemberVO pmvo){
		
		pmvo.setProjectNo((int)session.getAttribute("projectNo"));
		
		int result =pmdao.memberAddInsert(pmvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("MemberAdd");
		if(result > 0) {
			m.addObject("addResult", "프로젝트 멤버에 추가 되었습니다.");
		} else {
			m.addObject("addResult", "프로젝트 멤버 추가 실패하였습니다.");
		}
		
		return m;
	}
	
	// 프로젝트 멤버 초대 아이디조회
	@RequestMapping("MemberAddSelect")
	public ModelAndView memberAdd(HttpSession session, String memId, ProjectMemberVO pmvo){
		
		pmvo.setProjectNo((int)session.getAttribute("projectNo"));
		pmvo.setMemberId(memId);

		int result = pmdao.projectMain(pmvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("MemberAdd");
		
		if(result > 0){
			m.addObject("result", "이미 프로젝트 멤버입니다.");
			return m; 
		} else {
			MemberVO mvo = fdao.friendSelect(pmvo.getMemberId());

			if(mvo == null){
				m.addObject("result", "검색결과가 없습니다.");
				return m; 
			} else {
				m.addObject("mInfo", mvo);
				return m;
			}
		}
		
	}
}
