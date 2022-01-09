package tw.finalproject.email.model;

public interface IEmailSenderService {

	void sendEmail(String toEmail, String subject, String body);
	
//	void sendEmail(String toEmail, String subject, FileSystemResource file);

}