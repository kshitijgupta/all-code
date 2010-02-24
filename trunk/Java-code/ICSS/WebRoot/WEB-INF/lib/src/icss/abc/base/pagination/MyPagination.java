package icss.abc.base.pagination;

public class MyPagination {
	
	private int currentPage=0;//��ǰҳ
	private int pageSize=10;//ÿҳ��ʾ��Ŀ��
	private int pageCount;//��ҳ��
	private int rowCount;//����Ŀ
	
	private String pageBar;//������
	
	
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
        if (currentPage <= 1) {//���list���м�¼��������һҳ����ʾ������һҳ����ҳ������

          strResult = strResult + "��ҳ ��һҳ ";
        }
        else {//���������м�¼������һҳ���������ӣ����Է�ҳ��ʾ
          strResult = "<a href='javascript:changepage(1)'><font color='blue'>��ҳ</font></a> ";
          strResult += "<a href='javascript:changepage("+(currentPage - 1)+")'><font color='blue'>��һҳ</font><a>";
        }
        if (currentPage >= pageCount) {//�����ǰҳ����ʾ�����һҳ������һҳ��βҳ������
          strResult += "��һҳ βҳ";
        }
        else {//����ֻҪ��¼�������һҳ��������ʵ�ֵ����ҳ 
          strResult += "<a href='javascript:changepage(" +(currentPage + 1) + ")'><font color='blue'>��һҳ</font><a> ";
          strResult += "<a href='javascript:changepage(" + pageCount + ")'><font color='blue'>βҳ</font><a> ";
        }
        strResult = strResult + "��<font color='blue'>" + currentPage + "</font>ҳ����<font color='blue'>" + rowCount +
            "</font>����¼����<font color='blue'>" + pageCount + "</font>ҳ��ʾ��ÿҳ����<font color='blue'>" + pageSize + "</font>����¼��";
       if(pageCount>1){
           this.pageBar = strResult;
       }else if(rowCount == 0){
           this.pageBar = "û�з��ϲ�ѯ��������Ϣ";
       }
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	
	
}
