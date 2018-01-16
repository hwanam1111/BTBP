package btbp.model;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	
	String	memberId;
	String	memberPw;
	String	memberName;
	String	memberGender;
	String	memberPhone;
	String	memberEmail;
	String	memberCompany;
	String	memberDept;
	String	memberRank;
	String	createDate;
	String	lastLoginDate;
	String	leaveDate;
	String	memberStatus;
	String	memberImageName;
	String	memberImageSaveName;
	String	memberImagePath;
	long	memberImageSize;
	String	searchStatus;
	
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
		if(!file.isEmpty()){
			this.memberImageName = file.getOriginalFilename();
			this.memberImageSize = file.getSize();
			File f = new File("C:\\Users\\kosta\\Documents\\workspace-sts-3.8.2.RELEASE\\BTBP\\WebContent\\resources\\upload\\Members\\"+memberImageName);
			try {
				
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
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
	public long getMemberImageSize() {
		return memberImageSize;
	}
	public void setMemberImageSize(long memberImageSize) {
		this.memberImageSize = memberImageSize;
	}
	public String getSearchStatus() {
		return searchStatus;
	}
	public void setSearchStatus(String searchStatus) {
		this.searchStatus = searchStatus;
	}
}
