package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.MileStoneVO;

@Repository
public class MileStoneDao {
   
   @Autowired
   private SqlSessionTemplate ss;

   
   //마일 클릭했을 떄
   public List<MileStoneVO> clickMile(MileStoneVO mvo){
	   List<MileStoneVO> result = ss.selectList("clickMile",mvo);
	   return result;
   }
   
   //마일 스톤 Board 값 select
   public List<MileStoneVO> mileStoneBoardSelect(MileStoneVO mvo){
	   
	   return ss.selectList("mileStoneBoardSelect", mvo);
   }
   
   // 마일스톤 BoardCard 값 select
   public List<MileStoneVO> mileStoneBoardCardSelect(MileStoneVO mvo){
	   
	   return ss.selectList("mileStoneBoardCardSelect", mvo);
   }
   
   // 저장시, 기존에 있던 마일스톤 BoardCard 값 Delete(Done 제외)
   public int mileStoneBoardCardDelete(int projectNo){
	   
	   return ss.delete("mileStoneBoardCardDelete", projectNo);
   }
   
   public int mileStoneBoardDelete(int projectNo){
	   
	   return ss.delete("mileStoneBoardDelete", projectNo);
   }
   
   public int mileStoneBoardInsert(MileStoneVO mvo){
	   
	   return ss.insert("mileStoneBoardInsert", mvo);
   }
   
   public int mileStoneBoardCardInsert(MileStoneVO mvo){
	   
	   return ss.insert("mileStoneBoardCardInsert", mvo);
   }
   
   public int mileStoneDoneCheck(MileStoneVO mvo){
	   
	   return ss.selectOne("mileStoneDoneCheck", mvo);
   }
   
   public int mileStoneComplete_BoardCardDelete(MileStoneVO mvo){
	   
	   return ss.delete("mileStoneComplete_BoardCardDelete", mvo);
   }
   
   public int mileStoneComplete_BoardDelete(MileStoneVO mvo){
	   
	   return ss.delete("mileStoneComplete_BoardDelete", mvo);
   }
   
   public int mileStoneComplete_BoardInsert(MileStoneVO mvo){
	   
	   return ss.insert("mileStoneComplete_BoardInsert", mvo);
   }
   
   public int mileStoneComplete_BoardCardInsert(MileStoneVO mvo){
	   
	   return ss.insert("mileStoneComplete_BoardCardInsert", mvo);
	   
   }
   
   public int mileStoneScore_Insert(MileStoneVO mvo){
	   return ss.update("mileStoneScore_Insert", mvo);
   }
   
   public MileStoneVO clickMileSelect(MileStoneVO mvo){
	   return ss.selectOne("clickMileSelect", mvo);
   }
   
   // 각 row에 따른 잘한점 못한 점 select
   public MileStoneVO mileStoneGoodAndBad_Select(MileStoneVO mvo){
	   	return ss.selectOne("mileStoneGoodAndBad_Select", mvo);
   }
   
   // 각 row에 따른 잘한점 못한 점 InsertmileStoneGoodAndBad_BoardCardSelect
   public void mileStoneGoodAndBad_Insert(MileStoneVO mvo){
	   
	   ss.update("mileStoneGoodAndBad_Insert", mvo);
   }
   
   public  List<MileStoneVO> mileStoneGoodAndBad_BoardCardSelect(MileStoneVO mvo ){
	   
	   return ss.selectList("mileStoneGoodAndBad_BoardCardSelect", mvo);
	   
   }
}
