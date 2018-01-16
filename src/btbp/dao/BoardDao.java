package btbp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import btbp.model.BoardVO;
import btbp.model.ReplyVO;

@Repository
public class BoardDao {
   
   @Autowired
   private SqlSessionTemplate ss;
   
   /*  //민희------------------------------------------------------
   //공지사항 목록
   public List<BoardVO> startNotice(int projectNo){
	   return ss.selectList("NoticeList",projectNo);
   }
   //공지사항 글 등록
   public int noticeInsert(BoardVO bvo){
	   System.out.println("dao>>"+bvo.getBoardTitle());
	  return ss.insert("noticeInsert",bvo);
   }
   //공지사항 글 삭제
   public void deleteNotice(int projectNo){
	   ss.delete("deleteNotice",projectNo);
   }
   //공지사항 글 수정
   public void modifyNotice(BoardVO bvo){
	   ss.update("modifyNotice", bvo);
   }*/
   //민희------------------------------------------------------
   //게시판 페이징
   public int boardCount(BoardVO bvo){
	  return ss.selectOne("boardCount",bvo);
   }
   //////////////////////////////////////////////
   // ★ 팀 게시글 입력하기
   public void ProjectBoardInsert(BoardVO bvo){
		ss.insert("ProjectBoardInsert", bvo);		
	}
   
   // ★ 팀 게시글 목록보기
   public List<BoardVO> ProjectBoardList(BoardVO boardvo){
	   if(boardvo.getBoardType().equals("version")){
		   return ss.selectList("versionBoardList", boardvo);
	   } else {
		   return ss.selectList("ProjectBoardList",boardvo);
	   }
   }
   
   // ★ 팀 게시글 작성자 검색
   public List<BoardVO> WriterFind(BoardVO bvo){
	   return ss.selectList("WriterFind", bvo);
   }
   
   // ★ 팀 게시글 내용 보기
   public BoardVO ProjectBoardDetail(BoardVO bvo){
	   return ss.selectOne("ProjectBoardDetail", bvo);
   }   
   
   // ★ 팀 게시글 댓글 리스트 조회
   public List<ReplyVO> ProjectReplyList(BoardVO bvo){
	   return ss.selectList("ProjectReplyList", bvo);
   }
   
   // ★ 팀 댓글 입력
   public void ProjectReplySave(ReplyVO rvo){
	   ss.insert("ProjectReplySave", rvo);
   }   
   
   // ★ 팀 게시글 삭제 ( 게시글에 딸린 댓글도 같이 삭제가 됨, BoardDao에서 걸어줌 )
   public void ProjectBoardDelete(BoardVO bvo){
	   
	   ss.delete("ProjectBoardReplyDelete", bvo);
	   ss.delete("ProjectBoardDelete", bvo);
   }
   
   // ★ 팀 댓글 삭제 (순수 댓글만 삭제)
   public void ProjectBoardReplyDel(ReplyVO rvo){
	   ss.delete("ProjectBoardReplyDel", rvo);
   }
   // ★ 팀 게시글 수정
   public void ProjectBoardUpdate(BoardVO bvo){
	   ss.update("ProjectBoardUpdate", bvo);
   }
   
   // 승민(아래)------------------------------------------
   
   // 댓글 입력
   public void replySave(ReplyVO rvo){
	   ss.insert("replySave", rvo);
   }
   
   // 게시판 리스트 조회
   public List<BoardVO> allBoard(BoardVO bvo){
	   return ss.selectList("allBoardSelect", bvo);
   }
   
   // 게시판 페이지 수 조회
   public int allBoardPage(){
	   return ss.selectOne("allBoardPage");
   }
   
   // 게시글 내용 보기
   public BoardVO boardView(BoardVO bvo){
	   return ss.selectOne("boardView", bvo);
   }
   
   // 게시글 댓글 리스트 조회
   public List<ReplyVO> replyList(BoardVO bvo){
	   return ss.selectList("replyList", bvo);
   }
   
   // 게시글 조회 수 +1
   public void boardCountPlus(BoardVO bvo){
	   ss.update("boardCountPlus", bvo);
   }
   
   // 게시글 삭제
   public void boardDelete(BoardVO bvo){
	   ss.delete("boardReplyDel", bvo);
	   ss.delete("boardDelete", bvo);
   }
   
   // 게시글 수정
   public void boardUpdate(BoardVO bvo){
	   ss.update("boardUpdate", bvo);
   }
   
   // 게시글 작성
   public void boardWrite(BoardVO bvo){
	   ss.insert("boardWrite", bvo);
   }
   
   // 댓글 삭제
   public void replyDelete(ReplyVO rvo){
	   ss.delete("boardReplyDelete", rvo);
   }
   
   // 게시글 작성자 검색
   public List<BoardVO> writerSearch(BoardVO bvo){
	   return ss.selectList("allBoardSelect", bvo);
   }
  
   // ------------------------- 재훈
   
   // 게시글 최신 순으로 가져오기
   public List<BoardVO> projectMainBoardList(BoardVO bvo){
	   return ss.selectList("projectMainBoardList", bvo);
   }
   
   // BoardList의 count 개수 
   public int countProjectMainBoardList(BoardVO bvo){
	   return ss.selectOne("countProjectMainBoardList",bvo);
   }
}
