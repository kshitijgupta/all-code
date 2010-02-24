//alpha

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JOptionPane;


public class Ctrler {
	
	public static void main(String[] args){
		
		String strIP = JOptionPane.showInputDialog("ÊäÈëÖ÷»úip");
		try{
			Socket s = new Socket(strIP, 12345);
			
			Capture capture = new Capture(s);
			
			try{	
				capture.start();
				for(;;)
					;
			}
			finally
			{
				capture.stop();
				s.close();
			}
		}
		catch(Exception e)
		{
			JOptionPane.showMessageDialog(null, e.toString(), "alert", JOptionPane.ERROR_MESSAGE);
		}
	}
	
	
}
