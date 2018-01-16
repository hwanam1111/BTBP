package btbp.controller;

import java.util.HashMap;
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
import btbp.dao.KanbanDao;
import btbp.dao.MemberDao;
import btbp.dao.MessageDao;
import btbp.dao.ProjectDao;
import btbp.dao.ProjectMemberDao;
import btbp.model.FriendVO;
import btbp.model.JobVO;
import btbp.model.KanbanVO;
import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;


@Controller

public class KanbanController {

	@Autowired
	private KanbanDao dao;
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
	
	
	//---------------KPT
		//처음 페이지 진입
		@RequestMapping("KPT")
		public ModelAndView startKPT(HttpSession session, ProjectMemberVO pvo){
			
			String memberId = (String)session.getAttribute("memberId");
			int projectNo = (int)session.getAttribute("projectNo");
			pvo.setMemberId(memberId);
			pvo.setProjectNo(projectNo);
			
			List<KanbanVO> kptList = dao.startKPT(projectNo);
			
			// 헤더 정보
			ProjectVO pInfo = pdao.projectInfo(pvo); // 프로젝트 정보
			List<ProjectMemberVO> pList = pmdao.projectMemberList(pvo); // 프로젝트 멤버 리스트
			int noReadMsg = msgdao.noReadMsg(memberId); // 읽지 않는 메세지 수
			List<FriendVO> fList = fdao.myFriend(memberId);
			List<JobVO> newJobList = jdao.newJobList(pvo); // 새로 등록된 업무
			List<JobVO> endJobList = jdao.endJobList(pvo); // 종료3일 남은 업무
			// 헤더 정보
			
			ModelAndView m = new ModelAndView();
			m.setViewName("KPT");
			m.addObject("kptList", kptList);
			
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
		
		@RequestMapping("addKPT.do")
		public String addKPT(KanbanVO kvo,HttpSession session){
			
			int projectNo=(int)session.getAttribute("projectNo");
			String memberId = (String)session.getAttribute("memberId");
			kvo.setProjectNo(projectNo);
			kvo.setMemberId(memberId);
			dao.addKPT(kvo);
			
			
			
			return "redirect:KPT.do";
		}
		
		@RequestMapping("deleteAllKPT.do")
		public String deleteAllKPT(String jobStatus,HttpSession session){
			int projectNo=(int)session.getAttribute("projectNo");
			
			HashMap<String, Object> hash= new HashMap<>();
			hash.put("jobStatus", jobStatus);
			hash.put("projectNo", projectNo);
			
			dao.deleteAllKPT(hash);
			
			return "redirect:KPT.do";
		}
		
		@RequestMapping("modifyKpt.do")
		public String modifyKpt(KanbanVO kanvo){
			
			dao.modifyKPT(kanvo);
			
			return "redirect:KPT.do";
		}
		
		@RequestMapping("deleteKpt.do")
		public String deleteKpt(KanbanVO kanvo){
			
			dao.deleteKPT(kanvo);
			
			return "redirect:KPT.do";
		}
	
}
