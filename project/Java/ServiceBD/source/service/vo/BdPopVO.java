/**  
 * @ClassName    : BdPopVO.java
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 7. 29.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 29.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by Onnara All right reserved.
 */
package ***.bd.service.vo;

public class BdPopVO {

    private int snId;
    private String ctgryId ;
    private String ctgryNm ;
    private int ctgryOrdr ;
    private String ctgryDc ;
    /** 레벨 **/
    private int searchLevel ;

    /** 카테고리_대분류 */
    private String ctgryLclas ;

    /** 카테고리_중분류 */
    private String ctgryMlsfc ;

    /** 카테고리_소분류 */
    private String ctgrySclas ;

    /** 체크 **/
    private String rowStats;
    private String useYn;
    private int lclasOrdr;
    private int mlsfcOrdr;
    private int sclasOrdr;

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
     * @return the ctgryId
     */
    public String getCtgryId() {
        return ctgryId;
    }
    /**
     * @param ctgryId the ctgryId to set
     */
    public void setCtgryId(String ctgryId) {
        this.ctgryId = ctgryId;
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
     * @return the ctgryOrdr
     */
    public int getCtgryOrdr() {
        return ctgryOrdr;
    }
    /**
     * @param ctgryOrdr the ctgryOrdr to set
     */
    public void setCtgryOrdr(int ctgryOrdr) {
        this.ctgryOrdr = ctgryOrdr;
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
     * @return the searchLevel
     */
    public int getSearchLevel() {
        return searchLevel;
    }
    /**
     * @param searchLevel the searchLevel to set
     */
    public void setSearchLevel(int searchLevel) {
        this.searchLevel = searchLevel;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the rowStats
     */
    public String getRowStats() {
        return rowStats;
    }
    /**
     * @param rowStats the rowStats to set
     */
    public void setRowStats(String rowStats) {
        this.rowStats = rowStats;
    }
    /**
     * @return the lclasOrdr
     */
    public Integer getLclasOrdr() {

        if(lclasOrdr == 0){
            return null;
        }else{
            return new Integer(lclasOrdr);
        }

    }
    /**
     * @return the mlsfcOrdr
     */
    public Integer getMlsfcOrdr() {

        if(mlsfcOrdr == 0){
            return null;
        }else{
            return new Integer(mlsfcOrdr);
        }
    }
    /**
     * @param lclasOrdr the lclasOrdr to set
     */
    public void setLclasOrdr(int lclasOrdr) {
        this.lclasOrdr = new Integer(lclasOrdr);
    }
    /**
     * @param mlsfcOrdr the mlsfcOrdr to set
     */
    public void setMlsfcOrdr(int mlsfcOrdr) {
        this.mlsfcOrdr = new Integer(mlsfcOrdr);
    }
    /**
     * @return the sclasOrdr
     */
    public Integer getSclasOrdr() {

        if(sclasOrdr == 0){
            return null;
        }else{
            return new Integer(sclasOrdr);
        }
    }
    /**
     * @param sclasOrdr the sclasOrdr to set
     */
    public void setSclasOrdr(int sclasOrdr) {
        this.sclasOrdr = new Integer(sclasOrdr);
    }
}
