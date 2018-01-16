package btbp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.FriendDao;
import btbp.dao.MemberDao;
import btbp.dao.MessageDao;
import btbp.model.FriendVO;
import btbp.model.MemberVO;

@Controller
public class FriendController {

	@Autowired
	private FriendDao fdao;
	@Autowired
	private MemberDao mdao;
	@Autowired
	private MessageDao msgdao;

	// 친구 추가 창 띄우기
	@RequestMapping("friendAddModal")
 	public String friendAddModal(){
 		return "/main/friendAddModal";
 	}
	
	// 친구 아이디 조회
	@RequestMapping("friendSelect")
	public ModelAndView friendSelect(FriendVO fvo, HttpSession session){
		
		String friendId = fvo.getFriendId();
		String result = "검색결과가 없습니다.";
		String memberId = (String)session.getAttribute("memberId");
		
		MemberVO mvo = fdao.friendSelect(friendId);
		
 		ModelAndView m = new ModelAndView();
 		m.setViewName("/main/friendAddModal");
 		if(mvo == null){
 			m.addObject("result", result);
 		} else if(friendId.equals(memberId)){
 			result = "자신의 아이디는 친구추가 할 수 없습니다.";
 			mvo.setMemberName(null);
 			m.addObject("result", result);
 		}
 		m.addObject("mvo", mvo);
 		m.addObject("friendId", friendId);
 		
 		return m;
		
	}	
	
	// 친구 추가하기
	@RequestMapping("friendAdd")
	public ModelAndView friendAdd(HttpSession session, FriendVO fvo){
		
		String memberId = (String)session.getAttribute("memberId");
		fvo.setMemberId(memberId);

		ModelAndView m = new ModelAndView();
 		m.setViewName("/main/friendAddModal");
 		
		
		String addResult = fdao.friendAdd(fvo);
		
 		m.addObject("friendId", fvo.getFriendId());
 		m.addObject("addResult", addResult);
 		
 		return m;
	}
	
	// 프로젝트 멤버창 - 친구 추가하기
	@RequestMapping("friendAdd2")
	public String friendAdd2(HttpSession session, FriendVO fvo){
			
		String memberId = (String)session.getAttribute("memberId");
		fvo.setMemberId(memberId);
		
		fdao.friendAdd(fvo);
		
		return "redirect:ProjectMemberInfo.do?friendId="+fvo.getFriendId();
	}
	
	// 친구 삭제하기
	@RequestMapping("friendRemove")
	public ModelAndView friendRemove(HttpSession session, FriendVO fvo, String page){
			
			String memberId = (String)session.getAttribute("memberId");
			fvo.setMemberId(memberId);
			fdao.friendRemove(fvo);
			
			List<FriendVO> fList = fdao.myFriend(memberId);
			
			ModelAndView m = new ModelAndView();
			m.setViewName("/main/WindowForward");
			m.addObject("fList", fList);
			
			if(page.equals("list")){
				m.setViewName("redirect:friendList.do");
			} else if(page.equals("project")){
				m.setViewName("redirect:ProjectMemberInfo.do?friendId="+fvo.getFriendId());
			}
			
		 	return m;
	}
	
	// 전체 친구 목록 조회
	@RequestMapping("friendList")
	public ModelAndView friendList(HttpSession session){
		
		String memberId = (String)session.getAttribute("memberId");
		List<FriendVO> fList = fdao.myFriend(memberId); // 내 친구 목록
		List<FriendVO> nfList = fdao.nfriendList(memberId); // 나를 등록한 친구
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/friendList");
		m.addObject("fList", fList);
		m.addObject("nfList", nfList);
		
	 	return m;
	}
	
	// 메인화면 - 메세지 보낸 친구 목록 조회
		@RequestMapping("MessageBox")
		public ModelAndView messageBox(HttpSession session){
			
			String memberId = (String)session.getAttribute("memberId");
			List<FriendVO> fList = fdao.messageBox(memberId);
			
			ModelAndView m = new ModelAndView();
			m.setViewName("/main/MessageBox");
			m.addObject("fList", fList);
			
		 	return m;
		}
	
	// 친구이름 검색
	@RequestMapping("friendNameSearch")
	public ModelAndView friendNameSearch(HttpSession session, MemberVO mvo){
		String memberId = (String)session.getAttribute("memberId");
		mvo.setMemberId(memberId);
		
		List<FriendVO> fList = fdao.myFriend(mvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/friendList");
		m.addObject("fList", fList);
		
		if(mvo.getMemberName().equals("")){
			m.setViewName("redirect:friendList.do");
		}
		
	 	return m;
	}
	
}
