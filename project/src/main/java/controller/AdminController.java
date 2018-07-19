package controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import exception.ShopException;
import logic.Item;
import logic.Mail;
import logic.Sale;
import logic.SaleItem;
import logic.ShopService;
import logic.User;

@Controller
public class AdminController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("admin/admin")
	public ModelAndView admin(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> userList = service.userList();
		List<Map<Integer, String>> maplist = service.gameType();
		mav.addObject("gametype", maplist);
		mav.addObject("userList", userList);
		return mav;
	}
	@RequestMapping("admin/mailForm")
	public ModelAndView admailForm(HttpSession session,String[] idchks) {
		ModelAndView mav = new ModelAndView("admin/mail");
		if(idchks == null || idchks.length == 0) {
			throw new ShopException("������ ���� ����ڸ� �����ϼ���", "admin.shop");
		}
		List<User> userList = service.userList(idchks);
		mav.addObject("userList", userList);
		return mav;
	}
	//���� Ŭ����, �� Ŭ������ ���� ����� ���� �����ž�.(final) 
	private final class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}
	@RequestMapping("admin/mail")
	public ModelAndView mail(Mail mail, HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/mailsuccess");
		adminMailSend(mail);
		return mav;
	}
	private void adminMailSend(Mail mail) {
		//�Է��� ���̹� �̸����ּ�, �Ǵ� ���̵�
		String naverid = mail.getNaverid();
		//�Էµ� ���̹� ��й�ȣ
		String naverpass = mail.getNaverpass();
		MyAuthenticator auth = new MyAuthenticator(naverid, naverpass);
		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			File f = new File("D:\\20180122\\20180122\\SPRING\\workspace\\shop-3\\mail.properties");
			fis = new FileInputStream(f);
			prop.load(fis);
		} catch(IOException e) {
			e.printStackTrace();
		}
		Session session = Session.getInstance(prop,auth);
		//���������� ���� ū ����. ���� ���� ��ü
		MimeMessage msg = new MimeMessage(session);
		try {
			//������ ��� ����
			msg.setFrom(new InternetAddress(naverid));
			List<InternetAddress> addrs = new ArrayList<InternetAddress>();
			//mail.getRecipient() : �޴� �����
			String[] emails = mail.getRecipient().split(",");
			for(int i = 0; i < emails.length; i++) {
				try {
					//�������� ������ ������ ���ؼ� ("euc-kr"),"8859_1") ������ �⺻ ���ڵ����� �ٲ������.
					addrs.add(new InternetAddress(new String(emails[i].getBytes("euc-kr"),"8859_1")));
				} catch(UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			InternetAddress[] arr = new InternetAddress[emails.length];
			for(int i = 0; i < addrs.size(); i++) {
				arr[i] = addrs.get(i);
			}
			//���� ��¥
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress(naverid);
			msg.setFrom(from);
			//TO : �޴� �����, CC : ����
			msg.setRecipients(Message.RecipientType.TO, arr);
			msg.setSubject(mail.getTitle());
			//�и����Ѽ� ���뵵 ������ ÷�����ϵ� �����ž�
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart message = new MimeBodyPart();
			message.setContent(mail.getContents(), mail.getMtype());
			//����κ��� Part�� ����
			multipart.addBodyPart(message);
			for(MultipartFile mf : mail.getFile1()) {
				if((mf != null) && (!mf.isEmpty())) {
					multipart.addBodyPart(bodyPart(mf));
				}
			}
			msg.setContent(multipart);
			Transport.send(msg);
		} catch(MessagingException me) {
			me.printStackTrace();
		}
	}
	private BodyPart bodyPart(MultipartFile mf) {
		MimeBodyPart body = new MimeBodyPart();
		String orgFile = mf.getOriginalFilename();
		File f1 = new File("D:/shop-3/email/upload/"+orgFile);
		try {
			mf.transferTo(f1); //������ �ӽ÷� ����
			body.attachFile(f1); //����� ������ ���Ͽ� ÷��
			//÷�ε� ������ �̸� ����
			body.setFileName(new String(orgFile.getBytes("EUC-KR"),"8859_1"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return body;
	}
/*	@RequestMapping("admin/graph*")
	public ModelAndView graph(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = service.graph();
		Map <String,Object> treemap = new TreeMap<String,Object>(map);
		mav.addObject("map",treemap);
		return mav;
	}*/
	@RequestMapping("admin/orderList")
	public ModelAndView admorderList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Sale> saleList = service.getSaleList();
		for(Sale sale : saleList) {
			List<SaleItem> saleItemList = service.getSaleItemList(sale.getS_id());
			int amount =0;
			for(SaleItem saleItem : saleItemList) {
				Item item = service.detail(saleItem.getI_no());
				saleItem.setItem(item);
				amount += saleItem.getQuantity() + item.getI_price();
			}
			sale.setSaleItemList(saleItemList);
			sale.setAmount(amount);
		}
		mav.addObject("saleList", saleList);
		return mav;
	}
	@RequestMapping("admin/stepChange")
	public ModelAndView stepChange(HttpSession session,HttpServletRequest request) {
		String s_id = request.getParameter("s_id");
		String s_step = request.getParameter("s_step");
		List<SaleItem> siList = service.getSaleItemList(Integer.parseInt(s_id));
		
		Integer mileage = 0;
		try {
			mileage = (int)Double.parseDouble(request.getParameter("mileage"));
		} catch(Exception e) {
			mileage = 0;
		}
		service.changeStep(s_id,s_step);
		String loginId = (String)session.getAttribute("loginUser");
		if(!loginId.equals("admin")) {
			service.mileageSave(mileage,loginId);
			for(SaleItem si : siList) {
				service.updateAmount(si.getI_no());
			}
		}
		String saleUserId = service.getSaleUserId(s_id);
		if(s_step.equals("9") && loginId.equals("admin")) {
			service.mileageSubtract(mileage,saleUserId);
		}
		return new ModelAndView("redirect:../user/shoping.sdj?id="+session.getAttribute("loginUser"));
	}
	
}
