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
import btbp.model.FriendVO;
import btbp.model.MemberVO;
import btbp.model.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageDao msgdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private FriendDao fdao;
	
	@Autowired
	private BoardDao bdao;

	// 1:1 대화창 내용 조회
		@RequestMapping("messageContent")
		public ModelAndView messageContent(HttpSession session, MessageVO mvo){
			
			String memberId = (String)session.getAttribute("memberId");
			mvo.setSendId(memberId);
			
			List<MessageVO> mList = msgdao.msgList(mvo);
			MemberVO mInfo = mdao.memberInfo(mvo.getSendId());
			MemberVO fInfo = mdao.memberInfo(mvo.getReceiveId());
			
			ModelAndView m = new ModelAndView();
			m.setViewName("/main/MessageContent");
			m.addObject("mList", mList);
			m.addObject("mInfo", mInfo);
			m.addObject("fInfo", fInfo);
			
			return m;
		}
	
	// 1:1 대화창 페이지
	@RequestMapping("messagePage")
	public ModelAndView messagePage(HttpSession session, MessageVO mvo){
		
		String memberId = (String)session.getAttribute("memberId");
		mvo.setSendId(memberId);
		
		MemberVO mInfo = mdao.memberInfo(mvo.getSendId());
		MemberVO fInfo = mdao.memberInfo(mvo.getReceiveId());
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/main/MessagePage");
		m.addObject("mInfo", mInfo);
		m.addObject("fInfo", fInfo);
		
		return m;
	}
	
	// 대화창 - 메세지 보내기
	@RequestMapping("msgSend")
	public void msgSend(HttpSession session, MessageVO mvo){
		
		String memberId = (String)session.getAttribute("memberId");
		mvo.setSendId(memberId);
		int result = msgdao.msgSend(mvo);
		
//	 	return "redirect:messagePage.do?receiveId="+mvo.getReceiveId();
	}
	
	// 메인페이지 - 메세지 보내기
	@RequestMapping("msgSendMain")
	public String msgSendMain(HttpSession session, MessageVO mvo){
		
		mvo.setSendId((String)session.getAttribute("memberId"));
		msgdao.msgSend(mvo);
		
	 	return "/main/WindowForward";
	}
	
}
