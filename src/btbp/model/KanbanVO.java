package btbp.model;

public class KanbanVO {

	int	jobNo;
	String	memberId;
	int	projectNo;
	String	jobTitle;
	String	jobContent;
	String	createDate;
	String	startDate;
	String	endDate;
	String jobType;
	String jobStatus;

	//member Table 조인
	String memberDept;
	String memberRank;
	String memberCompany;
	String memberImageName;


	public int getJobNo() {
		return jobNo;
	}
	public void setJobNo(int jobNo) {
		this.jobNo = jobNo;
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
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	//member Table 조인
	String memberName;
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public String getMemberCompany() {
		return memberCompany;
	}
	public void setMemberCompany(String memberCompany) {
		this.memberCompany = memberCompany;
	}
	public String getMemberImageName() {
		return memberImageName;
	}
	public void setMemberImageName(String memberImageName) {
		this.memberImageName = memberImageName;
	}


}
