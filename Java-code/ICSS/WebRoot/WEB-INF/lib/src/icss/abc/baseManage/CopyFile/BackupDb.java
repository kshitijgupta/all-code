package icss.abc.baseManage.CopyFile;

import java.io.File;
import java.io.IOException;

public class BackupDb {
	public  boolean backupDb(String backupDbPath,String fileName) throws IOException{
		// TODO Auto-generated method stub
		  //�����Դ�ļ���ŵ�·����洢�ڵ�ʱ���������ļ�������
		  String BackupDbPath = backupDbPath;
		  String FileName = fileName;
		  
		  String BackupDbName = fileName + ".dmp";
		  
		  
		  try {
			  Runtime.getRuntime().exec("cmd /c \"exp testuser/luolei file='"+BackupDbPath+"\\"+BackupDbName+"'"); //ִ�б������ݿ�
		   
		  } catch (Exception e) {
		   e.printStackTrace();
		   return false;
		  }
		  //�жϱ����Ƿ�ɹ�
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
