package btbp.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.BoardVO;

@Repository
public class FileShareDao {

	   @Autowired
	   private SqlSessionTemplate ss;
	
	   //total page 수 확인
	   public int fileShareView(HashMap hash){

		   return ss.selectOne("allFileSelect", hash);	   
	
	   }
	   
	   // 파일 공유 리스트 페이징 조회
	   public List<BoardVO> fileSharePagingView(BoardVO bvo){
		   return ss.selectList("allFileShareSelect", bvo);
	   }
	   
	   // 파일 viewDetail 화면 조회
	   public BoardVO fileShareDetail(BoardVO bvo){
		   return ss.selectOne("FileShareDetail", bvo);
	   }
	   
	   // 파일 공유 리스트 삭제
	   public void  fileShareDelete(BoardVO bvo){
		   
		  ss.delete("FileShareDelete", bvo);
		   
	   }
	   
	   // 파일  공유 리스트 insert(삽입)
	   public int fileShareInsert(BoardVO bvo){
		   
		   return ss.insert("fileShareInsert", bvo);
	   }
	   
	   // 다음 페이지 리스트 가지고 오기
	   public BoardVO fileShareNextDetail(BoardVO bvo){
		   
		   return ss.selectOne("FileShareNextDetail",  bvo);
	   }
	   
	   // search 를 이용해서 list 가져 오기
	   public List<BoardVO> fileShareSearch(HashMap map){
		   
		   return ss.selectList("fileShareSearch", map);
	   }
	   
	   
}
