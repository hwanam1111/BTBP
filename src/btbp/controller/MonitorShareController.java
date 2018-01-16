package btbp.controller;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.net.Socket;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MonitorShareController {

	
	@RequestMapping("MonitorShareStart")
	public String monitorShareStart(){
		
		final int w = Toolkit.getDefaultToolkit().getScreenSize().width, h = Toolkit.getDefaultToolkit().getScreenSize().height;
		System.out.println("클라이언트 해상도 : "+w+" * "+h);
		
		Socket socket = null;
		System.out.println("클라이언트 준비완료");
		
		try {
		socket = new Socket("192.168.0.115", 12345);
		System.out.println("접속완료 - 클라이언트");
		
		BufferedImage image; //스크린샷이 저장될 버퍼공간
		Robot r = new Robot(); //스크린샷을 찍는 로봇클래스
		
		BufferedOutputStream bout = new BufferedOutputStream(socket.getOutputStream());
		image = r.createScreenCapture(new Rectangle(0, 0, w, h)); //스크린샷을 찍어서 image에 저장
		
		while(true){
			Thread.sleep(3000); // 5초에 한번씩 전송
			ImageIO.write(image, "bmp", bout);// 이미지를 소켓 아웃풋스트림으로 쏴줌
			bout.flush(); //버퍼에 쓰인 이미지를 서버로 보냄
		}
		
		} catch (Exception e) {
			e.printStackTrace(); //오류 처리
			System.out.println("접속실패 - 클라이언트");
		}
		
		return "MonitorShare";
	}
	
}
