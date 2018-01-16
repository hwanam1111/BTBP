package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.ChattingVO;

@Repository
public class ChattingDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   // 팀 채팅 내용을 가져온다!
   public List<ChattingVO> chatList(ChattingVO cvo){
	   return ss.selectList("chatList", cvo);
   }
   
   // 팀 채팅 내용을 입력한다!
   public void chatSend(ChattingVO cvo){
	   ss.insert("chatSend", cvo);
   }
}
