//ʵ�ָ�����ҵ���߼���һ��ִ�п�����

import java.lang.reflect.Method;
import java.lang.reflect.InvocationHandler;

public class BankProxyHandler implements InvocationHandler{
	//������Ķ���
	private Object target;
	//����������ʵ��
	LogBank ml = new LogBank();
	
	public Object invoke(Object arg0, Method arg1, Object[] arg2)
		throws Throwable{
		Object result = null;
		
		if(arg1.getName().equals("remit")){
			//����remit����
			//������־������
			ml.writelog("��������ʼ�����־��¼");
			result = arg1.invoke(target, arg2);
			//������־������
			ml.writelog("���������������־��¼");
		}
		else{
			System.out.println("�����˴�Ǯģ��");
			result = arg1.invoke(target, arg2);
		}
		
		return null;
			
	}
	
	public void setTarget(Object target){
		this.target = target;
	}

}
