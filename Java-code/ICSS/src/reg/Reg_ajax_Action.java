package reg;

import icss.abc.base.db.DBConnection;
import icss.abc.user.dao.UserDAO;
import icss.abc.user.dao.UserDAOImpl;
import icss.abc.user.vo.UserVO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Reg_ajax_Action extends ActionSupport {

    
    private String username;
    private String password1;
    private String password2;
    private String Email;
    private int dept;
   

    public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword1() {
		return password1;
	}


	public void setPassword1(String password1) {
		this.password1 = password1;
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String password2) {
		this.password2 = password2;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		dept = Integer.parseInt(request.getParameter("dept"));
		
		
		
		
		Boolean result = false;
    	   	   	
    	UserDAOImpl dao = new UserDAOImpl();
    	UserVO  vo  = new UserVO();
    	
    	vo.setUsername(username);
    	vo.setPassword(password1);
    	vo.setEmail(Email);
    	vo.setUsergroup("");
    	vo.setRegtime(new Date());
    	
    	
    	
    	
    	try {
    		
			result = dao.insert(vo,dept);
			
			
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
    	if(result){

    		return SUCCESS;
    	}
    	else{
    		return "error";
    	}
    }
	public void validate() {
		try {
			
			if (checkSameName(username)) {
				
				addFieldError("username", "您要注册的用户已经存在，请重新输入一个用户名!");
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	
	


	private boolean checkSameName(String name)
    throws Exception, ServletException, IOException {
		
        try {
        	UserDAO dao = new UserDAOImpl();
        	
        	boolean	 result = dao.checkExist(name); 
			
        	return result;
        	
        } catch (Exception e) {
            ServletException ex = new ServletException(e.getMessage());
        
            throw ex;
        }
        
    }
}



