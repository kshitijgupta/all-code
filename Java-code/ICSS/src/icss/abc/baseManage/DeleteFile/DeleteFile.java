package icss.abc.baseManage.DeleteFile;

import java.io.File;

public class DeleteFile {
	public void deleteFile(String url){
		System.out.println(url);
		File deFile = new File(url);
		deFile.delete();
	}

}
