//建立一个生成代理类的工厂类

import java.lang.reflect.Proxy;

public class BankProxyFactory {
	
	public static Object getProxy(Object obj){
		
		BankProxyHandler bh = new BankProxyHandler();
		bh.setTarget(obj);
		
		//通过Proxy.newProxyInstance方法返回一个代理类
		return Proxy.newProxyInstance(obj.getClass().getClassLoader(), obj
				.getClass().getInterfaces(), bh);
	}

}
