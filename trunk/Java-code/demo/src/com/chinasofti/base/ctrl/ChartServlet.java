package com.chinasofti.base.ctrl;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.*;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.plot.*;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.renderer.xy.StandardXYItemRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYDataset;
import org.jfree.ui.RectangleInsets;
import org.jfree.util.Rotation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.log4j.*;

public abstract class ChartServlet extends ServletBase {
	protected final static Logger log =  Logger.getLogger(ChartServlet.class);
    private String title = "";
 
    //Initialize global variables
    private String xaxislabel = "";
    private String yaxislabel = "";
    private String charttype = "bar";
    private String chartstyle = "1";
    private int width = 600;
    private int height = 400;
    private String format = "";
    private List dataList = null;
    private XYDataset xyDataset = null;

    protected void setTitle(String value) {
        if (value != null)
            this.title = value;
    }

    protected void setXaxislabel(String value) {
        if (value != null)
            this.xaxislabel = value;
    }

    protected void setYaxislabel(String value) {
        if (value != null)
            this.yaxislabel = value;
    }

    protected void setCharttype(String value) {
        if (value != null)
            this.charttype = value;
    }

    protected void setChartstyle(String value) {
        if (value != null)
            this.chartstyle = value;
    }

    protected void setWidth(int value) {
        this.width = value;
    }

    protected void setHeight(int value) {
        this.height = value;
    }

    protected void setFormat(String value) {
        this.format = value;
    }

    protected void setDataList(List value) {
        this.dataList = value;
    }

    protected void setXYDataList(XYDataset value) {
        this.xyDataset = value;
    }

    protected void createChart(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException {
        width = 600;
        height = 400;
        JFreeChart chart;
        response.setContentType("image/jpeg");
        if (log.isDebugEnabled()) log.debug("begin to create chart");
        if (dataList == null && xyDataset == null) {
            log.warn("没有数据，怎么画图？不画了！！！！！！！！！！！！！！！！！！！！！！！");
            return;
        }
        if (charttype.equals("pie")) {
            DefaultPieDataset data;
            data = getPiedata(dataList);
            if (chartstyle.equals("0")) {
                chart = ChartFactory.createPieChart(title,// chart title
                        data,// data
                        true,// include legend
                        true, false);
                PiePlot plot = (PiePlot) chart.getPlot();
//        plot.setSectionLabelType(PiePlot.NAME_AND_PERCENT_LABELS);
                plot.setForegroundAlpha(0.5f);
                plot.setNoDataMessage("没有任何可以的显示数据");
            } else {
                chart = ChartFactory.createPieChart3D(title, data, true, true, false);
                PiePlot3D plot = (PiePlot3D) chart.getPlot();
//        plot.setSectionLabelType(PiePlot.NAME_AND_PERCENT_LABELS);
                plot.setStartAngle(270);
                plot.setDirection(Rotation.CLOCKWISE);
                plot.setForegroundAlpha(0.5f);
                plot.setNoDataMessage("没有任何可以的显示数据");
            }
            // set the background color for the chart...
            chart.setBackgroundPaint(Color.white);
            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 100, chart,
                    width, height, null);
        } else if (charttype.equals("bar")) {
            CategoryDataset data;
            data = getbardata(dataList);
            if (chartstyle.equals("0")) {
                chart = ChartFactory.createBarChart(title, // chart title
                        xaxislabel, // domain axis label
                        yaxislabel, // range axis label
                        data, // data
                        PlotOrientation.VERTICAL, true, // include legend
                        true, // tooltips?
                        false // URLs?
                );
            } else {
                chart = ChartFactory.createBarChart3D(title, // chart title
                        xaxislabel, // domain axis label
                        yaxislabel, // range axis label
                        data, // data
                        PlotOrientation.VERTICAL, true, // include legend
                        true, // tooltips?
                        false // URLs?
                );
            }
            // get a reference to the plot for further customisation...
            CategoryPlot plot = chart.getCategoryPlot();
            chart.setBackgroundPaint(Color.white);
            // set the range axis to display integers only...
            NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
            rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
            // disable bar outlines...
            BarRenderer renderer = (BarRenderer) plot.getRenderer();
            renderer.setDrawBarOutline(false);
            renderer.setItemLabelsVisible(true);
            plot.setNoDataMessage("没有任何可以的显示数据");
            width = ((data.getRowCount() - 1) / 12 + 1) * width;
            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 100, chart,
                    width, height, null);
        } else if (charttype.equals("line")) {
            CategoryDataset data;
            data = getbardata(dataList);
            // create the chart...
            chart = ChartFactory.createLineChart(title, // chart title
                    xaxislabel, // domain axis label
                    yaxislabel, // range axis label
                    data, // data
                    PlotOrientation.VERTICAL, // orientation
                    true, // include legend
                    true, // tooltips
                    false // urls
            );

//      modify by panggzh 2005-10-31
//      StandardLegend legend = (StandardLegend) chart.getLegend();
//      legend.setDisplaySeriesShapes(true);
//      legend.setDisplaySeriesLines(true);


            CategoryPlot plot = chart.getCategoryPlot();
            chart.setBackgroundPaint(Color.white);
            LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();

//            modify by panggzh 2005-10-31
//        renderer.setDrawShapes(true);
            renderer.setShapesVisible(true);

            renderer.setItemLabelsVisible(true);
            renderer.setPositiveItemLabelPosition(new ItemLabelPosition());
            renderer.setNegativeItemLabelPosition(new ItemLabelPosition());
            CategoryAxis axis = plot.getDomainAxis();
            axis.setCategoryLabelPositions(CategoryLabelPositions
                    .createUpRotationLabelPositions(Math.PI / 6.0));
            width = ((data.getColumnCount() - 1) / 10 + 1) * width;
            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 100, chart,
                    width, height, null);
        } else if (charttype.equals("timeseries")) {
            StandardXYItemRenderer renderer1 = new StandardXYItemRenderer(
                    StandardXYItemRenderer.SHAPES_AND_LINES);
            DateAxis domainAxis = new DateAxis(xaxislabel);
            domainAxis.setVerticalTickLabels(false);
            if (format == "MINUTE") {
                domainAxis.setTickUnit(new DateTickUnit(DateTickUnit.MINUTE, 1));
                domainAxis.setDateFormatOverride(new SimpleDateFormat("HH:mm"));
            } else if (format == "HOUR") {
                domainAxis.setTickUnit(new DateTickUnit(DateTickUnit.HOUR, 1));
                domainAxis.setDateFormatOverride(new SimpleDateFormat("dd hh"));
            } else if (format == "DAY") {
                domainAxis.setTickUnit(new DateTickUnit(DateTickUnit.DAY, 1));
                domainAxis.setDateFormatOverride(new SimpleDateFormat("MM-dd"));
            } else if (format == "MONTH") {
				domainAxis.setTickUnit(new DateTickUnit(DateTickUnit.MONTH, 1));
				domainAxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM"));
			}
            domainAxis.setLowerMargin(0.01);
            domainAxis.setUpperMargin(0.01);
            
            ValueAxis rangeAxis = new NumberAxis(yaxislabel);
            XYPlot plot = new XYPlot(xyDataset, domainAxis, rangeAxis, renderer1);
			plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));
			plot.setDomainCrosshairVisible(true);
			plot.setRangeCrosshairVisible(true);

            chart = new JFreeChart(title, plot);

//      modify by panggzh 2005-10-31
//      StandardLegend legend = (StandardLegend) chart.getLegend();
//      legend.setDisplaySeriesShapes(false);

            chart.setBackgroundPaint(Color.white);
            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 100, chart,
                    width, height, null);
        } else if (charttype.equals("xyLine")) {
            if (log.isDebugEnabled()) log.debug("Enter into xyLine");
            chart = ChartFactory.createXYLineChart(title, // chart title
                    xaxislabel, // domain axis label
                    yaxislabel, // range axis label
                    xyDataset, PlotOrientation.VERTICAL, true, true, false);
            // NOW DO SOME OPTIONAL CUSTOMISATION OF THE CHART...
            chart.setBackgroundPaint(Color.white);

//      modify by panggzh 2005-10-31
//      StandardLegend legend = (StandardLegend) chart.getLegend();
//      legend.setDisplaySeriesShapes(true);

            // get a reference to the plot for further customisation...
            XYPlot plot = chart.getXYPlot();
            plot.setBackgroundPaint(Color.white);

//      modify by panggzh 2005-10-31
//      plot.setAxisOffset(new Spacer(Spacer.ABSOLUTE, 5.0, 5.0, 5.0, 5.0));
            plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));

            plot.setDomainGridlinePaint(Color.gray);
            plot.setRangeGridlinePaint(Color.gray);
            plot.setNoDataMessage("没有任何可以的显示数据");
            StandardXYItemRenderer renderer = (StandardXYItemRenderer) plot
                    .getRenderer();
            renderer.setPlotShapes(true);
            renderer.setShapesFilled(true);
            // change the auto tick unit selection to integer units only...
            NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
            rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
            // OPTIONAL CUSTOMISATION COMPLETED.
            ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 100, chart,
                    width, height, null);
        }
    }

    //获取饼图的指标值
    public DefaultPieDataset getPiedata(List datalist) {
        double dd_data = 0;
        DefaultPieDataset data = new DefaultPieDataset();
        for (int i = 0; i < datalist.size(); i++) {
            ChartData chartdata = (ChartData) datalist.get(i);
            data.setValue(chartdata.getXKey(), chartdata.getData());
        }
        return data;
    }

    //获取条形图的指标值
    public DefaultCategoryDataset getbardata(List datalist) {
        double dd_data = 0;
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        for (int i = 0; i < datalist.size(); i++) {
            ChartData chartdata = (ChartData) datalist.get(i);
            if (chartdata.getDimension() == 1)
                data.addValue(chartdata.getData(), chartdata.getXKey(), chartdata
                        .getXKey());
            if (chartdata.getDimension() == 2)
                data.addValue(chartdata.getData(), chartdata.getXKey(), chartdata
                        .getYKey());
        }
        return data;
    }

    //Clean up resources
    public void destroy() {
    }
}
