package com.chinasofti.base.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *  
 * <p>Title: PageHelper 界面翻页的实现类.</p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 */


public class PageHelper {
	private ResultSet rs = null;
	private int 	currentPage; 	// 当前页
    private int 	nextPage; 		// 下一页
    private int 	priviousPage; 	// 前一页
    private int 	pageCount; 		// 共有页数，页总数
    private int 	recordCount; 	// 记录的总条数
    private int 	pageSize = 10; 	// 每页显示记录数
 
    private String 	condition = ""; //条件

    private List 	objList;
    private String 	pageBar = "";

   
	    /**
	     * @return the currentPage
	     */
	    public int getCurrentPage() {
	        return currentPage;
	    }

	    /**
	     * @param currentPage
	     *            the currentPage to set
	     */
	    public void setCurrentPage(int currentpage) {
	        this.currentPage = currentpage;
	    }

	    /**
	     * @return the nextPage
	     */
	    public int getNextPage() {
	        if (pageCount > currentPage) {
	            nextPage = currentPage + 1;
	        } else {
	            nextPage = currentPage;
	        }
	        return nextPage;
	    }

	    /**
	     * @param nextPage
	     *            the nextPage to set
	     */
	    public void setNextPage(int nextpage) {
	        this.nextPage = nextpage;
	    }

	    /**
	     * 返回总页数
	     */
	    public int getPageCount() {
	        if (recordCount == 0)
	            return 0;
	        if (pageSize == 0)
	            return 1;   	
	    	
	        if (recordCount % pageSize == 0) {
	            pageCount = recordCount / pageSize;
	        } else {
	            pageCount = recordCount / pageSize + 1;
	        }

	        return pageCount;
	    }
	    /**
	     * 返回当前页的记录条数
	     */	    
	    public int getPageRowsCount() {
	        if (pageSize == 0)
	            return recordCount;
	        if (recordCount == 0)
	            return 0;
	        if (currentPage != pageCount)
	            return pageSize;
	        
	        return recordCount - (pageCount - 1) * pageSize;
	    }
	    /**
	     * 转到指定页
	     */
	    public void gotoPage(int page) {
	        if (rs == null)
	            return;
	        if (page < 1)
	            page = 1;
	        if (page > getPageCount())
	            page = getPageCount();
	        int row = (page - 1) * pageSize;
	        try {
	            if( row==0){
	                rs.beforeFirst();
	            }else{
	                rs.absolute(row);
	            }
	            currentPage = page;
	        } catch (SQLException e) {
	            e.printStackTrace(); // TODO:
	        }
	    }	    
	    /**
	     * @param pageCount
	     *            the pageCount to set
	     */
	    public void setPageCount(int pagecount) {
	        this.pageCount = pagecount;
	    }

	    /**
	     * 返回分页大小
	     * @return the pageSize
	     */
	    public int getPageSize() {
	        return pageSize;
	    }

	    /**
	     * @param pageSize
	     *            the pageSize to set
	     */
	    public void setPageSize(int pagesize) {
	        this.pageSize = pagesize;
	    }
	    /**
	     * 转到当前页的第一条记录
	     * 
	     * @exception java.sql.SQLException
	     *                异常说明。
	     */	    
	    public void pageFirst() throws SQLException {
	        int row = (currentPage - 1) * pageSize + 1;
	        rs.absolute(row);
	    }
	    /**
	     * 转到当前页的最后一条记录
	     * 
	     * @exception java.sql.SQLException
	     *                异常说明。
	     */	 	    
	    public void pageLast() throws SQLException {
	        int row = (currentPage - 1) * pageSize + getPageRowsCount();
	        rs.absolute(row);
	    }

	    
	    /**
	     * @return the priviousPage
	     */
	    public int getPriviousPage() {
	        if (currentPage > 1) {
	            priviousPage = currentPage - 1;
	        } else {
	            priviousPage = currentPage;
	        }
	        return priviousPage;
	    }

	    /**
	     * @param priviousPage
	     *            the priviousPage to set
	     */
	    public void setPriviousPage(int priviouspage) {
	        this.priviousPage = priviouspage;
	    }

	    /**
	     * @return the recordCount
	     */
	    public int getRecordCount() {
	        return recordCount;
	    }

	    /**
	     * @param recordCount
	     *            the recordCount to set
	     */
	    public void setRecordCount(int recordcount) {
	        this.recordCount = recordcount;
	    }

	    /**
	     * @return the objList
	     */
	    public List getObjList() {
	        return objList;
	    }

	    /**
	     * @param objList
	     *            the objList to set
	     */
	    public void setObjList(List objlist) {
	        this.objList = objlist;
	    }

	    /**
	     * @return the pageBar
	     */
	    public String getPagebar() {
	        return pageBar;
	    }

	    /**
	     * @param pageBar
	     *            the pageBar to set
	     */
	    public void setPagebar(String url) {
	        String strResult = "";
	        if (currentPage <= 1) {//如果list表中记录数可以在一页中显示，则上一页，首页无链接

	          strResult = strResult + "首页 上一页 ";
	        }
	        else {//如果结果集中记录数超出一页，则有链接，可以分页显示
	          strResult = "<a href='javascript:changepage(1)'><font color='red'>首页</font></a> ";
	          strResult += "<a href='javascript:changepage("+(currentPage - 1)+")'><font color='red'>上一页</font><a>";
	        }
	        if (currentPage >= pageCount) {//如果当前页是显示的最后一页，则下一页，尾页无链接
	          strResult += "下一页 尾页";
	        }
	        else {//否则，只要记录不是最后一页都有链接实现点击分页 
	          strResult += "<a href='javascript:changepage(" +(currentPage + 1) + ")'><font color='red'>下一页</font><a> ";
	          strResult += "<a href='javascript:changepage(" + pageCount + ")'><font color='red'>尾页</font><a> ";
	        }
	        strResult = strResult + "第<font color='red'>" + currentPage + "</font>页（共<font color='red'>" + recordCount +
	            "</font>条记录，分<font color='red'>" + pageCount + "</font>页显示，每页至多<font color='red'>" + pageSize + "</font>条记录）";
	       if(pageCount>1){
	           this.pageBar = strResult;
	       }else if(recordCount == 0){
	           this.pageBar = "没有符合查询条件的信息";
	       }
	    }

		public ResultSet getRs() {
			return rs;
		}

		public void setRs(ResultSet rs) {
			this.rs = rs;
		}

		public String getCondition() {
			return condition;
		}

		public void setCondition(String condition) {
			this.condition = condition;
		}
	}

