/*
 * AOP (Aspect-Oriented Programming, 面向切面编程)
 * JDK1.3及以后版本的JDK开发包提供了动态代理的支持。开发者可以通过实现
 * java.lang.reflect.InvocationHandler接口来提供一个执行处理器，
 * 然后通过java.lang.reflect.Proxy得到一个代理对象，通过这个代理对象
 * 来执行被代理类（业务逻辑）方法，在被代理类（业务逻辑）方法被调用时，执
 * 行处理器会自动被调用
 * 
 * 降低了业务逻辑的耦合度，比如此例中不用在Bank类的remit和saving方法中加
 * 入对日志的处理，而是通过拦截器在bank类的remit和saving方法调用前后进行
 * 了日志处理。
 * 
 * 拦截器有一个很大的好处就是：拦截器支持插拔性（只要修改拦截控制器）帅！！！
 * */
public class TestRun {
	
	public static void main(String[] args){
		//定义被代理类（业务逻辑）
		Bank mb = new Bank();
		//生成代理类
		Bankinterface bl = (Bankinterface)BankProxyFactory.getProxy(mb);
		//执行代理类方法
		//汇款操作
		bl.remit();
		//存钱操作
		bl.saving();
	}

}
