package btbp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import btbp.dao.ChattingDao;
import btbp.model.ChattingVO;

@Controller
public class ChattingController {

	@Autowired
	private ChattingDao cdao;
	
	// 팀 채팅 내용을 조회한다!
	@RequestMapping("chatContent")
	public ModelAndView chatContent(ChattingVO cvo){
		
		List<ChattingVO> cList =  cdao.chatList(cvo);
		
		ModelAndView m = new ModelAndView();
		m.setViewName("chatContent");
		m.addObject("cList", cList);
		
		return m;
	}
	
	// 팀 채팅 내용을 입력한다!
	@RequestMapping("chatSend")
	public void chatSend(ChattingVO cvo, HttpSession session){
		cvo.setMemberId((String)session.getAttribute("memberId"));
		cdao.chatSend(cvo);
	}

}
