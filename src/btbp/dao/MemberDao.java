package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.MemberVO;
import btbp.model.ProjectVO;

@Repository
public class MemberDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 아이디 찾기
   public MemberVO memberIdSearch(MemberVO mvo){
	   return ss.selectOne("memberIdSearch", mvo);
   }
   
   // 비밀번호 찾기
   public MemberVO memberPwSearch(MemberVO mvo){
	   return ss.selectOne("memberPwSearch", mvo);
   }
   
   // 회원 정보 수정 시
   public void memberInfoUpdate(MemberVO mvo){
	   ss.update("memberInfoUpdate", mvo);
   }
   
   // 비밀번호 변경 시
   public int memberPwChg(MemberVO mvo){
	   return ss.update("memberPwChg", mvo);
   }
   
   // 회원 탈퇴 요청 시
   public int memberOut(MemberVO mvo){
	   return ss.update("memberOut", mvo);
	}
   
   // 로그인 아웃 시 로그인정보 삭제
   public void memberLogout(String memberId){
	   ss.delete("memberLogout", memberId);
	}
   
   // 로그인 성공 시 로그인정보 입력
   public void memberLoginOk(String memberId){
	   int result = 0;
	   result = ss.selectOne("memberLoginCheck", memberId);
	   if(result == 0) {
		   ss.insert("memberLoginOk", memberId);
	   }
	}
   
   // 로그인정보 조회
   public MemberVO memberLogin(MemberVO mvo){
	   return ss.selectOne("memberLogin", mvo);
	}
   
   // 회원정보 조회
   public MemberVO memberInfo(String memberId){
	   MemberVO vo = ss.selectOne("memberInfo", memberId);
	   return vo;
	}
   
   // 회원 프로젝트 조회
   public List<ProjectVO> memberProject(String memberId){
	   return ss.selectList("memberProject", memberId);
	}
   
   // 회원가입
	public int memberSave(MemberVO mvo){
		int result = ss.insert("memberSave", mvo);
		return result;
	}
	
	// 아이디 중복 체크
	public MemberVO memberIdCheck(MemberVO mvo){
		MemberVO vo = ss.selectOne("memberIdCheck", mvo);
		return vo;
	}
   
}
