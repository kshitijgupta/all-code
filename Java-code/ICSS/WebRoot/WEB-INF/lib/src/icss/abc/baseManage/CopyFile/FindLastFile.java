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
                //("没有备份文件，请选择完整备份！");
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
		  //将时间格式化成yyMMddhhmmss(年月日时分秒)，例如200805010043   2008年5月1日0点43分。
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		  //按时间命名备份文件的名称，便于还原时的时间选择
		String BackupDbName = sdf.format(NowTimes);
		
		//创建备份时间文件夹
		File afile = new File(backupPath+"\\"+BackupDbName);
	    afile.mkdir();
	    
	    //创建数据库备份
	    BackupDb bkd = new BackupDb();
		if(!bkd.backupDb(backupPath+"\\"+BackupDbName,BackupDbName)){//备份数据库文件失败
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
