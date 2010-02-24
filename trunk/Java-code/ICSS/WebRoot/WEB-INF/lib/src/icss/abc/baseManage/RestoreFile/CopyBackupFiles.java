package icss.abc.baseManage.RestoreFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class CopyBackupFiles {
	final static int SIZE = 16302332;
	/**
	 * @param args
	 */
	public void copyBackupFiles(String backupFilePath,String sourceFilePath,String backupfilename) {
		// TODO Auto-generated method stub
        //if no argument provided, start at the parent directory
//		�ɲ�����ȡ���ݵ���·�������Ĭ�������
		String CopyToPath = sourceFilePath;
		String CopyFromPath = backupFilePath;
		
		
		try
		{
			
			//get the filePath
			File pathName = new File(CopyFromPath);
			String[] fileNames = pathName.list();
			
			
			//enumerate all files in the directory
			for(int i = 0; i < fileNames.length; i++)
			{
				File f = new File(pathName.getPath(), fileNames[i]);
				
				//make the copy to path
				//CopyToPath+="\\"+fileNames[i];
				File CopyToFile = new File(CopyToPath+"\\"+fileNames[i]);
				
				//if the file is again a directory, call the main method recursivel
				if(f.isDirectory())
				{
						CopyToFile.mkdir();
					
					    copyBackupFiles(CopyFromPath+"\\"+fileNames[i],CopyToPath+"\\"+fileNames[i],backupfilename);
				}
				else    //if the file is a file, copy it
				{
					if(fileNames[i].equals(backupfilename)){}else{
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
					}
					
				}//else
				
			}
		}catch(IOException e)
		{
			e.printStackTrace();
		}
	}
}
