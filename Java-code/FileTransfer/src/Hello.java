/*
 * 用字节流复制文件
 * 首先把文件存储在一个byte数组里，然后把这个byte数组写到另一个文件里
 * 发现文件过大的话会由于虚拟机问题抛出内存错误异常，
 * 解决：把大文件分成若干次分别复制，经试验一次复制15.5M大小的文件是没问题的，把15.5m的文件读到byte数组中占16302332个空间
 * 所以定义了一个常量SIZE
 * */

import java.io.*;

import java.awt.*;

import java.awt.event.*;

import java.util.*;

import javax.swing.*;

public class Hello extends JFrame implements ActionListener {
	final int SIZE = 16302332;
	JTextField t1 = new JTextField(30);

	JTextField t2 = new JTextField(30);

	JButton btn = new JButton("复制");

	JButton viewButton1 = new JButton("浏览");
	JButton viewButton2 = new JButton("浏览");
	JFileChooser chooser;

	Hello() {

		JPanel p1 = new JPanel();

		p1.add(new JLabel("源文件"));

		p1.add(t1);

		p1.add(viewButton1);
		viewButton1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chooser = new JFileChooser();
				chooser.setCurrentDirectory(new File("."));

				// show file chooser dialog
				int result = chooser.showOpenDialog(Hello.this);

				if (result == JFileChooser.APPROVE_OPTION) {
					String name = chooser.getSelectedFile().getPath();
					t1.setText(name);
				}
			}
		});

		JPanel p2 = new JPanel();

		p2.add(new JLabel("目标文件"));

		p2.add(t2);

		p2.add(viewButton2);
		viewButton2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				chooser = new JFileChooser();
				chooser.setCurrentDirectory(new File("."));

				// show file chooser dialog
				int result = chooser.showOpenDialog(Hello.this);

				if (result == JFileChooser.APPROVE_OPTION) {
					String name = chooser.getSelectedFile().getPath();
					t2.setText(name);
				}
			}
		});
		JPanel p3 = new JPanel();

		p3.add(btn);

		this.getContentPane().setLayout(new GridLayout(3, 1));

		this.getContentPane().add(p1);

		this.getContentPane().add(p2);

		this.getContentPane().add(p3);

		btn.addActionListener(this);

		setTitle("用字节流复制文件");

		setSize(550, 150);

		setVisible(true);
	}

	public void actionPerformed(ActionEvent e) {//复制按钮的监听器

		try {

			FileInputStream fis = new FileInputStream(t1.getText());

			//2.构造字节输出流,建立与目标文件的关联

			FileOutputStream fos = new FileOutputStream(t2.getText());
			int num = fis.available();
			if (num <= SIZE) {
				byte by[] = new byte[num];//创建字节数组，大小是输入流可读取大小      

				fis.read(by);//3.输入流读取信息到字节数组     

				fos.write(by);//4.把读到的字节信息写入目标文件            

				fis.close(); //关闭流

				fos.close();

				JOptionPane.showMessageDialog(null, "复制成功！");
			}
			else{
				int times = num/SIZE + 1;
				for(int i=0; i<times; i++){
					byte by[] = new byte[SIZE];  

					fis.read(by);//3.输入流读取信息到字节数组     

					fos.write(by);//4.把读到的字节信息写入目标文件 
				}
				fis.close(); //关闭流

				fos.close();
				JOptionPane.showMessageDialog(null, "复制成功！");
			}
		}

		catch (IOException ee)

		{
			System.err.println(ee.toString());
		}
	}

	public static void main(String[] args) throws IOException {

		JFrame.setDefaultLookAndFeelDecorated(true);

		/*Font font = new Font("JFrame", Font.PLAIN, 14);

		Enumeration keys = UIManager.getLookAndFeelDefaults().keys();
		while (keys.hasMoreElements()) {

			Object key = keys.nextElement();

			if (UIManager.get(key) instanceof Font)

				UIManager.put(key, font);
		}
		 */
		new Hello();
	}
}