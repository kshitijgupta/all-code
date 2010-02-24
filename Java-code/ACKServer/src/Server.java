/*
 ʵ���ڲ�Ӱ��ֹͣ�ȴ�Э�����˼���ǰ���½��м�,�Լ򻯱�̹���
��д�������������,��һ������ģ�ⷢ�ͷ�,���ȴӽ����ȡ�������ַ�(ÿ�ν���
һ���ַ�������),Ȼ��ȴ����շ�Ӧ��;�ڶ�������ģ����շ�,Ȼ��ģ�����ѡ��,
a.Ack-->���ո��ַ�,b.NAK--������,c.�޷�Ӧ--��ģ�ⳬʱ.���ͷ����ݽ��շ���Ӧ���
����Ӧ�Ĵ���,������ͷ��յ����� c,���ش����ַ�,������������û�������.Ҫ��
������֮����˫���Ͻ�����֤
*/

import java.io.*;
import java.net.*;
import java.util.*;
import java.awt.*;
import javax.swing.*;

public class Server {
	public static void main(String[] args) {
		try {
			ServerSocket s = new ServerSocket(10000);

			while (true) {
				Socket incoming = s.accept();
				Runnable r = new ThreadedHandle(incoming);
				Thread t = new Thread(r);
				t.start();
			}
		} catch (Exception e) {

		}
	}
}

class ThreadedHandle implements Runnable {
	private Socket incoming;

	ThreadedHandle(Socket incoming) {
		this.incoming = incoming;
	}

	public void run() {
		try {
			try {
				InputStream inStream = incoming.getInputStream();
				OutputStream outStream = incoming.getOutputStream();

				BufferedReader in = new BufferedReader(new InputStreamReader(inStream));
				PrintWriter out = new PrintWriter(outStream, true /* autoFlush */);

				//String line = in.next();
				while(in.readLine()!=null)
				{
					Object[] possibleValues = { "����", "����", "��ʱ" };
					Object selectedValue = JOptionPane.showInputDialog(null,
							"Choose one", "Input", JOptionPane.INFORMATION_MESSAGE,
							null, possibleValues, possibleValues[0]);

					out.println(selectedValue.toString()+"");
					out.flush();
				}

			} finally {
				incoming.close();
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.toString(), "alert",
					JOptionPane.ERROR_MESSAGE);
		}
	}
}