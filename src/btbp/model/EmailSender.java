package btbp.model;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender  {

	@Autowired
	protected JavaMailSender mailSender;

	public void sendEmail(String emailAddr) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject("[광고] TeamUP 초대 메일입니다.");
        msg.setText("최고의 프로젝트 협업 솔루션 TeamUP에서 초대 메일이 도착했습니다. " +
        		 " TeamUP : https://teamup.com");
        msg.setRecipient(RecipientType.TO , new InternetAddress(emailAddr));
         
        mailSender.send(msg); 
		
	}
	
	public void sendPwEmail(MemberVO mvo) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject("[TeamUP] 비밀번호 안내 메일입니다.");
        msg.setText("고객님 비밀번호는 "+ mvo.getMemberPw() +"입니다.    - 로그인 하러가기 : https://teamup.com/MemberLoginPage.do");
        msg.setRecipient(RecipientType.TO , new InternetAddress(mvo.getMemberEmail()));
         
        mailSender.send(msg); 
		
	}

}
