/*
 实验在不影响停止等待协议基本思想的前提下进行简化,以简化编程过程
编写两个计算机程序,第一个程序模拟发送方,首先从界面读取待发送字符(每次接收
一个字符的输入),然后等待接收方应答;第二个程序模拟接收方,然后模拟界面选择,
a.Ack-->接收该字符,b.NAK--〉丢弃,c.无反应--〉模拟超时.发送方根据接收方的应答进
行相应的处理,如果发送方收到的是 c,则重传该字符,否则继续接收用户的输入.要求单
机测试之后在双机上进行验证
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
					Object[] possibleValues = { "接受", "丢弃", "超时" };
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