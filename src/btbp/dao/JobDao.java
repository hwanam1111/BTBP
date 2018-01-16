package btbp.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.JobVO;
import btbp.model.ProjectMemberVO;

@Repository
public class JobDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 칸반 작업 전체 삭제
   public void kanbanAlldel(JobVO jvo){
	   ss.delete("kanbanAlldel", jvo);
   }
   
   //-----------------------------------------
   //나의 칸반 전체 리스트
   	public List<JobVO> startMyKanban(HashMap<String, Object> hash){
		 return ss.selectList("myKanban",hash);
	   }
   	//나의 게시글 전체 리스트
	   public List<JobVO> myWork(HashMap<String, Object> hash){
		   return ss.selectList("myWork",hash);
	   }
	   //프로젝트 파일 리스트
	   public List<JobVO> projectFile(HashMap<String, Object> hash){
		   return ss.selectList("projectFile",hash);
	   }
	   
	   //나의 칸반 게시글 수
	   public int countMyKanban(HashMap<String, Object> hash){
		   return ss.selectOne("countmyKanban",hash);
	   }
	   //나의 게시글 수
	   public int countMyWork(HashMap<String, Object> hash){
		   return ss.selectOne("countmyWork",hash);
	   }
	  
	   
	   
   //-----------------------------------------
   
	   // 오늘 등록된 업무 리스트
	   public List<JobVO> newJobList(ProjectMemberVO pvo){
		   return ss.selectList("newJobList", pvo);
	   }	
	   
	   // 종료 3일 남은 업무 리스트
	   public List<JobVO> endJobList(ProjectMemberVO pvo){
		   return ss.selectList("endJobList", pvo);
	   }
	   
   // 업무 리스트 보기
   public List<JobVO> jobList(ProjectMemberVO pvo){
	   return ss.selectList("projectJobList", pvo);
   }
   
   // 업무 상세정보 보기
   public JobVO jobInfo(JobVO jvo){
	   return ss.selectOne("jobInfo", jvo);
   }
   
   // 간트 리스트
   public List<JobVO> ganttList(ProjectMemberVO pvo){
	   return ss.selectList("ganttList", pvo);
   }
   
   // 칸반 리스트
   public List<JobVO> kanbanList(ProjectMemberVO pvo){
	   return ss.selectList("kanbanList", pvo);
   }
   
   // 칸반 상태 업데이트
   public void kanbanStatusUp(JobVO jvo){
	   ss.update("kanbanStatusUp", jvo);
   }
   
   // 업무 삭제
   public void jobDelete(JobVO jvo){
	   ss.delete("jobDelete", jvo);
   }
   
   // 업무 등록
   public void jobInsert(JobVO jvo){
	   ss.insert("jobInsert", jvo);
   }
   
   // 업무 수정
   public void jobUpdate(JobVO jvo){
	   ss.update("jobUpdate", jvo);
   }
   // --------------------- 재훈
   
   // 최신 작업 패키지 가져옴
   public List<JobVO> projectMainJobList(JobVO jvo){
	   return ss.selectList("projectMainJobList", jvo);
   }
   
   // 팀원 작업 현황 (CPP_MEMBER_PROJECT 와 CPP_JOB 의 JOIN)
    public List<JobVO> projectMainTeamWorkingCheck(JobVO jvo){
    	return ss.selectList("projectMainTeamWorkingCheck", jvo);
    }
    // pieChart 를 위한 KanBan 현황 count
    public List<JobVO> projectMainKanBanCheck(JobVO jvo){
    	return ss.selectList("projectMainKanBanCheck", jvo);
    }
    
    // 중복되지 않은 grade를 가져 오기 위한 dao
    public List<JobVO> projectMainTeamWorkingGrade(JobVO jvo){
    	return ss.selectList("projectMainTeamWorkingGrade", jvo);
    }
}
