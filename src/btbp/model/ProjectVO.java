package btbp.model;

public class ProjectVO {
	
	int	    projectNo;
	String	projectName;
	String	projectStatus;
	String	projectDetail;
	String	orderCompany;
	String	obtainCompany;
	int	    projectBudget;
	String	startDate;
	String	endDate;
	String	memberId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	String	grade;
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getProjectDetail() {
		return projectDetail;
	}
	public void setProjectDetail(String projectDetail) {
		this.projectDetail = projectDetail;
	}
	public String getOrderCompany() {
		return orderCompany;
	}
	public void setOrderCompany(String orderCompany) {
		this.orderCompany = orderCompany;
	}
	public String getObtainCompany() {
		return obtainCompany;
	}
	public void setObtainCompany(String obtainCompany) {
		this.obtainCompany = obtainCompany;
	}
	public int getProjectBudget() {
		return projectBudget;
	}
	public void setProjectBudget(int projectBudget) {
		this.projectBudget = projectBudget;
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
	
	


}
