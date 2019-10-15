package com.breaktheice.moimat.persistence;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.breaktheice.moimat.domain.BasicDomain;
import com.breaktheice.moimat.page.Criteria;

public interface BasicMapper {
	
	public List<BasicDomain> selectBoardList();
	public BasicDomain selectBoardOne(long postId);
	
	public List<BasicDomain> selectReplyList(BasicDomain domain);

	//파일업로드
	public long selectAllBoard() throws Exception;
	
	public long insertBoard(BasicDomain domain);
	public long deleteBoard(BasicDomain domain);
	public long deleteBoardComment(BasicDomain domain);
	public long modifyBoard(BasicDomain domain);

	public long replyUPBoard(BasicDomain domain);
	
	public long replyBoard(BasicDomain domain);
	
	
	public long replydeleteBoard(BasicDomain domain);
	public List<BasicDomain> selectBoardListPage(Criteria criteria);
	public long updateViewCnt(BasicDomain domain);

	

//	

	

	
//
//	public void replydeleteBoard2(BasicDomain domain);
//	
//
//	
//	public String restore(List<MultipartFile> file,BasicDomain domain);
//	public String genSaveFileName(String extName,BasicDomain domain);
//	public boolean writeFile(MultipartFile multipartFile, String saveFileName,BasicDomain domain) throws IOException;
//	
//	public List<BasicDomain> selectBoardListPage(Criteria criteria) throws Exception;
//	
//	public String restore(List<MultipartFile> files,PhotoDomain domain);
//	public String genSaveFileName(String extName,PhotoDomain domain);
//	public boolean writeFile(MultipartFile multipartFile, String saveFileName,PhotoDomain domain) throws IOException;
//	
	
	
}
