/*
 * ����ʵ�� Set �ӿڣ��ɹ�ϣ��ʵ������һ�� HashMap ʵ����֧�֡�������֤���ϵĵ���˳��
 * �ر���������֤��˳���ò��䡣��������ʹ�� null Ԫ�ء�
 * ����Ϊ���������ṩ���ȶ����ܣ���Щ������������ add��remove��contains �� size��
 * �ٶ���ϣ��������ЩԪ����ȷ�طֲ���Ͱ�С��Դ˼��Ͻ��е��������ʱ���� HashSet ʵ����
 * ��С��Ԫ�ص��������͵ײ� HashMap ʵ����Ͱ���������ġ��������ĺͳɱ�������ˣ������������
 * ����Ҫ����Ҫ����ʼ�������õ�̫�ߣ��򽫼����������õ�̫�ͣ���
 */
import java.util.HashSet;
import java.util.Iterator;

public class HashSetTest {
         public static void main(String[] args)
         {
                 HashSet hs=new HashSet();
                 hs.add("one");
                 hs.add("two");
                 hs.add("three");
                 hs.add("four");
                 hs.add(new Student(1,"zhangsan"));
                 hs.add(new Student(2,"lishi"));
                 hs.add(new Student(3,"wangwu"));
                 hs.add(new Student(1,"zhangsan"));
                
                 Iterator it=hs.iterator();
                 while(it.hasNext())
                 {
                         System.out.println(it.next());
                 }
         }
}
class Student         //HashSetҪ��дhashCode��equals����
{
         int num;
         String name;
         Student(int num,String name)
         {
                 this.num=num;
                 this.name=name;
         }
         public String toString()
         {
                 return "num :"+num+" name:"+name;
         }
         public int hashCode()
         {
                 return num*name.hashCode();
         }
         public boolean equals(Object o)
         {
                 Student s=(Student)o;
                 return num==s.num && name.equals(s.name);
         }
}