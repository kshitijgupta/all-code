package icss.abc.search;

import java.io.Serializable;

public class MyMap implements Comparable<MyMap> ,Serializable{
	int myfileid;
	int mycounter;
	
	
	public MyMap(){
		
	}
	public MyMap(int myfileid, int mycounter) {
		
		this.myfileid = myfileid;
		this.mycounter = mycounter;
	}
	public int getMyfileid() {
		return myfileid;
	}
	public void setMyfileid(int myfileid) {
		this.myfileid = myfileid;
	}
	public int getMycounter() {
		return mycounter;
	}
	public void setMycounter(int mycounter) {
		this.mycounter = mycounter;
	}
	
	
	@Override
	public int compareTo(MyMap mm) {
		// TODO Auto-generated method stub
	
		
		if(this.mycounter<mm.getMycounter())
			return 1;
		else if(this.mycounter == mm.getMycounter())
			return 0;
		else if(this.mycounter>mm.getMycounter())
			return -1;
		
		return 0;
	}
	
	
}
