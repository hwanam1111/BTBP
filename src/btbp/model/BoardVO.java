package btbp.model;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
 
public class BoardVO {
	
	int	    boardNo;
	String	memberId;
	int	    projectNo;
	String	boardType;
	String	boardTitle;
	String  boardContent;
	int       boardCnt;
	String	fileName;
	String	filePath;
	String	createDate;
	String	fileSaveName;
	long	fileSize;
	int pageNum;
	int pageNo;
	int totalPage;
	int startRecord;
	int endRecord;
	String memberName;
	String memberGender;
	String memberPhone;
	String memberEmail;
	String memberCompany;
	String memberDept;
	String memberRank;
	String memberImageName;
	String memberImageSaveName;
	String memberImagePath;
	String memberImageSize;
	
	MultipartFile file;
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getEndRecord() {
		return endRecord;
	}

	public void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
		if(!file.isEmpty()){
			this.fileName = file.getOriginalFilename();
			this.fileSize = file.getSize();
			this.filePath = "C:\\Users\\kosta\\Documents\\workspace-sts-3.8.2.RELEASE\\BTBP\\WebContent\\resources\\upload\\BoardFiles\\";
			
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
			
			this.fileSaveName = file.getOriginalFilename() + now;
			
			File f = new File("C:\\Users\\kosta\\Documents\\workspace-sts-3.8.2.RELEASE\\BTBP\\WebContent\\resources\\upload\\BoardFiles\\"+fileSaveName);
			try {
				
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberCompany() {
		return memberCompany;
	}

	public void setMemberCompany(String memberCompany) {
		this.memberCompany = memberCompany;
	}

	public String getMemberDept() {
		return memberDept;
	}

	public void setMemberDept(String memberDept) {
		this.memberDept = memberDept;
	}

	public String getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}

	public String getMemberImageName() {
		return memberImageName;
	}

	public void setMemberImageName(String memberImageName) {
		this.memberImageName = memberImageName;
	}

	public String getMemberImageSaveName() {
		return memberImageSaveName;
	}

	public void setMemberImageSaveName(String memberImageSaveName) {
		this.memberImageSaveName = memberImageSaveName;
	}

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	public String getMemberImageSize() {
		return memberImageSize;
	}

	public void setMemberImageSize(String memberImageSize) {
		this.memberImageSize = memberImageSize;
	}

	
}
