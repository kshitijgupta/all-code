package icss.abc.base.pagination;

public class MyPagination {
	
	private int currentPage=0;//当前页
	private int pageSize=10;//每页显示条目数
	private int pageCount;//总页数
	private int rowCount;//总条目
	
	private String pageBar;//工具条
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		if (rowCount == 0)
            return 0;
        if (pageSize == 0)
            return 1;   	
    	
        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        return pageCount;
		
		
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getPageBar() {
		return pageBar;
	}
	public void setPageBar(String pageBar) {
		String strResult = "";
        if (currentPage <= 1) {//如果list表中记录数可以在一页中显示，则上一页，首页无链接

          strResult = strResult + "首页 上一页 ";
        }
        else {//如果结果集中记录数超出一页，则有链接，可以分页显示
          strResult = "<a href='javascript:changepage(1)'><font color='blue'>首页</font></a> ";
          strResult += "<a href='javascript:changepage("+(currentPage - 1)+")'><font color='blue'>上一页</font><a>";
        }
        if (currentPage >= pageCount) {//如果当前页是显示的最后一页，则下一页，尾页无链接
          strResult += "下一页 尾页";
        }
        else {//否则，只要记录不是最后一页都有链接实现点击分页 
          strResult += "<a href='javascript:changepage(" +(currentPage + 1) + ")'><font color='blue'>下一页</font><a> ";
          strResult += "<a href='javascript:changepage(" + pageCount + ")'><font color='blue'>尾页</font><a> ";
        }
        strResult = strResult + "第<font color='blue'>" + currentPage + "</font>页（共<font color='blue'>" + rowCount +
            "</font>条记录，分<font color='blue'>" + pageCount + "</font>页显示，每页至多<font color='blue'>" + pageSize + "</font>条记录）";
       if(pageCount>1){
           this.pageBar = strResult;
       }else if(rowCount == 0){
           this.pageBar = "没有符合查询条件的信息";
       }
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	
	
}
