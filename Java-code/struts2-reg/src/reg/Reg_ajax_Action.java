package reg;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class Reg_ajax_Action extends ActionSupport {

    
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    public String execute(){
    	System.out.println("执行这一步！！");
    	return SUCCESS;
    }
	
}



