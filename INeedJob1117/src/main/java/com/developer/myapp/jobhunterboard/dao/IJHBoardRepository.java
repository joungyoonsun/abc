package com.developer.myapp.jobhunterboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.developer.myapp.jobhunterboard.model.JHBoard;
import com.developer.myapp.jobhunterboard.model.JHBoardUploadFile;


// BoardService에서 사용
@Repository
public interface IJHBoardRepository {
	int test();
	int selectMaxJHBoardArticleNo();
	int selectMaxJHBoardFileId();
	
	void insertJHBoardArticle(JHBoard jhBoard);
	void insertJHBoardFildData(JHBoardUploadFile jhFile);
	
	List<JHBoard> selectJHBoardArticleListByCategory(@Param("categoryId") int categoryId,
			@Param("start") int start, @Param("end")int end);
	
	JHBoard selectJHBoardArticle(@Param("jhId") int jhId);
	JHBoardUploadFile getJHBoardFile(int jhFileId);
	
	void updateJHBoardReadCount(int jhId);
//	void updateReplyNumber(@Param("masterId") int masterId,
//			@Param("boardReplyNumber") int boardReplyNumber);
//	void replyArticle(jhBoard jhId);
	
//	String getPassword(int jhId);
	void updateJHBoardArticle(JHBoard jhBoard);
	void updateJHBoardFileData(JHBoardUploadFile jhFile);

	void deleteJHBoardFileData(int jhId); //메인글 파일 삭제
	void deleteJHBoardReply(int jhId); //메인글 삭제했을 때 댓글 삭제
//	void deleteReplyFileData(int jhId); //댓글만 삭제
	JHBoard selectDeleteJHBoardArticle(int jhId); 
	void deleteJHBoardArticleByjhId(int jhId); //메인글 삭제
	
	int selectTotalJHBoardArticleCount();
	int selectTotalJHBoardArticleCountByCategoryId(int categoryId);
	int selectTotalArticleCountByKeyword(String keyword);
	List<JHBoard> searchJHBoardListByContentKeyword(@Param("keyword") String keyword,
			@Param("start") int start, @Param("end") int end);
}
