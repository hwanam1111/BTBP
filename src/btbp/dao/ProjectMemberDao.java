package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import btbp.model.ProjectMemberVO;

@Repository
public class ProjectMemberDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 프로젝트 관리자 변경
   @Transactional(rollbackFor=Exception.class)
   public void pMtransfer(ProjectMemberVO pvo, String memberId) throws Exception{
	   
	  // 1. 프로젝트 정보 아이디 수정
	  int result1 = ss.update("PMtransfer1", pvo);
	  if( result1 == 0) throw new TransException();
	  // 2. 인수자 권한 PM으로 수정
	  int result2 = ss.update("PMtransfer2", pvo);
	  if( result2 == 0) throw new TransException();
	  
	  pvo.setMemberId(memberId); // 멤버 아이디 변경
	  // 3. 인계자 권한 OTHER로 수정
	  int result3 = ss.update("PMtransfer3", pvo);
	  if( result3 == 0) throw new TransException();
   }
   
   // 프로젝트 멤버 등급 수정
   public int memberGradeUpdate(ProjectMemberVO pvo){
	   return ss.update("memberGradeUpdate", pvo);
   }
   
   // 프로젝트 멤버 삭제
   public int projectMemberDelete(ProjectMemberVO pvo){
	   return ss.delete("ProjectMemberDelete", pvo);
   }
   
   // 프로젝트 멤버 추가
   public int memberAddInsert(ProjectMemberVO pvo){
	   return ss.insert("memberAddInsert", pvo);
   }
   
   // 프로젝트 멤버 리스트 조회
   public List<ProjectMemberVO> projectMemberList(ProjectMemberVO pvo){
	   return ss.selectList("projectMemberList", pvo);
   }
   
   // 프로젝트 페이지 접근 요청 시 멤버가 맞는지 확인
   public int projectMain(ProjectMemberVO pvo){
	   return ss.selectOne("projectMainAccess", pvo);
   }
   
   
}
