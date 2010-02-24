package icss.abc.search;


import icss.abc.base.db.DBConnection;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RefurbishIndex {

	public static void justDoIt() {

		List<StrStr> ls = RefurbishIndex.refurbish();

		String path = "d:/keywords.txt";
		try {
			FileWriter fw = new FileWriter(new File(path));
			PrintWriter pw = new PrintWriter(fw);
			for (int i = 0; i < ls.size(); i++) {
				pw.println(ls.get(i).getKey() + " " + ls.get(i).getValue());
			}
			pw.flush();
		} catch (IOException e) {

			e.printStackTrace();
		}

		System.out.println("over");

	}

		private static List<StrStr> refurbish() {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			List<StrStr> over = new ArrayList<StrStr>();
			
			try {
				conn = DBConnection.getConnection();
				stmt = conn.createStatement();

				String sql = "Select testuser.abcfile.filename, testuser.abcfile.fileid, testuser.abcfile.filelabel,testuser.filedept.departmentid, testuser.filedept.filepower From testuser.abcfile Join testuser.filedept On testuser.abcfile.fileid = testuser.filedept.fileid Where testuser.abcfile.flag = 1";
				rs = stmt.executeQuery(sql);

				

				while (rs.next()) {
					//得到各种查询结果列的值
					String filename = rs.getString("filename");
					String filelabel = rs.getString("filelabel");
					int deptid = rs.getInt("departmentid");
					int fileid = rs.getInt("fileid");
					int filepower = rs.getInt("filepower");
					
					
					
					int lastsubtraction = filename.lastIndexOf("-");
					String shortname = filename;
					if(lastsubtraction != -1)
						shortname = filename.substring(0, lastsubtraction);

					

					List<String> wordslist = Segment.cutter(shortname);
					List<String> labellist = new ArrayList<String>();
					if(filelabel!=null){
						 labellist = Segment.cutter(filelabel);
					}

					List<WordCounter> resultlist = new ArrayList<WordCounter>();
					// 得到resultlist
					for (int i = 0; i < wordslist.size(); i++) {
						int j = 0;
						for (j = 0; j < resultlist.size(); j++) {
							if ((resultlist.get(j).getWord()).equals(wordslist
									.get(i))) {
								resultlist.get(j).setCounter(
										resultlist.get(j).getCounter() + 1);
								break;
							}

						}
						if (j == resultlist.size())
							resultlist.add(new WordCounter(wordslist.get(i), 1));
					}

					for (int i = 0; i < labellist.size(); i++) {
						int j = 0;
						for (j = 0; j < resultlist.size(); j++) {
							if ((resultlist.get(j).getWord()).equals(labellist
									.get(i))) {
								resultlist.get(j).setCounter(
										resultlist.get(j).getCounter() + 1);
								break;
							}

						}
						if (j == resultlist.size())
							resultlist.add(new WordCounter(labellist.get(i), 1));
					}

					// 对List<StrStr> over的设定
					for (int m = 0; m < resultlist.size(); m++) {
						int n = 0;
						for (n = 0; n < over.size(); n++) {
							if ((resultlist.get(m).getWord()).equals(over.get(n)
									.getKey())) {
								// doSomething
								String record = StringMaker(deptid, filepower, fileid, resultlist.get(m).getCounter());
								
								over.get(n).setValue(over.get(n).getValue()+","+record);
								
								break;
							}
						}
						if (n == over.size()) {
							//dosomething
							String record = StringMaker(deptid, filepower, fileid, resultlist.get(m).getCounter());
						
							over.add(new StrStr(resultlist.get(m).getWord(), record));
						}
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {

				}
			}
			return over;
		}

	private static String StringMaker(int deptid, int filepower, int fileid,
			int filecounter) {

		StringBuilder sb = new StringBuilder("");

		sb.append(deptid);
		sb.append("-");
		sb.append(filepower);
		sb.append("-");
		sb.append(fileid);
		sb.append("-");
		sb.append(filecounter);

		String strRecord = sb.toString();

		return strRecord;
	}
}

class StrStr {

	String key;
	String value;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public StrStr(String key, String value) {
		this.key = key;
		this.value = value;
	}

}

class WordCounter {

	String word;
	int counter;

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public WordCounter(String word, int counter) {
		this.word = word;
		this.counter = counter;
	}

	public WordCounter() {
	}

}