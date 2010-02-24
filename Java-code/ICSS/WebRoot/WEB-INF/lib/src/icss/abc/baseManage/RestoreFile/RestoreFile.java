package icss.abc.baseManage.RestoreFile;

import java.io.File;
import java.io.IOException;
import java.sql.*;

import icss.abc.base.db.DBConnection;
import icss.abc.baseManage.CopyFile.deleteFullFiles;

public class RestoreFile {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws IOException 
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public boolean RestoreFile(String FileName,String resourceDir,String backupDir) throws IOException{
		// TODO Auto-generated method stub
		
		//the sourse source path,restore to path
		//File osFilePath = new File("c:\\sourse");
		//get the backup file list
		File oldPathName = new File(backupDir);
		String[] oldFileNames = oldPathName.list();
		//delete old source 
		//删除源文件，好下一步还原
	    boolean k = false;
		deleteFullFiles dele = new deleteFullFiles();
		k=dele.deleteFullFiles(resourceDir);
		//判断是否执行完毕
		if(k==false){System.out.println("失败");}
		//重建源文件夹
		for(int jish=0;jish<1000;jish++){}
		File sourceFile = new File(resourceDir);
		sourceFile.mkdir();//重建源文件夹文件夹
		
		
		
			
		int j = 0;
		String filename = FileName;
		for(j = oldFileNames.length;j>0;j--)
		{
			if(oldFileNames[j-1].equals(filename))
			     break;
		}
		int restoreId = j-1;//向用户弹出一个层，提示用户选择恢复的日期，从日期可以找到是第几个文件，知道了下标i，
		if(j<0)return false;
		
		CopyBackupFiles copyfile = new CopyBackupFiles();
		copyfile.copyBackupFiles(backupDir+"\\"+FileName, resourceDir, FileName+".dmp");
		/*try {
			Runtime.getRuntime().exec("cmd /c xcopy \""+backupDir+"\\"+oldFileNames[restoreId]+"\" \""+resourceDir+"\" /e /Y");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return false;
		}*/
		
		for(int j1 = 0; j1<1000; j1++){}
		File f = new File(resourceDir+"\\"+filename+".dmp");
		System.out.println(resourceDir+"\\"+filename+".dmp");
		f.delete();
		for(int i=1; i<restoreId+1; i++)
		{
			for(int j1 = 0; j1<1000; j1++){}
		    //use cmd to xcopy the file back
		    try {
				Runtime.getRuntime().exec("cmd /c xcopy \""+backupDir+"\\"+oldFileNames[restoreId-i]+"\" \""+resourceDir+"\" /e /Y");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		Connection conn = null;
		
	    try{
	    //DBConnection dbconnection = new DBConnection();
	     
		conn=DBConnection.getConnection();
		//创建Statement
		//stmt = conn.prepareStatement("select abcfile.fileid,filetype,filename,fileauthor,abcfile.Time,filelabel,filedescribe,foldname from abcfile,filefolder,abcfolder where abcfile.fileid= "+fileid+" And abcfile.fileid=filefolder.fileid and filefolder.folderid=abcfolder.folderid");
		  Statement stmt = conn.createStatement();
	      stmt.addBatch("drop table filedept");
	      stmt.addBatch("drop table abcfolder");
	      stmt.addBatch("drop table userdept");
	      stmt.addBatch("drop table userpower");
	      stmt.addBatch("drop table words");
	      stmt.addBatch("drop table filefolder");
	      stmt.addBatch("drop table logcontent");
	      stmt.addBatch("drop table scan");
	      stmt.addBatch("drop table abcfile");
	      stmt.addBatch("drop table usertable");
	      stmt.addBatch("drop table department");
	      stmt.addBatch("drop table abclog");

	      int[] updateCounts = stmt.executeBatch();
	      stmt.close();
	      conn.close();
	    }catch(Exception e){
	         System.out.println("error");
	    }
        //		恢复数据库
		//先截断可以截断的表单，速度快
		//在drop掉主键有外键关联的表单
		//然后进行还原drop的表
		//Runtime.getRuntime().exec("tableAction.bat");
		//for(int h=0;h<1000;h++){}
		//Runtime.getRuntime().exec("truncate.bat");
		//Runtime.getRuntime().exec("droptable.bat");
		//Runtime.getRuntime().exec("restoreTable.bat");
		//表重建后还原数据
		Runtime.getRuntime().exec("cmd /c \"imp testuser/luolei file='"+backupDir+"\\"+filename+"\\"+filename+".dmp'"+" ignore=y tables=(abcfile,abcfolder,abclog,department,filedept,filefolder,logcontent,scan,userdept,userpower,usertable,words)"+"\"");
		//System.out.println("cmd /c \"imp testuser/luolei file='"+backupDir+"\\"+filename+"\\"+filename+".dmp'"+" ignore=y tables=(abcfile,abcfolder,abclog,department,filedept,filefolder,logcontent,scan,userdept,userpower,usertable,words)"+"\"");
		
		return true;
		
	}

}