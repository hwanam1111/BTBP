package btbp.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.KanbanVO;

@Repository
public class KanbanDao {
   
   @Autowired
   private SqlSessionTemplate ss;
   
 //@@@@@@@@@@@@@KPT@@@@@@@@@@@@@@@@
 	//KPT 화면
 	public List<KanbanVO> startKPT(int projectNo){
 		return ss.selectList("startKPT", projectNo);
 	}
 	//KPT 추가
 	public void addKPT(KanbanVO kvo){
 		ss.insert("addKPT",kvo);
 	}
 	
 	//kpt 전체 삭제
 	public void deleteAllKPT(HashMap hash){
 		ss.delete("deleteAllKPT",hash);
 	}
 	//kpt 한개 삭제
 	public void deleteKPT(KanbanVO kanvo){
 		ss.delete("deleteKpt",kanvo);
 	}
 	//kpt 수정
 	public void modifyKPT(KanbanVO kanvo){
 		ss.update("modifyKpt", kanvo);
 	}

}
