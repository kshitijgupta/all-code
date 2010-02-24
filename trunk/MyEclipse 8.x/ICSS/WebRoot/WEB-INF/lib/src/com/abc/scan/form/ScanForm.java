package com.abc.scan.form;

import icss.abc.base.db.PageHelper;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.constants.Constants;
import com.abc.scan.vo.ScanVO;

public class ScanForm extends ActionForm {
	private static final long serialVersionUID = 5943417421604679224L;
	private String page = null;
	private String outPage = null;
	private Integer mode;
	private Integer out = -1;
	private Integer folderId;
	private String onChange = null;
	
	private int num = 0;
	private int count = 0;
	private String pageBar = null;

	private ScanVO[] smallList = null;
	private ScanVO[] bigList   = null;
	
	private PageHelper helper = new PageHelper();
	
	private int bigMode = Constants.BIGLIST;
	private int smallMode = Constants.SMALLLIST;
	private int screenMode = Constants.SCREENPAGE;
	
	private int userDepartment = -1;
	private int userPower      = 100;
	
	private int update   = Constants.UPDATE;
	private int upload   = Constants.UPLOAD;
	private int download = Constants.DOWNLOAD;
	
	private int empty  = 0;
	
	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public PageHelper getHelper() {
		return helper;
	}

	public void setHelper(PageHelper helper) {
		this.helper = helper;
	}
	
	public boolean setListByType(int size, int num, String type, int power) throws Exception{
		this.bigList   = null;
		this.smallList = null;
		this.pageBar   = null;
		this.num       = 0;
		this.count     = 0;
		
		this.num     = num;
		this.count   = helper.getCountByType(type, power);
		this.pageBar = newPageBar(size);
		
		ScanVO[] vo = null;
		vo = helper.getListByType(size, num, type, power); 
		
		if(size==Constants.SMALLLIST){
			this.smallList = vo;
			return true;
		}else
			if(size==Constants.BIGLIST){
				this.bigList = vo;
				return true;
			}
		return false;
	}
	
	public boolean setListById(int size, int num, int id, int userPower, int department) throws Exception{
		this.bigList   = null;
		this.smallList = null;
		this.pageBar   = null;
		this.num       = 0;
		this.count     = 0;
		
		this.num     = num;
		this.count   = helper.getCountById(id, userPower, department);
		this.pageBar = newPageBar(size);
		
		ScanVO[] vo = null;
		vo = helper.getListById(size, num, id, userPower, department); 
		
		if(size==Constants.SMALLLIST){
			this.smallList = vo;
			return true;
		}else
			if(size==Constants.BIGLIST){
				this.bigList = vo;
				return true;
			}
		return false;
	}
	
	public int isEmpty(int folderId) throws Exception{
		return helper.isEmpty(folderId);
	}
	
	public void setPage(String page) {
        this.page = page;
    }
	
	public String getPage() {
        return this.page;    
    }
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		return null;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		
	}

	public ScanVO[] getSmallList() {
		return smallList;
	}

	public void setSmallList(ScanVO[] smallList) {
		this.smallList = smallList;
	}

	public ScanVO[] getBigList() {
		return bigList;
	}

	public void setBigList(ScanVO[] bigList) {
		this.bigList = bigList;
	}

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	public Integer getFolderId() {
		return folderId;
	}

	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}

	public int getBigMode() {
		return bigMode;
	}

	public void setBigMode(int bigMode) {
		
	}

	public int getSmallMode() {
		return smallMode;
	}

	public void setSmallMode(int smallMode) {
		
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPageBar() {
		return this.pageBar;
	}

	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	
	public String newPageBar(int size){	
		int pageCount = 0;
		
		if(this.count%size == 0){
			pageCount = this.count/size;
		}else{
			pageCount = this.count/size + 1;
		}
		
		if(pageCount <= 1){
			return null;
		}

		return "";
	}

	public int getScreenMode() {
		return screenMode;
	}

	public void setScreenMode(int screenMode) {
		this.screenMode = screenMode;
	}

	public Integer getOut() {
		return out;
	}

	public void setOut(Integer out) {
		this.out = out;
	}

	public String getOutPage() {
		return outPage;
	}

	public void setOutPage(String outPage) {
		this.outPage = outPage;
	}

	public int getUserDepartment() {
		return userDepartment;
	}

	public void setUserDepartment(int userDepartment) {
		this.userDepartment = userDepartment;
	}

	public int getUserPower() {
		return userPower;
	}

	public void setUserPower(int userPower) {
		this.userPower = userPower;
	}

	public int getUpdate() {
		return update;
	}

	public void setUpdate(int update) {
		this.update = update;
	}

	public int getUpload() {
		return upload;
	}

	public void setUpload(int upload) {
		this.upload = upload;
	}

	public int getDownload() {
		return download;
	}

	public void setDownload(int download) {
		this.download = download;
	}

	public int getEmpty() {
		return empty;
	}

	public void setEmpty(int empty) {
		this.empty = empty;
	}
}