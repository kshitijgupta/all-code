/*
 * AOP (Aspect-Oriented Programming, ����������)
 * JDK1.3���Ժ�汾��JDK�������ṩ�˶�̬�����֧�֡������߿���ͨ��ʵ��
 * java.lang.reflect.InvocationHandler�ӿ����ṩһ��ִ�д�������
 * Ȼ��ͨ��java.lang.reflect.Proxy�õ�һ���������ͨ������������
 * ��ִ�б������ࣨҵ���߼����������ڱ������ࣨҵ���߼�������������ʱ��ִ
 * �д��������Զ�������
 * 
 * ������ҵ���߼�����϶ȣ���������в�����Bank���remit��saving�����м�
 * �����־�Ĵ�������ͨ����������bank���remit��saving��������ǰ�����
 * ����־����
 * 
 * ��������һ���ܴ�ĺô����ǣ�������֧�ֲ���ԣ�ֻҪ�޸����ؿ�������˧������
 * */
public class TestRun {
	
	public static void main(String[] args){
		//���屻�����ࣨҵ���߼���
		Bank mb = new Bank();
		//���ɴ�����
		Bankinterface bl = (Bankinterface)BankProxyFactory.getProxy(mb);
		//ִ�д����෽��
		//������
		bl.remit();
		//��Ǯ����
		bl.saving();
	}

}
