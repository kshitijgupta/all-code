package icss.abc.baseManage.CopyFile;

import java.io.File;
import java.io.IOException;

public class BackupDb {
	public  boolean backupDb(String backupDbPath,String fileName) throws IOException{
		// TODO Auto-generated method stub
		  //获得资源文件存放的路径与存储在的时间命名的文件夹名。
		  String BackupDbPath = backupDbPath;
		  String FileName = fileName;
		  
		  String BackupDbName = fileName + ".dmp";
		  
		  
		  try {
			  Runtime.getRuntime().exec("cmd /c \"exp testuser/luolei file='"+BackupDbPath+"\\"+BackupDbName+"'"); //执行备份数据库
		   
		  } catch (Exception e) {
		   e.printStackTrace();
		   return false;
		  }
		  //判断备份是否成功
		  //while(true)
		  //{
		   // if(ifFileExist(BackupDbPath,BackupDbName)){
		    	//Thread.currentThread().sleep(3000);//
				  return true;
			 // }
		  //}
		}
	public static boolean ifFileExist(String BackupDbPatch,String BackupDbName){
		
		File file=new File(BackupDbPatch +"\\"+ BackupDbName);
		if(file.exists()){
			return true;
		}else{
		return false;
		}
	}
	

}
