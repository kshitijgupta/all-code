//实现该银行业务逻辑的一个执行控制器

import java.lang.reflect.Method;
import java.lang.reflect.InvocationHandler;

public class BankProxyHandler implements InvocationHandler{
	//被代理的对象
	private Object target;
	//创建拦截器实例
	LogBank ml = new LogBank();
	
	public Object invoke(Object arg0, Method arg1, Object[] arg2)
		throws Throwable{
		Object result = null;
		
		if(arg1.getName().equals("remit")){
			//拦截remit方法
			//调用日志拦截器
			ml.writelog("拦截器开始汇款日志记录");
			result = arg1.invoke(target, arg2);
			//调用日志拦截器
			ml.writelog("拦截器结束汇款日志记录");
		}
		else{
			System.out.println("调用了存钱模块");
			result = arg1.invoke(target, arg2);
		}
		
		return null;
			
	}
	
	public void setTarget(Object target){
		this.target = target;
	}

}
