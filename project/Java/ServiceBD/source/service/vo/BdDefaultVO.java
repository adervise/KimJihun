/**  
 * @ClassName    : BdDefaultVO.java
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 6. 30.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 6. 30.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by Onnara All right reserved.
 */
package ***.bd.service.vo;

import java.util.Date;

public class BdDefaultVO{

    /** 코드 테이블 교유키 **/
    private int snId;

    /** 세부정보 테이블 교유키 **/
    private int detailsnId;

    /** 수집 일시 */
    private String colctDt = "";

    /** 카테고리_대분류 */
    private String ctgryCd  = "";

    /** 카테고리_대분류 */
    private String ctgryLclas  = "";

    /** 카테고리_중분류 */
    private String ctgryMlsfc  = "";

    /** 카테고리_소분류 */
    private String ctgrySclas  = "";

    /** 카테고리_이름 */
    private String ctgryNm  = "";

    /** 카테고리_건수 */
    private int rsct ;

    /** 카테고리_등록날짜 */
    private Date inputDt;


    private String ctgryFrstInputDt;



    /** 검색 조건 시작 날짜 */
    private String startDt;

    /** 검색 조건 마지막 날짜 */
    private String endDt;

    /** 검색 레벨 설정*/
    private String searchLevel;

    /** 카테고리 설명*/
    private String ctgryDc;



    /** 데이터 수집 타입*/
    private String colctTyp;

    /** 데이터 저장 타입*/
    private String ldadngLc;

    /** 데이터 저장 경로*/
    private String ldadngTy;

    /** 레벨 **/
    private int statsLvl;

    private int rowNum;




    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /**
     * @return the colctTyp
     */
    public String getColctTyp() {
        return colctTyp;
    }
    /**
     * @param colctTyp the colctTyp to set
     */
    public void setColctTyp(String colctTyp) {
        this.colctTyp = colctTyp;
    }
    /**
     * @return the ldadngLc
     */
    public String getLdadngLc() {
        return ldadngLc;
    }
    /**
     * @param ldadngLc the ldadngLc to set
     */
    public void setLdadngLc(String ldadngLc) {
        this.ldadngLc = ldadngLc;
    }
    /**
     * @return the ldadngTy
     */
    public String getLdadngTy() {
        return ldadngTy;
    }
    /**
     * @param ldadngTy the ldadngTy to set
     */
    public void setLdadngTy(String ldadngTy) {
        this.ldadngTy = ldadngTy;
    }
    /**
     * @return the detailsnId
     */
    public int getDetailsnId() {
        return detailsnId;
    }
    /**
     * @param detailsnId the detailsnId to set
     */
    public void setDetailsnId(int detailsnId) {
        this.detailsnId = detailsnId;
    }
    /**
     * @return the statsLvl
     */
    public int getStatsLvl() {
        return statsLvl;
    }
    /**
     * @param statsLvl the statsLvl to set
     */
    public void setStatsLvl(int statsLvl) {
        this.statsLvl = statsLvl;
    }
    /**
     * @return the colctDt
     */
    public String getColctDt() {
        return colctDt;
    }
    /**
     * @param colctDt the colctDt to set
     */
    public void setColctDt(String colctDt) {
        this.colctDt = colctDt;
    }
    /**
     * @return the ctgryCd
     */
    public String getCtgryCd() {
        return ctgryCd;
    }
    /**
     * @param ctgryCd the ctgryCd to set
     */
    public void setCtgryCd(String ctgryCd) {
        this.ctgryCd = ctgryCd;
    }
    /**
     * @return the ctgryLclas
     */
    public String getCtgryLclas() {
        return ctgryLclas;
    }
    /**
     * @param ctgryLclas the ctgryLclas to set
     */
    public void setCtgryLclas(String ctgryLclas) {
        this.ctgryLclas = ctgryLclas;
    }
    /**
     * @return the ctgryMlsfc
     */
    public String getCtgryMlsfc() {
        return ctgryMlsfc;
    }
    /**
     * @param ctgryMlsfc the ctgryMlsfc to set
     */
    public void setCtgryMlsfc(String ctgryMlsfc) {
        this.ctgryMlsfc = ctgryMlsfc;
    }
    /**
     * @return the ctgrySclas
     */
    public String getCtgrySclas() {
        return ctgrySclas;
    }
    /**
     * @param ctgrySclas the ctgrySclas to set
     */
    public void setCtgrySclas(String ctgrySclas) {
        this.ctgrySclas = ctgrySclas;
    }
    /**
     * @return the ctgryNm
     */
    public String getCtgryNm() {
        return ctgryNm;
    }
    /**
     * @param ctgryNm the ctgryNm to set
     */
    public void setCtgryNm(String ctgryNm) {
        this.ctgryNm = ctgryNm;
    }
    /**
     * @return the rsct
     */
    public int getRsct() {
        return rsct;
    }
    /**
     * @param rsct the rsct to set
     */
    public void setRsct(int rsct) {
        this.rsct = rsct;
    }
    /**
     * @return the inputDt
     */
    public Date getInputDt() {
        return inputDt;
    }
    /**
     * @param inputDt the inputDt to set
     */
    public void setInputDt(Date inputDt) {
        this.inputDt = inputDt;
    }
    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the searchLevel
     */
    public String getSearchLevel() {
        return searchLevel;
    }

    /**
     * @param searchLevel the searchLevel to set
     */
    public void setSearchLevel(String searchLevel) {
        this.searchLevel = searchLevel;
    }

    /**
     * @return the ctgryDc
     */
    public String getCtgryDc() {
        return ctgryDc;
    }

    /**
     * @param ctgryDc the ctgryDc to set
     */
    public void setCtgryDc(String ctgryDc) {
        this.ctgryDc = ctgryDc;
    }

    /**
     * @return the pageIndex
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * @param pageIndex the pageIndex to set
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * @return the pageUnit
     */
    public int getPageUnit() {
        return pageUnit;
    }

    /**
     * @param pageUnit the pageUnit to set
     */
    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    /**
     * @return the pageSize
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * @param pageSize the pageSize to set
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * @return the firstIndex
     */
    public int getFirstIndex() {
        return firstIndex;
    }

    /**
     * @param firstIndex the firstIndex to set
     */
    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    /**
     * @return the lastIndex
     */
    public int getLastIndex() {
        return lastIndex;
    }

    /**
     * @param lastIndex the lastIndex to set
     */
    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    /**
     * @return the recordCountPerPage
     */
    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    /**
     * @param recordCountPerPage the recordCountPerPage to set
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * @return the snId
     */
    public int getSnId() {
        return snId;
    }

    /**
     * @param snId the snId to set
     */
    public void setSnId(int snId) {
        this.snId = snId;
    }

    /**
     * @return the ctgryFrstInputDt
     */
    public String getCtgryFrstInputDt() {
        return ctgryFrstInputDt;
    }
    /**
     * @param ctgryFrstInputDt the ctgryFrstInputDt to set
     */
    public void setCtgryFrstInputDt(String ctgryFrstInputDt) {
        this.ctgryFrstInputDt = ctgryFrstInputDt;
    }
    /**
     * @return the rowNum
     */
    public int getRowNum() {
        return rowNum;
    }
    /**
     * @param rowNum the rowNum to set
     */
    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }
}
