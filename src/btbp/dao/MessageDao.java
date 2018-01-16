package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.MessageVO;

@Repository
public class MessageDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 1:1 메세지 읽기
   public List<MessageVO> msgList(MessageVO mvo){
	   ss.update("msgRead", mvo); // 메세지 읽음 처리
	   return ss.selectList("msgList", mvo); // 메세지 리스트 조회
   }
   
   // 메세지 보내기
   public int msgSend(MessageVO mvo){
	   return ss.insert("msgSend", mvo);
   }
   
   // 읽지 않은 메세지 숫자 조회
   public int noReadMsg(String memberId){
	   return ss.selectOne("noReadMsg", memberId);
   }
   
}
