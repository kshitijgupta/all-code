package icss.abc.base.db;


/*
 * ʵ��key-value�Ķ�Ӧ��ϵ
 * 
 * Key :ִ�еĲ���������insert ,update ,delete ,batchdel..
 */
public class KeyValue {
	private String key;
	private Object value;
	
	public KeyValue(String key,Object value){
		this.key 	= key;
		this.value 	= value;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
}
