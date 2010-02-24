package icss.abc.search.ctrl;

import icss.abc.search.RefurbishIndex;

public class MakeIndexAction {
	public String execute(){
		
		RefurbishIndex.justDoIt();
		
		return "success";
	}
}
