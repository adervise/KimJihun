package ***.bd.web;



import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Component("excelDownload")
public class ExcelDownloadView extends AbstractExcelView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		// TODO Auto-generated method stub
		String userAgent = req.getHeader("User-Agent");
		String fileName = "ONNARA.xls";

		if(userAgent.indexOf("MSIE") > -1){
			fileName = URLEncoder.encode(fileName, "utf-8");
		}else{
			fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
		}

		res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		res.setHeader("Content-Transfer-Encoding", "binary");

		HSSFSheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);
		List<?> list = (List<?>)model.get("searchList");
		EgovMap resultMap;
		for(int i=0; i < list.size(); i++){
			resultMap = (EgovMap)list.get(i);
			createPageRow(sheet, resultMap,i);
		}
	}


	private HSSFSheet createFirstSheet(HSSFWorkbook workbook){
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "카테고리수집통계");
		sheet.setColumnWidth(1, 256*30);
		return sheet;
	}

	private void createColumnLabel(HSSFSheet sheet){

		HSSFRow headRow = sheet.createRow(0);
		HSSFCell headCell = headRow.createCell(0);
		headCell.setCellValue("비지니스로그 수집통계현황");



		HSSFRow firstRow = sheet.createRow(1);

		HSSFCell cell = firstRow.createCell(0);
		cell.setCellValue("순번");

		cell = firstRow.createCell(1);
		cell.setCellValue("수집일시");

		cell = firstRow.createCell(2);
		cell.setCellValue("대분류");

		cell = firstRow.createCell(3);
		cell.setCellValue("중분류");

		cell = firstRow.createCell(4);
		cell.setCellValue("소분류");

		cell = firstRow.createCell(5);
		cell.setCellValue("건수");


	}

	private void createPageRow(HSSFSheet sheet, EgovMap map, int rowNum){
		HSSFRow row = sheet.createRow(rowNum + 2);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue(rowNum + 1);

		cell = row.createCell(1);
		cell.setCellValue((String)map.get("colctDt"));

		cell = row.createCell(2);
		cell.setCellValue((String)map.get("lclasNm"));

		cell = row.createCell(3);
		cell.setCellValue((String)map.get("mlsfcNm"));

		cell = row.createCell(4);
		cell.setCellValue((String)map.get("sclasNm"));

		cell = row.createCell(5);
		cell.setCellValue(((BigDecimal)map.get("rsct")).intValue());
	}
}
