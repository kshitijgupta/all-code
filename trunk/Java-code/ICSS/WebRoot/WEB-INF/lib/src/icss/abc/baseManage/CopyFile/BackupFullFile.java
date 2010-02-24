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
//		由参数获取备份到的路径或这就默认是这个
		String CopyToPath =args1;
		String n=args2;
		String BackupDbName = "";
		if(n.equals("0")){
		    boolean k = false;
			deleteFullFiles dele = new deleteFullFiles();
			k=dele.deleteFullFiles(CopyToPath);
			//判断是否执行完毕
			if(k==false){System.out.println("失败");}
			//重建备份文件夹
			File backupFile = new File(CopyToPath);
			backupFile.mkdir();//创建备份文件日期文件夹
			//格式化时间
			Date NowTimes = new Date();
			  //将时间格式化成yyMMddhhmmss(年月日时分秒)，例如200805010043   2008年5月1日0点43分。
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			  //按时间命名备份文件的名称，便于还原时的时间选择
			BackupDbName = sdf.format(NowTimes);
			//拼接备份文件路径  为back绝对路径+时间
			CopyToPath = CopyToPath+"\\"+BackupDbName;
			File backupDataFile = new File(CopyToPath);
			backupDataFile.mkdir();//创建备份文件日期文件夹
			
			BackupDb bkd = new BackupDb();
			if(!bkd.backupDb(CopyToPath,BackupDbName)){//备份数据库文件失败
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
					//CopyToFile.setLastModified(f.lastModified());//对时
				}
				else    //if the file is a file, copy it
				{
					CopyToFile.createNewFile();
					FileInputStream fis = new FileInputStream(f.getCanonicalPath());
					FileOutputStream fos = new FileOutputStream(CopyToFile.getCanonicalPath());
					int num = fis.available();
					if (num <= SIZE) {
						byte by[] = new byte[num];//创建字节数组，大小是输入流可读取大小      

						fis.read(by);//3.输入流读取信息到字节数组     

						fos.write(by);//4.把读到的字节信息写入目标文件            

						fis.close(); //关闭流

						fos.close();

					}
					else{
						int times = num/SIZE + 1;
						for(int j=0; j<times; j++){
							byte by[] = new byte[SIZE];  

							fis.read(by);//3.输入流读取信息到字节数组     

							fos.write(by);//4.把读到的字节信息写入目标文件 
						}
						fis.close(); //关闭流

						fos.close();
					}//else
				}//else
				
				CopyToFile.setLastModified(f.lastModified());//对时
			}
		}catch(IOException e)
		{
			return false;
		}
		
		return true;
	}

  }

