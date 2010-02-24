<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="icss.abc.base.db.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@ page
	import="org.jfree.chart.JFreeChart,org.jfree.chart.ChartUtilities,org.jfree.chart.ChartFactory,org.jfree.chart.plot.PlotOrientation,org.jfree.data.category.DefaultCategoryDataset,java.io.*,com.lowagie.text.pdf.*,com.lowagie.text.*,java.awt.Graphics2D,java.awt.geom.Rectangle2D"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>

		<%
			String name = "";
			int numOfShipin = 0;
			int numOfYinpin = 0;
			int numOfQita = 0;
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBConnection.getConnection();

				stmt = conn.createStatement();
				String sql = "select filetype from abcfile";

				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					System.out.println(rs.getString("filetype"));
					if (rs.getString("filetype").equalsIgnoreCase("movie"))
						numOfShipin++;
					if (rs.getString("filetype").equalsIgnoreCase("music"))
						numOfYinpin++;
					if (rs.getString("filetype").equalsIgnoreCase("other"))
						numOfQita++;
				}
			} catch (Exception e) {
				String a = e.toString();
				System.out.println("" + e.toString());
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e2) {

				}
			}

			String dataName[] = new String[] { "视频", "音频", "其他" };//显示数据系列
			int dataValueCount[] = { numOfShipin, numOfYinpin, numOfQita };//数据系列对应的值
			//------创建数据集,并设置值------
			DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
			for (int i = 0; i < dataName.length; i++)
				categoryDataset.addValue(dataValueCount[i], dataName[i],
						dataName[i]);
			String titleString = "文件类型分布统计图";//图的标题
			JFreeChart chart = ChartFactory.createBarChart3D(titleString,
					"文件类型", "数量", categoryDataset, PlotOrientation.VERTICAL,
					true, true, false);
			ChartUtilities.writeChartAsJPEG(response.getOutputStream(), chart,500, 300);
		%>
		<table width="100%" height="123" border="0">
			<tr>
				<td width="663">
					&nbsp;
				</td>
				<td width="350" height="119">
					asdasd
				</td>
			</tr>
		</table>
	</body>
</html>