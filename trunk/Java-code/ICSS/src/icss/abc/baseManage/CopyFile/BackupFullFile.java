package icss.abc.baseManage.CopyFile;

import icss.abc.log.base.dao.LogBaseDAO;
import icss.abc.log.vo.LogVO;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BackupFullFile {
	final static int SIZE = 16302332;
	/**
	 * @param args
	 * @throws IOException 
	 * @throws IOException 
	 */
	public boolean BackupFullFile(String args0,String args1,String args2) throws IOException{
        //if no argument provided, start at the parent directory
//		�ɲ�����ȡ���ݵ���·�������Ĭ�������
		String CopyToPath =args1;
		String n=args2;
		String BackupDbName = "";
		if(n.equals("0")){
		    boolean k = false;
			deleteFullFiles dele = new deleteFullFiles();
			k=dele.deleteFullFiles(CopyToPath);
			//�ж��Ƿ�ִ�����
			if(k==false){System.out.println("ʧ��");}
			//�ؽ������ļ���
			File backupFile = new File(CopyToPath);
			backupFile.mkdir();//���������ļ������ļ���
			//��ʽ��ʱ��
			Date NowTimes = new Date();
			  //��ʱ���ʽ����yyMMddhhmmss(������ʱ����)������200805010043   2008��5��1��0��43�֡�
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			  //��ʱ�����������ļ������ƣ����ڻ�ԭʱ��ʱ��ѡ��
			BackupDbName = sdf.format(NowTimes);
			//ƴ�ӱ����ļ�·��  Ϊback����·��+ʱ��
			CopyToPath = CopyToPath+"\\"+BackupDbName;
			File backupDataFile = new File(CopyToPath);
			backupDataFile.mkdir();//���������ļ������ļ���
			
			BackupDb bkd = new BackupDb();
			if(!bkd.backupDb(CopyToPath,BackupDbName)){//�������ݿ��ļ�ʧ��
				return false;
			}
		}
		
		
		try
		{
			//get the filePath
			File pathName = new File(args0);
			String[] fileNames = pathName.list();
			
			
			//enumerate all files in the directory
			for(int i = 0; i < fileNames.length; i++)
			{
				File f = new File(pathName.getPath(), fileNames[i]);
				
				
				File CopyToFile = new File(CopyToPath+"\\"+fileNames[i]);
				//if the file is again a directory, call the main method recursivel
				if(f.isDirectory())
				{
					
					if(!CopyToFile.exists())
					{
						CopyToFile.mkdir();
					}
					
					BackupFullFile(f.getPath(),CopyToPath+"\\"+fileNames[i],"1");
					//CopyToFile.setLastModified(f.lastModified());//��ʱ
				}
				else    //if the file is a file, copy it
				{
					CopyToFile.createNewFile();
					FileInputStream fis = new FileInputStream(f.getCanonicalPath());
					FileOutputStream fos = new FileOutputStream(CopyToFile.getCanonicalPath());
					int num = fis.available();
					if (num <= SIZE) {
						byte by[] = new byte[num];//�����ֽ����飬��С���������ɶ�ȡ��С      

						fis.read(by);//3.��������ȡ��Ϣ���ֽ�����     

						fos.write(by);//4.�Ѷ������ֽ���Ϣд��Ŀ���ļ�            

						fis.close(); //�ر���

						fos.close();

					}
					else{
						int times = num/SIZE + 1;
						for(int j=0; j<times; j++){
							byte by[] = new byte[SIZE];  

							fis.read(by);//3.��������ȡ��Ϣ���ֽ�����     

							fos.write(by);//4.�Ѷ������ֽ���Ϣд��Ŀ���ļ� 
						}
						fis.close(); //�ر���

						fos.close();
					}//else
				}//else
				
				CopyToFile.setLastModified(f.lastModified());//��ʱ
			}
		}catch(IOException e)
		{
			return false;
		}
		
		return true;
	}

  }

