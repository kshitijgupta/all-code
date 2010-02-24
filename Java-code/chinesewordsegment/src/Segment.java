import java.util.ArrayList;
import java.util.List;

public class Segment {

	//非字母截止字符，例如，．）（　等等　（ 包含U0000-U0080）
	private final static int DELIMITER = 0;
	//2字节数字１２３４
	private final static int NUM = 1;
	//gb2312中的，例如:ＡＢＣ，2字节字符 同时包含 1字节能表示的 basic latin and latin-1
	private final static int LETTER = 2;
	// 其他字符
	private final static int OTHER = 3;
	//中文字
	private final static int CHINESE = 4;

	public static void main(String[] args) {

		for (int i = 0; i < args.length; i++) {
			//System.out.println(args[i]);
			String str = args[i].trim();

			boolean en = isLetterIn(str);
			if (en == true) {
				System.out.println(args[i]);
				List ls = cutEnglish(str);
				for(int j=0; j<ls.size(); j++){
					KeyValue kv = (KeyValue) ls.get(j);
					if(kv.getKey()==-1){
						List chinesels = cutChinese(kv.getValue());
						for (int k = 0; k < chinesels.size(); k++)
							System.out.println(chinesels.get(k));
					}
					else if(kv.getKey()==1){
						System.out.println(kv.getValue());
					}
				}
			} else {
				List ls = cutChinese(str);
				for (int j = 0; j < ls.size(); j++)
					System.out.println(ls.get(j));
			}
		}

	}

	private static boolean isLetterIn(String str) {

		boolean result = false;

		char[] charray = str.toCharArray();

		for (int i = 0; i < charray.length; i++) {
			int type = TypeAnalyse.checkType(charray[i]);
			if (type == LETTER) {
				result = true;
				break;
			}
		}

		return result;
	}

	private static List cutEnglish(String str) {

		int flag = 0;
		//int isChanged = -1;
		List result = new ArrayList<KeyValue>();

		char[] ch = str.toCharArray();

		if (TypeAnalyse.checkType(ch[0])==CHINESE)
			flag = -1;//flag = -1 means ch[i] is a chinese word
		else
			flag = 1;//flag =1 means ch[i] is a letter of digit
		
		StringBuilder sb = new StringBuilder("");
		sb.append(ch[0]);
		for (int i = 1; i < ch.length; i++) {
			
			if ((!(TypeAnalyse.checkType(ch[i])==CHINESE)) && flag == 1) {
				sb.append(ch[i]);
			} else if ((TypeAnalyse.checkType(ch[i])==CHINESE) && flag == -1) {
				sb.append(ch[i]);
			} else {

				KeyValue kv = new KeyValue(flag, sb.toString());
				result.add(kv);
				sb.delete(0, sb.length());
				flag = 0 - flag;
				sb.append(ch[i]);

			}

		}
		KeyValue kv = new KeyValue(flag, sb.toString());
		result.add(kv);
		return result;
	}

	private static List cutChinese(String str) {

		List result = new ArrayList<String>();

		char[] ch = str.toCharArray();

		for (int i = 0; i < ch.length - 1; i++) {
			char[] words = { ch[i], ch[i + 1] };
			String strwords = new String(words);

			result.add(strwords);
		}
		return result;
	}
}
