//����һ�����ɴ�����Ĺ�����

import java.lang.reflect.Proxy;

public class BankProxyFactory {
	
	public static Object getProxy(Object obj){
		
		BankProxyHandler bh = new BankProxyHandler();
		bh.setTarget(obj);
		
		//ͨ��Proxy.newProxyInstance��������һ��������
		return Proxy.newProxyInstance(obj.getClass().getClassLoader(), obj
				.getClass().getInterfaces(), bh);
	}

}
