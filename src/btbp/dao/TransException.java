package btbp.dao;

public class TransException extends Exception {
	public String getMessage(){
		return "프로젝트 관리자 인계중 오류가 발생하였습니다";
	}
}
