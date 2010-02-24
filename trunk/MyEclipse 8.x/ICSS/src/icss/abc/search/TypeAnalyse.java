package icss.abc.search;
/*��������char���͵��ַ���ʲô���ͣ����ģ����֣���ĸ����㣩*/
public class TypeAnalyse {

	//����ĸ��ֹ�ַ������磬���������ȵȡ��� ����U0000-U0080��
	private final static int DELIMITER = 0;
	//2�ֽ����֣�������
	private final static int NUM = 1;
	//gb2312�еģ�����:���£ã�2�ֽ��ַ� ͬʱ���� 1�ֽ��ܱ�ʾ�� basic latin and latin-1
	private final static int LETTER = 2;
	// �����ַ�
	private final static int OTHER = 3;
	//������
	private final static int CHINESE = 4;

	
	
	public static int checkType(char c) {
		int ct;
		//���ģ���������0x4e00-0x9fbb
		if ((c >= 0x4e00) && (c <= 0x9fbb)) {
			ct = CHINESE;
		}

		//Halfwidth and Fullwidth Forms�� ��������0xff00-0xffef
		else if ((c >= 0xff00) && (c <= 0xffef)) {
			//        2�ֽ�Ӣ����
			if (((c >= 0xff21) && (c <= 0xff3a))
					|| ((c >= 0xff41) && (c <= 0xff5a))) {
				ct = LETTER;
			}

			//2�ֽ�����
			else if ((c >= 0xff10) && (c <= 0xff19)) {
				ct = NUM;
			}

			//�����ַ���������Ϊ�Ǳ����ţ�ȫ�ǣ�
			else
				ct = DELIMITER;
		}

		//basic latin���������� 0000-007f
		else if ((c >= 0x0021) && (c <= 0x007e)) {
			//1�ֽ�����
			if ((c >= 0x0030) && (c <= 0x0039)) {
				ct = NUM;
			}
			//1�ֽ��ַ�
			else if (((c >= 0x0041) && (c <= 0x005a))
					|| ((c >= 0x0061) && (c <= 0x007a))) {
				ct = LETTER;
			}
			//�����ַ���������Ϊ�Ǳ����ţ���ǣ�
			else
				ct = DELIMITER;
		}

		//latin-1����������0080-00ff
		else if ((c >= 0x00a1) && (c <= 0x00ff)) {
			if ((c >= 0x00c0) && (c <= 0x00ff)) {
				ct = LETTER;
			} else
				ct = DELIMITER;
		} 
		else
			ct = OTHER;

		return ct;
	}

}
