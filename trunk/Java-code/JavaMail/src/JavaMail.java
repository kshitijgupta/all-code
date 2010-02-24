import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Date;
import javax.activation.*;
import java.io.*;

public class JavaMail {
	// 21-30�аѱ��������ñ������ж��塣 ������main�ж����Ǹ�ֲ�� 
	private MimeMessage mimeMsg; // MIME�ʼ����� 
	private Session session; // �ʼ��Ự���� 
	private Properties props; // ϵͳ���� 
	private boolean needAuth = false; // smtp�Ƿ���Ҫ��֤ 
	private String username = ""; // smtp��֤�û��������� 
	private String password = "";
	private Multipart mp; // Multipart����,�ʼ�����,����,���������ݾ����ӵ����к�������//MimeMessage���� 

	public JavaMail(String smtp) {
		setSmtpHost(smtp);
		createMimeMessage();
	}

	/** 
	 * 
	 * 
	 * 
	 * @param hostName 
	 * String 
	 * 
	 * 
	 * 
	 */
	public void setSmtpHost(String hostName) {
		System.out.println("����ϵͳ���ԣ�mail.smtp.host = " + hostName);
		if (props == null) {
			props = System.getProperties();
		} // ���ϵͳ���Զ��� 
		props.put("mail.smtp.host", hostName); // ����SMTP���� 
	}

	/** 
	 * 
	 * 
	 * 
	 * @return boolean 
	 * 
	 * 
	 * 
	 */
	public boolean createMimeMessage() {
		try {
			System.out.println("׼����ȡ�ʼ��Ự����");
			session = Session.getDefaultInstance(props, null); // ����ʼ��Ự���� 
		} catch (Exception e) {
			System.err.println("��ȡ�ʼ��Ự����ʱ��������" + e);
			return false;
		}
		System.out.println("׼������MIME�ʼ�����");
		try {
			mimeMsg = new MimeMessage(session); // ����MIME�ʼ����� 
			mp = new MimeMultipart(); // mp һ��multipart���� 
			// Multipart is a container that holds multiple body parts. 
			return true;
		} catch (Exception e) {
			System.err.println("����MIME�ʼ�����ʧ�ܣ�" + e);
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param need 
	 * boolean 
	 * 
	 * 
	 * 
	 */
	public void setNeedAuth(boolean need) {
		System.out.println("����smtp������֤��mail.smtp.auth = " + need);
		if (props == null) {
			props = System.getProperties();
		}
		if (need) {
			props.put("mail.smtp.auth", "true");
		} else {
			props.put("mail.smtp.auth", "false");
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public void setNamePass(String name, String pass) {
		System.out.println("����õ��û���������");
		username = name;
		password = pass;
	}

	/** 
	 * 
	 * 
	 * 
	 * @param mailSubject 
	 * String 
	 * 
	 * 
	 * 
	 * @return boolean 
	 * 
	 * 
	 * 
	 */
	public boolean setSubject(String mailSubject) {
		System.out.println("�����ʼ����⣡");
		try {
			mimeMsg.setSubject(mailSubject);
			return true;
		} catch (Exception e) {
			System.err.println("�����ʼ����ⷢ������");
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param mailBody 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean setBody(String mailBody) {
		try {
			System.out.println("�����ʼ����ʽ");
			BodyPart bp = new MimeBodyPart();
			bp.setContent(
					"<meta http-equiv=Content-Type content=text/html; charset=gb2312>"
							+ mailBody, "text/html;charset=GB2312");
			mp.addBodyPart(bp);
			return true;
		} catch (Exception e) {
			System.err.println("�����ʼ�����ʱ��������" + e);
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean addFileAffix(String filename) {
		System.out.println("�����ʼ�������" + filename);
		try {
			BodyPart bp = new MimeBodyPart();
			FileDataSource fileds = new FileDataSource(filename);
			bp.setDataHandler(new DataHandler(fileds));
			bp.setFileName(fileds.getName());
			mp.addBodyPart(bp);
			return true;
		} catch (Exception e) {
			System.err.println("�����ʼ�������" + filename + "��������" + e);
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean setFrom(String from) {
		System.out.println("���÷����ˣ�");
		try {
			mimeMsg.setFrom(new InternetAddress(from)); // ���÷����� 
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean setTo(String to) {
		System.out.println("����������");
		if (to == null) {
			return false;
		}
		try {
			mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress
					.parse(to));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean setCopyTo(String copyto) {
		System.out.println("���͸�����");
		if (copyto == null) {
			return false;
		}
		try {
			mimeMsg.setRecipients(Message.RecipientType.CC,
					(Address[]) InternetAddress.parse(copyto));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * @param name 
	 * String 
	 * 
	 * 
	 * 
	 * @param pass 
	 * String 
	 * 
	 * 
	 * 
	 */
	public boolean sendout() {
		try {
			mimeMsg.setContent(mp);
			mimeMsg.saveChanges();
			System.out.println("���ڷ����ʼ�....");
			Session mailSession = Session.getInstance(props, null);
			Transport transport = mailSession.getTransport("smtp"); // ������ 
			transport.connect((String) props.get("mail.smtp.host"), username,
					password);
			transport.sendMessage(mimeMsg, mimeMsg
					.getRecipients(Message.RecipientType.TO));
			// transport.send(mimeMsg); 
			System.out.println("�����ʼ��ɹ���");
			transport.close();
			return true;
		} catch (Exception e) {
			System.err.println("�ʼ�����ʧ�ܣ�" + e);
			return false;
		}
	}

	/** 
	 * 
	 * 
	 * 
	 * Just do it as this 
	 * 
	 * 
	 * 
	 */
	public static void main(String[] args) {
		String mailbody = "http://www.laabc.com �û��ʼ�ע����� <font color=red>��ӭ����</font> <a href=\"http://www.laabc.com\">��ABC</a>";
		JavaMail themail = new JavaMail("smtp.163.com");
		themail.setNeedAuth(true);
		if (themail.setSubject("laabc.com�ʼ�����") == false) {
			return;
		}
		//�ʼ����� ֧��html �� <font color=red>��ӭ����</font> <a href=\"http://www.laabc.com\">��ABC</a> 
		if (themail.setBody(mailbody) == false) {
			return;
		}
		//�ռ������� 
		if (themail.setTo("luo__lei@163.com") == false) {
			return;
		}
		//���������� 
		if (themail.setFrom("luo__lei@163.com") == false) {
			return;
		}
		//���ø��� 
		//if (themail.addFileAffix("#######") == false) 
		//return; // �����ڱ��ػ����ϵľ���·�� 
		themail.setNamePass("luo__lei", "22763378"); // �û��������� 
		//for(;;)
		if (themail.sendout() == false) {
			return;
		}
		
		
	}
	
}