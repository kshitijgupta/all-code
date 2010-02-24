/*
 * ����ʵ�� Set �ӿڣ��ýӿ��� TreeMap ʵ��֧�֡����ౣ֤������ set ������������Ԫ�أ�
 * ����ʹ�õĹ��췽����ͬ�����ܻᰴ��Ԫ�ص���Ȼ˳�� �������򣬻����ڴ��� set ʱ���ṩ��
 * �Ƚ�����������
 * ��һ�����򼯺�,Ԫ���а���������,ȱʡ�ǰ�����Ȼ˳���������,��ζ��TreeSet��Ԫ��Ҫʵ
 * ��Comparable�ӿ�;
 * ���ǿ��Թ���TreeSet����ʱ,����ʵ����Comparator�ӿڵıȽ�������.
 */

import java.util.*;

public class TreeSetTest {
	public static void main(String[] args) {
		//TreeSet ts=new TreeSet();
		TreeSet<Students> ts = new TreeSet(new Students.compareToStudent());
		ts.add(new Students(2, "zhangshan"));
		ts.add(new Students(3, "lishi"));
		ts.add(new Students(1, "wangwu"));
		ts.add(new Students(4, "maliu"));

		Iterator it = ts.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
	}

}

class Students implements Comparable {
	int num;
	String name;

	Students(int num, String name) {
		this.num = num;
		this.name = name;
	}

	static class compareToStudent implements Comparator //����һ���ڲ�����ʵ�ֱȽ���
	{
		public int compare(Object o1, Object o2) {
			Students s1 = (Students) o1;
			Students s2 = (Students) o2;
			int rulst = s1.num > s2.num ? 1 : (s1.num == s2.num ? 0 : -1);
			if (rulst == 0) {
				rulst = s1.name.compareTo(s2.name);
			}
			return rulst;
		}
	}

	public int compareTo(Object o) //д����ıȽϷ���
	{
		int result;
		Students s = (Students) o;
		result = num > s.num ? 1 : (num == s.num ? 0 : -1);
		if (result == 0) {
			result = name.compareTo(s.name);
		}
		return result;
	}

	public String toString() {
		return num + ":" + name;
	}
}
