package icss.abc.baseManage.CopyFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class BackupModifyFile {

	/**
	 * @param args
	 */
	final static int SIZE = 16302332;
		/**
		 * @param args
		 */
	public  boolean BackupModifyFile(String args0,String args1,String args2) {
		// TODO Auto-generated method stub
	    //if no argument provided, start at the parent directory
        //		�ɲ�����ȡ���ݵ���·�������Ĭ�������
		String CopyToPath = "";
		///��¼�ɵı��ݴ��ڵ�ַ
		String CopyOldPath = "";
	    
			CopyToPath = args1;  //·��Ϊ�ڶ������������ĵ�ַ
			CopyOldPath = args2; ///���ļ�·��Ϊ����������
		
	    ///
	    File a = new File(CopyToPath);
	    if(a.exists())
	    {}
	    else
	    	a.mkdir();
			
		try
		{
				
			//get the filePath
			File pathName = new File(args0);
			String[] fileNames = pathName.list();
				
				
			//enumerate all files in the directory
			for(int i = 0; i < fileNames.length; i++)
			{
				File f = new File(pathName.getPath(), fileNames[i]);
					
				//make the copy to path
				//CopyToPath+="\\"+fileNames[i];
				File CopyToFile = new File(CopyToPath+"\\"+fileNames[i]);
				///����ɵı��ݶ�Ӧ�ĵ�ַ
				File CopyOldFile = new File(CopyOldPath+"\\"+fileNames[i]);
					
				//if the file is again a directory, call the main method recursivel
				if(f.isDirectory())
				{
					//if the directory exists	
					if(CopyOldFile.exists())
					{
						//if the directory.time not the same,is modified,change it
						if(CopyOldFile.lastModified()!=f.lastModified())
						{
							CopyToFile.mkdir();///
							
							BackupModifyFile(f.getPath(),CopyToPath+"\\"+fileNames[i],CopyOldPath+"\\"+fileNames[i]);
						}
						else
						{   ///make empty director
							CopyToFile.mkdir();///
							BackupModifyFile(f.getPath(),CopyToPath+"\\"+fileNames[i],CopyOldPath+"\\"+fileNames[i]);
						}
					}
					else  //not exists
					{
						CopyToFile.mkdir();
						CopyToFile.setLastModified(f.lastModified());//��ʱ
						BackupModifyFile(f.getPath(),CopyToPath+"\\"+fileNames[i],CopyOldPath+"\\"+fileNames[i]);
					}
					CopyToFile.setLastModified(f.lastModified());//��ʱ
					
				}
				else    //if the file is a file, copy it
				{
					//if the file is exist,if the file.time is the same,do nothing
					if(CopyOldFile.exists()&&CopyOldFile.lastModified()==f.lastModified())
					{
						//ignore,creat empty file to mind this.
						CopyToFile.createNewFile();
						CopyToFile.setLastModified(f.lastModified());
					}
					else  //copy the file 
					{
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
						CopyToFile.setLastModified(f.lastModified());//��ʱ
					}
					
				}//else
					
			}
		}catch(IOException e)
		{
			return false;
		}
		return true;
	}
}