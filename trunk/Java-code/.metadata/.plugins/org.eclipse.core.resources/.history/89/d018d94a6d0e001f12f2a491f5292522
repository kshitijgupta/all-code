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

public class Customer {
	public static void main(String[] args){
		
		String strIP = JOptionPane.showInputDialog("输入主机ip");
		try{
			Socket s = new Socket(strIP, 10000);
			
		 	
			try{
				
				String message = JOptionPane.showInputDialog("请输入发送内容");
				char[] charMessage = message.toCharArray();
				
				InputStream inStream = s.getInputStream();
				OutputStream outStream = s.getOutputStream();
				
				BufferedReader in = new BufferedReader(new InputStreamReader(inStream));
				PrintWriter out = new PrintWriter(outStream, true);
				
				
				for(int i=0; i<message.length();i++)
				{
					out.println(charMessage[i]+"");
					out.flush();
					
					
					String line = in.readLine();
					
					if(line.compareTo("接受")==0)
						JOptionPane.showMessageDialog(null, "服务器选择了接受","" , JOptionPane.INFORMATION_MESSAGE);
					else if(line.compareTo("丢弃")==0)
						JOptionPane.showMessageDialog(null, "服务器选择了丢弃","" , JOptionPane.INFORMATION_MESSAGE);
					else if(line.compareTo("超时")==0)
					{
						JOptionPane.showMessageDialog(null, "超时","" , JOptionPane.INFORMATION_MESSAGE);
						out.println(charMessage[i]);
						out.flush();
						
						String l = in.readLine();
						while(l.compareTo("接受")==0)
						{
							JOptionPane.showMessageDialog(null, "超时重新发送", "", JOptionPane.INFORMATION_MESSAGE);
							out.print(charMessage[i]);
							out.flush();
							
							l = in.readLine();
						}
					}
					
				}
			}
			finally
			{
				s.close();
			}
		}
		catch(Exception e)
		{
			JOptionPane.showMessageDialog(null, e.toString(), "alert", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	
}
