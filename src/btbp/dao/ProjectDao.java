package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.ProjectMemberVO;
import btbp.model.ProjectVO;

@Repository
public class ProjectDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 프로젝트 생성
   public void projectSave(ProjectVO pvo){
	   ss.insert("projectSave", pvo);
	   ss.insert("projectAddMember", pvo);
   }
   
   // 프로젝트 기본 정보 조회
   public ProjectVO projectInfo(ProjectMemberVO pvo){
	   return ss.selectOne("projectInfo", pvo);
   }
   
   // 프로젝트 정보 수정
   public void projectInfoUpdate(ProjectVO pvo){
	   ss.update("projectInfoUpdate", pvo);
   }
   
   // ---------------- 재훈
   
   // 프로젝트 멤버 최신 순 4명 가져오기
   public List<ProjectMemberVO> projectMainMemberList( ProjectMemberVO pvo ){
	   return ss.selectList("projectMainMemberList", pvo);
   }
   
}
