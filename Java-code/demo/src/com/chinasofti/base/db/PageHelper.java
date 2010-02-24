package com.chinasofti.base.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *  
 * <p>Title: PageHelper ���淭ҳ��ʵ����.</p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 */


public class PageHelper {
	private ResultSet rs = null;
	private int 	currentPage; 	// ��ǰҳ
    private int 	nextPage; 		// ��һҳ
    private int 	priviousPage; 	// ǰһҳ
    private int 	pageCount; 		// ����ҳ����ҳ����
    private int 	recordCount; 	// ��¼��������
    private int 	pageSize = 10; 	// ÿҳ��ʾ��¼��
 
    private String 	condition = ""; //����

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
	     * ������ҳ��
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
	     * ���ص�ǰҳ�ļ�¼����
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
	     * ת��ָ��ҳ
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
	     * ���ط�ҳ��С
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
	     * ת����ǰҳ�ĵ�һ����¼
	     * 
	     * @exception java.sql.SQLException
	     *                �쳣˵����
	     */	    
	    public void pageFirst() throws SQLException {
	        int row = (currentPage - 1) * pageSize + 1;
	        rs.absolute(row);
	    }
	    /**
	     * ת����ǰҳ�����һ����¼
	     * 
	     * @exception java.sql.SQLException
	     *                �쳣˵����
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
	        if (currentPage <= 1) {//���list���м�¼��������һҳ����ʾ������һҳ����ҳ������

	          strResult = strResult + "��ҳ ��һҳ ";
	        }
	        else {//���������м�¼������һҳ���������ӣ����Է�ҳ��ʾ
	          strResult = "<a href='javascript:changepage(1)'><font color='red'>��ҳ</font></a> ";
	          strResult += "<a href='javascript:changepage("+(currentPage - 1)+")'><font color='red'>��һҳ</font><a>";
	        }
	        if (currentPage >= pageCount) {//�����ǰҳ����ʾ�����һҳ������һҳ��βҳ������
	          strResult += "��һҳ βҳ";
	        }
	        else {//����ֻҪ��¼�������һҳ��������ʵ�ֵ����ҳ 
	          strResult += "<a href='javascript:changepage(" +(currentPage + 1) + ")'><font color='red'>��һҳ</font><a> ";
	          strResult += "<a href='javascript:changepage(" + pageCount + ")'><font color='red'>βҳ</font><a> ";
	        }
	        strResult = strResult + "��<font color='red'>" + currentPage + "</font>ҳ����<font color='red'>" + recordCount +
	            "</font>����¼����<font color='red'>" + pageCount + "</font>ҳ��ʾ��ÿҳ����<font color='red'>" + pageSize + "</font>����¼��";
	       if(pageCount>1){
	           this.pageBar = strResult;
	       }else if(recordCount == 0){
	           this.pageBar = "û�з��ϲ�ѯ��������Ϣ";
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

