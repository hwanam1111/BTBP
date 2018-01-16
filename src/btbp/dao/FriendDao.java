package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.FriendVO;
import btbp.model.MemberVO;
import btbp.model.ProjectVO;

@Repository
public class FriendDao {
   
   @Autowired
   private SqlSessionTemplate ss;
   
   // 함께 진행한 프로젝트 목록
   public List<ProjectVO> togetherProject(FriendVO fvo){
	   return ss.selectList("togetherProject", fvo);
   }
   
   // 친구 삭제
   public void friendRemove(FriendVO fvo){
	   ss.delete("friendRemove", fvo);
   }
   
   // 내 전체 친구 정보 조회
   public List<FriendVO> myFriend(String memberId){
	   return ss.selectList("myFriendAll", memberId);
   }
   
   // 나를 등록한 친구 정보 조회
   public List<FriendVO> nfriendList(String memberId){
	   return ss.selectList("nfriendList", memberId);
   }
   
   // 메세지함 조회
   public List<FriendVO> messageBox(String memberId){
	   return ss.selectList("messageBox", memberId);
   }
   
   // 검색한 이름으로 친구 정보 조회
   public List<FriendVO> myFriend(MemberVO mvo){
	   return ss.selectList("myFriendName", mvo);
   }
   
   // 친구 아이디 조회
   public MemberVO friendSelect(String memberId){
	   return ss.selectOne("friendSearchInfo", memberId);
   }
   
   // 친구 추가
   public String friendAdd(FriendVO fvo){
	   int result = 0;
	   result = ss.selectOne("friendAddCheck", fvo);
	   if(result > 0 ){
		   return "이미 등록된 친구 입니다.";
	   } else {
		   ss.insert("friendAdd", fvo);
	   }
	   return "친구 추가 되었습니다.";
   }
   
   // 친구 체크
   public int friendAddCheck(FriendVO fvo){
	   return ss.selectOne("friendAddCheck", fvo);
   }

}
