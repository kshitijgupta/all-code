//alpha

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JOptionPane;


public class AudioServer {
	public static void main(String[] args){
		
		try {
			ServerSocket s = new ServerSocket(12345);

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
			Playback pb = new Playback(incoming);
			
			try {		
				System.out.print("3");
				pb.start();
				for(;;)
					;
				//System.out.print("2");
			} finally {
				pb.stop();
				incoming.close();
				System.out.print("1");
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.toString(), "alert",
					JOptionPane.ERROR_MESSAGE);
		}
	}
}