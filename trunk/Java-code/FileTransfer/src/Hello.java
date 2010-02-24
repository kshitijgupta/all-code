/*
 * ���ֽ��������ļ�
 * ���Ȱ��ļ��洢��һ��byte�����Ȼ������byte����д����һ���ļ���
 * �����ļ�����Ļ�����������������׳��ڴ�����쳣��
 * ������Ѵ��ļ��ֳ����ɴηֱ��ƣ�������һ�θ���15.5M��С���ļ���û����ģ���15.5m���ļ�����byte������ռ16302332���ռ�
 * ���Զ�����һ������SIZE
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

	JButton btn = new JButton("����");

	JButton viewButton1 = new JButton("���");
	JButton viewButton2 = new JButton("���");
	JFileChooser chooser;

	Hello() {

		JPanel p1 = new JPanel();

		p1.add(new JLabel("Դ�ļ�"));

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

		p2.add(new JLabel("Ŀ���ļ�"));

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

		setTitle("���ֽ��������ļ�");

		setSize(550, 150);

		setVisible(true);
	}

	public void actionPerformed(ActionEvent e) {//���ư�ť�ļ�����

		try {

			FileInputStream fis = new FileInputStream(t1.getText());

			//2.�����ֽ������,������Ŀ���ļ��Ĺ���

			FileOutputStream fos = new FileOutputStream(t2.getText());
			int num = fis.available();
			if (num <= SIZE) {
				byte by[] = new byte[num];//�����ֽ����飬��С���������ɶ�ȡ��С      

				fis.read(by);//3.��������ȡ��Ϣ���ֽ�����     

				fos.write(by);//4.�Ѷ������ֽ���Ϣд��Ŀ���ļ�            

				fis.close(); //�ر���

				fos.close();

				JOptionPane.showMessageDialog(null, "���Ƴɹ���");
			}
			else{
				int times = num/SIZE + 1;
				for(int i=0; i<times; i++){
					byte by[] = new byte[SIZE];  

					fis.read(by);//3.��������ȡ��Ϣ���ֽ�����     

					fos.write(by);//4.�Ѷ������ֽ���Ϣд��Ŀ���ļ� 
				}
				fis.close(); //�ر���

				fos.close();
				JOptionPane.showMessageDialog(null, "���Ƴɹ���");
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