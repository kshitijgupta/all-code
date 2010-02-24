package com.chinasofti.meeting.room.ctrl;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import org.apache.poi.hssf.usermodel.*;

import com.chinasofti.base.ctrl.ServletBase;
import com.chinasofti.base.db.PageHelper;

import com.chinasofti.meeting.room.dao.MeetingRoomDAO;
import com.chinasofti.meeting.room.dao.MeetingRoomDAOImpl;
import com.chinasofti.meeting.room.vo.MeetingRoomVO;
import com.lowagie.text.Cell;
import com.lowagie.text.Chapter;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Font;

import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Section;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class MeetingRoomServlet extends ServletBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8603417066236228017L;
	protected static Logger  logger = Logger.getLogger(MeetingRoomServlet.class);
	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException {
		  	String redirect	= "/room/meetingroom_list.jsp";
		  	String errurl	= "/error/error.jsp";
			String way 		= request.getParameter("way");
			boolean result 	= true;
			
		  try {
			  if(way.equals("downexcel")){
				  result = downloadExcel(request,response); 
				  return;
			  }
			  if(way.equals("downpdf")){
				  result = downloadPdf(request,response); 
				  return;
			  }	
			  if(way.equals("check")){
				  checkSameName(request,response);
				  return;
			  }			  

			  if(way.equals("modify")){
				  result   = modify(request,response);
				  redirect = "/room/meetingroom_modify.jsp";
				  
			  }else if(way.equals("list")){
				  result = list(request,response,way); 
			  }else {	  
				  if(way.equals("add")){
					  result = add(request,response);
				  }else if(way.equals("delete")){
					  result = delete(request,response);
				  }else if(way.equals("batchdel")){
					  result = batchDel(request,response);
				  }else if(way.equals("update")){
					  result = update(request,response);
				  }
				  
				  if(result)  list(request,response,way);  
				  else		  redirect = errurl;
			  }	  
			  
			  forward(request, response, redirect);	  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.toString());
			e.printStackTrace();
		}		
	}
	
	/**
	 * 增加会议
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */
	protected boolean add(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
		String mrName 		= request.getParameter("mrName");
		String mrAddress 	= request.getParameter("mrAddress");
		String mrCount		= request.getParameter("mrCount");
		String mrDesc	 	= request.getParameter("mrDesc");	
		
		if(!checkAddValid(mrName,mrAddress,mrCount)){
			request.setAttribute("CustomErr", "非法调用链接!");
			return false;
		}	
		
		MeetingRoomVO vo = new MeetingRoomVO();
		vo.setMrName(mrName);
		vo.setMrAddress(mrAddress);
		vo.setMrCount(Integer.parseInt(mrCount));
		vo.setMrDesc(mrDesc);
		MeetingRoomDAO dao = new MeetingRoomDAOImpl();
		
		boolean result = dao.insert(vo);
		
		return result;
	}

	/**
	 * 删除会议
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */	
	protected boolean delete(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
		String mrId = request.getParameter("currentMrId");
		MeetingRoomDAO dao 		= new MeetingRoomDAOImpl();
		dao.delete(Integer.parseInt(mrId));
		return true;
	}
	/**
	 * 批量会议
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */		
	protected boolean batchDel(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
		String mrIds = request.getParameter("mrIds");
		//String[] mrId = request.getParameterValues("mrId");
		logger.debug("mrIds:" + mrIds);
	    MeetingRoomDAO dao 		= new MeetingRoomDAOImpl();
	    dao.batchdel(mrIds);
		return true;
	}

	/**
	 * 会议列表
	 * @param way ：query调用时从前台得到条件、页行数，当前页，其它：没有条件，当前页为1；
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */		
	protected boolean list(HttpServletRequest request, HttpServletResponse response,String way)
    throws Exception, ServletException, IOException {
		PageHelper pageHelper 	= null;
        MeetingRoomDAO dao 		= new MeetingRoomDAOImpl();
    		
        String condition = "" ;
        int pageSize	 = 10 ;
        int currentPage  = 1  ;
        
		if(way.equals("list")){
			String strConditon	= request.getParameter("condition");
			String strPageSize 	= request.getParameter("pageSize");
			String strCurPage 	= request.getParameter("currentPage");
			
			if(strConditon != null)	condition 	= strConditon;
			if(strPageSize != null) pageSize 	= Integer.parseInt(strPageSize);
			if(strCurPage != null) 	currentPage = Integer.parseInt(strCurPage);
		}
		
		pageHelper 	= dao.getList(condition,pageSize,currentPage);
		

		pageHelper.setCondition(condition);
		
        request.setAttribute("pageHelper", pageHelper);
        return true;		
	}
	
	/**
	 * 修改列表
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */		
	protected boolean modify(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
		String mrId = request.getParameter("currentMrId");
		MeetingRoomDAO dao 	= new MeetingRoomDAOImpl();
		MeetingRoomVO  vo   = dao.findByPrimary(Integer.parseInt(mrId));
		request.setAttribute("MeetingRoomVO", vo);
		return true;
	}

	/**
	 * 下载excel
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */		
	protected boolean downloadExcel(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
	    MeetingRoomDAO dao 		= new MeetingRoomDAOImpl();
	    PageHelper pageHelper 	= dao.findByAll();
	    
		HSSFWorkbook 	workbook   	= new HSSFWorkbook();
		HSSFSheet 		sheet 	   	= workbook.createSheet();

		HSSFCellStyle   mainstyle  	= workbook.createCellStyle();			
		HSSFCellStyle   titlestyle 	= workbook.createCellStyle();
		HSSFCellStyle   cellstyle 	= workbook.createCellStyle();

					
		HSSFFont 		mainfont   	= workbook.createFont();	
		HSSFFont 		titlefont   = workbook.createFont();		
		HSSFFont 		cellfont   	= workbook.createFont();	
		
		mainfont.setFontHeightInPoints((short) 12);
		mainfont.setFontName("隶书");		
		titlefont.setFontHeightInPoints((short) 12);
		titlefont.setFontName("华文新魏");
		cellfont.setFontHeightInPoints((short) 9);	
		cellfont.setFontName("宋体");

		workbook.setSheetName(0, "会议室信息",HSSFWorkbook.ENCODING_UTF_16);

		mainstyle.setFont(mainfont);
		
		titlestyle.setFont(titlefont);
		titlestyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		titlestyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		titlestyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		titlestyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		
		cellstyle.setFont(cellfont);			
		cellstyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cellstyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cellstyle.setBorderRight(HSSFCellStyle.BORDER_THIN);			
		cellstyle.setWrapText(true);
		cellstyle.setFont(cellfont);
		mainstyle.setFont(mainfont);

		HSSFRow row	  = null;
		HSSFCell cell = null;
		
		List recordList = pageHelper.getObjList();
		
		int rownum   = 3 + recordList.size();
		int cellnum  = 3;
		
		
		logger.info("begin to init excel" );	
		for (short i = 0; i < rownum; i++){
			row = sheet.createRow(i);
			
			for (short j = 0; j < cellnum ; j++){
				cell = row.createCell(j);
				
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				if(i == 2) cell.setCellStyle(titlestyle);
				if( i > 2) cell.setCellStyle(cellstyle);
				sheet.setColumnWidth(j,(short)(3000*2));	
			}
		}

		logger.info("begin to init excel title");
		cell = sheet.getRow(0).getCell((short)(cellnum/2));
		cell.setCellValue( "会议室情况查询");
		cell.setCellStyle(mainstyle);

		cell = sheet.getRow(1).getCell((short)(cellnum/2-1));
		cell.setCellValue("" );
		String script ="制表时间:" + DateFormat.getDateInstance().format( new Date()) ;

		cell = sheet.getRow(1).getCell((short)(cellnum-3));
		cell.setCellValue(script);	

		logger.info("begin to init excel first layer");			
		row = sheet.getRow(2);	
		row.getCell((short)0).setCellValue("会议室名称");
		row.getCell((short)1).setCellValue("可容纳的人数");			
		row.getCell((short)2).setCellValue("地址");
		
		for(int k=0; k< recordList.size();k++){
			MeetingRoomVO vo = (MeetingRoomVO)recordList.get(k);
			row = sheet.getRow(3+k);
			row.getCell((short)0).setCellValue(vo.getMrName());
			row.getCell((short)1).setCellValue(vo.getMrCount());
			row.getCell((short)2).setCellValue(vo.getMrAddress());
		}
		logger.info("begin to write data to  excel");	

		javax.servlet.ServletOutputStream servletoutputstream = response.getOutputStream();
		
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-disposition","attachment; filename=" + new String(("会议室信息.xls").getBytes("gb2312"),"iso8859-1"));			
		response.setDateHeader("Expires", 0);
		response.setContentType("application/vnd.ms-excel;charset=GBK");

		workbook.write(servletoutputstream);
		servletoutputstream.flush();


		return true;
	}

	/**
	 * 下载excel
	 * @param request
	 * @param response
	 * @throws Exception
	 * @throws ServletException
	 * @throws IOException
	 */		
	protected boolean downloadPdf(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
	    MeetingRoomDAO dao 		= new MeetingRoomDAOImpl();
	    PageHelper pageHelper 	= dao.findByAll();
	    List recordList 		= pageHelper.getObjList();
	    
	    logger.info("begin to create a  pdf");	
	    Document document = new Document();
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    PdfWriter.getInstance(document, baos);
	    document.open();
	    
	    BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED); 
	    Font cnFont8 = new Font(bfChinese, 8, Font.NORMAL); 

	    document.add(new Paragraph("总体信息分析",new Font(bfChinese, 24, Font.NORMAL) ));
	    /*
         * 创建章节对象
         */ 
	    
	    Paragraph title1  =   new  Paragraph( "会议室信息分析" ,new Font(bfChinese, 18, Font.NORMAL) );
	    Chapter chapter1  =   new  Chapter(title1,  1 );
        chapter1.setNumberDepth(0);
	    /*
         * 创建图片对象
         */ 
		String realPath  = this.getServletContext().getRealPath("") ;
		String imagePath = realPath + File.separator + "images" + File.separator + "icss.jpg";

		// 读取一个图片
		Image jpeg = Image.getInstance(imagePath);
		
		// 插入一个图片
	    document.add(jpeg);

	    /*
         * 创建小节对象
         */ 
        Paragraph title11  =   new  Paragraph( "会议详细信息" ,new Font(bfChinese, 14, Font.NORMAL));
        Section section1  =  chapter1.addSection(title11);

        Paragraph describe  =   new  Paragraph( "会议详细信息如下：",new Font(bfChinese, 12, Font.NORMAL) );
        section1.add(describe);
  
	    /*
         * 创建表格对象
         */      
        Table table  =   new  Table( recordList.size()+1 ,  3 );
        //table.setBorderColor( new  Color( 220,255,100 ));
        table.setPadding( 0 );
        table.setSpacing( 0 );
        table.setBorderWidth( 1 );

        //Cell c1  =   new  Cell( "会议室名称 " );
        //t.addCell(c1); //使用此方法不能显示汉字，改为phrase可以显示,但Chunk更好一些
 
//        table.addCell(new Phrase("会议室名称",cnFont8));
//        table.addCell(new Phrase("可容纳的人数",cnFont8));
//        table.addCell(new Phrase("地址",cnFont8));
        Cell cell= new Cell();
        cell.add(new Chunk("会议室名称",cnFont8));
        cell.setHorizontalAlignment(1);
        table.addCell(cell);
        cell= new Cell();
        cell.add(new Chunk("可容纳的人数",cnFont8));
        cell.setHorizontalAlignment(1);
        table.addCell(cell);
        cell= new Cell();
        cell.add(new Chunk("地址",cnFont8));
        cell.setHorizontalAlignment(1);
        table.addCell(cell);        

        
		for(int k=0; k< recordList.size();k++){
			MeetingRoomVO vo = (MeetingRoomVO)recordList.get(k);

			table.addCell(new Phrase(vo.getMrName(),cnFont8));
			table.addCell(new Phrase(vo.getMrCount().toString(),cnFont8));
			table.addCell(new Phrase(vo.getMrAddress(),cnFont8));
		}

        section1.add(table);
        
        
        document.add(chapter1);
        document.close();

		logger.info("begin to write data to  pdf");	

		javax.servlet.ServletOutputStream servletoutputstream = response.getOutputStream();
		

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-disposition","attachment; filename=" + new String(("会议室信息.pdf").getBytes("gb2312"),"iso8859-1"));			
		response.setDateHeader("Expires", 0);
	    response.setContentType("application/pdf");
	    response.setContentLength(baos.size());
	    
	    baos.writeTo(servletoutputstream);
	    servletoutputstream.flush();

		return true;
	}	
	
	private boolean checkAddValid(String mr_name,String mr_address,String mr_count){
		logger.debug("mr_name:" + mr_name + " mr_address:" + mr_address + " mr_count:" + mr_count);
		if(mr_name==null || mr_name.equals("")) return false;
		if(mr_address==null || mr_address.equals("")) return false;
		if(mr_count==null || mr_count.equals("")) return false;	

		return true;
	}

	@Override
	protected boolean update(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		String mrId 		= request.getParameter("mrId");
		String mrName 		= request.getParameter("mrName");
		String mrAddress 	= request.getParameter("mrAddress");
		String mrCount		= request.getParameter("mrCount");
		String mrDesc	 	= request.getParameter("mrDesc");	
		
		if(mrId==null || mrId.equals("")){
			request.setAttribute("CustomErr", "非法调用链接!");
			return false;			
		}
		if(!checkAddValid(mrName,mrAddress,mrCount)){
			request.setAttribute("CustomErr", "非法调用链接!");
			return false;
		}	
		
		MeetingRoomVO vo = new MeetingRoomVO();
		vo.setMrId(Integer.parseInt(mrId));
		vo.setMrName(mrName);
		vo.setMrAddress(mrAddress);
		vo.setMrCount(Integer.parseInt(mrCount));
		vo.setMrDesc(mrDesc);
		MeetingRoomDAO dao = new MeetingRoomDAOImpl();
		
		boolean result = dao.update(vo);
		
		return result;

	}

	private void checkSameName(HttpServletRequest request, HttpServletResponse response)
    throws Exception, ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		String mrName = request.getParameter("mrName");
		mrName = new String(mrName.getBytes("GBK"),"UTF-8");
		logger.debug("enter into check name,mrName:" +  mrName);

        try {
        	MeetingRoomDAO dao = new MeetingRoomDAOImpl();
        	boolean	 result = dao.checkExist(mrName); 
			response.setContentType("text/xml");
			java.io.PrintWriter out = response.getWriter();
			out.println(result);
        } catch (Exception e) {
            ServletException ex = new ServletException(e.getMessage());
        
            throw ex;
        }

    }
}
