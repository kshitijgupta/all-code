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
		                //ѭ��ɾ��Ŀ¼�µ���Ŀ¼
		                for (int i = 0; i < arrFiles.length; i++)
		                {
		                	deleteFullFiles(arrFiles[i].getAbsolutePath());
		                }
		                arrFiles = null;
		                //��Ŀ¼�µ�����ɾ����, �ٰѱ�Ŀ¼ɾ��
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


