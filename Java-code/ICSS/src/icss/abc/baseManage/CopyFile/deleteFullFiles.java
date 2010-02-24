package icss.abc.baseManage.CopyFile;
import java.io.File;
import java.io.IOException;
public class deleteFullFiles {

		public boolean deleteFullFiles(String sDirFilePath) throws IOException
		{
		    if (sDirFilePath != null && !sDirFilePath.trim().equals(""))
		    {
		        File tDirFile = new File(sDirFilePath);
		        if (tDirFile.exists())
		        {
		            if (tDirFile.isDirectory())
		            {
		                File[] arrFiles = tDirFile.listFiles();
		                //循环删除目录下的子目录
		                for (int i = 0; i < arrFiles.length; i++)
		                {
		                	deleteFullFiles(arrFiles[i].getAbsolutePath());
		                }
		                arrFiles = null;
		                //当目录下的所有删除后, 再把本目录删除
		                tDirFile.delete();
		            }
		            else
		            {
		                tDirFile.delete();
		            }
		        }
		        tDirFile = null;
		    }
		    return true;
		}
	}


