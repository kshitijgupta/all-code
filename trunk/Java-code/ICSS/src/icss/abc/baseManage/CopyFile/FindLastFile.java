package icss.abc.baseManage.CopyFile;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import icss.abc.baseManage.CopyFile.*;

public class FindLastFile {

	/**
	 * @param args
	 */
	    
	public String FindLastFile(String backupDir,String resourceDir) throws IOException {
		// TODO Auto-generated method stub
//		get the filePath
		String backupPath = backupDir;
		//Copy to path if not exist --creat
		File oldPathName = new File(backupPath);
		File a =null;
		if(!oldPathName.exists())
		{
			oldPathName.mkdirs();
		}
		else //check the last copy file
		{
		    String[] oldFileNames = oldPathName.list();
		    
		    //check the filelist , if empty , ask the admin use fullCopy
		    if(oldFileNames.length==0)
		    {
                //("û�б����ļ�����ѡ���������ݣ�");
		    	return "empty";
		    }
		    
            
		    a = new File(backupPath+"\\"+oldFileNames[0]);
		    for(int i = 1; i < oldFileNames.length; i++)
		    {
			
			    File b = new File(backupPath+"\\"+oldFileNames[i]);
			    if(a.lastModified()< b.lastModified())
			    {
				    a = b;
			    }
		    }
		}
		
		
     	Date NowTimes = new Date();
		  //��ʱ���ʽ����yyMMddhhmmss(������ʱ����)������200805010043   2008��5��1��0��43�֡�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		  //��ʱ�����������ļ������ƣ����ڻ�ԭʱ��ʱ��ѡ��
		String BackupDbName = sdf.format(NowTimes);
		
		//��������ʱ���ļ���
		File afile = new File(backupPath+"\\"+BackupDbName);
	    afile.mkdir();
	    
	    //�������ݿⱸ��
	    BackupDb bkd = new BackupDb();
		if(!bkd.backupDb(backupPath+"\\"+BackupDbName,BackupDbName)){//�������ݿ��ļ�ʧ��
			return "error";
		}
		
		BackupModifyFile backupModifyFile = new BackupModifyFile();
		
		if(backupModifyFile.BackupModifyFile(resourceDir,backupPath+"\\"+BackupDbName,a.getPath()))
		{
			return "ok";
		}
		else
		{
			return "error";
		}
	}

}
