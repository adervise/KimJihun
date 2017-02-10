/**  
 * @ClassName    : ListBdPopVO.java
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


public class ListBdPopVO{

    private int[] snId;
    private int[] ctgryOrdr ;
    private String[] ctgryId ;
    private String[] ctgryNm ;
    private String[] ctgryDc ;
    private String[] registerFlag;
    private String[] useYn;
    private String[] ctgryLclas ;
    private String[] ctgryMlsfc ;
    private int[] searchLevel ;

    /**
     * @return the snId
     */
    public int[] getSnId() {
        return snId;
    }
    /**
     * @return the ctgryId
     */
    public String[] getCtgryId() {
        return ctgryId;
    }
    /**
     * @return the ctgryNm
     */
    public String[] getCtgryNm() {
        return ctgryNm;
    }
    /**
     * @return the ctgryOrdr
     */
    public int[] getCtgryOrdr() {
        return ctgryOrdr;
    }
    /**
     * @return the ctgryDc
     */
    public String[] getCtgryDc() {
        return ctgryDc;
    }
    /**
     * @return the registerFlag
     */
    public String[] getRegisterFlag() {
        return registerFlag;
    }
    /**
     * @return the useYn
     */
    public String[] getUseYn() {
        return useYn;
    }
    /**
     * @param snId the snId to set
     */
    public void setSnId(int[] snId) {
        this.snId = snId;
    }
    /**
     * @param ctgryId the ctgryId to set
     */
    public void setCtgryId(String[] ctgryId) {
        this.ctgryId = ctgryId;
    }
    /**
     * @param ctgryNm the ctgryNm to set
     */
    public void setCtgryNm(String[] ctgryNm) {
        this.ctgryNm = ctgryNm;
    }
    /**
     * @param ctgryOrdr the ctgryOrdr to set
     */
    public void setCtgryOrdr(int[] ctgryOrdr) {
        this.ctgryOrdr = ctgryOrdr;
    }
    /**
     * @param ctgryDc the ctgryDc to set
     */
    public void setCtgryDc(String[] ctgryDc) {
        this.ctgryDc = ctgryDc;
    }
    /**
     * @param registerFlag the registerFlag to set
     */
    public void setRegisterFlag(String[] registerFlag) {
        this.registerFlag = registerFlag;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String[] useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the ctgryLclas
     */
    public String[] getCtgryLclas() {
        return ctgryLclas;
    }
    /**
     * @return the ctgryMlsfc
     */
    public String[] getCtgryMlsfc() {
        return ctgryMlsfc;
    }
    /**
     * @param ctgryLclas the ctgryLclas to set
     */
    public void setCtgryLclas(String[] ctgryLclas) {
        this.ctgryLclas = ctgryLclas;
    }
    /**
     * @param ctgryMlsfc the ctgryMlsfc to set
     */
    public void setCtgryMlsfc(String[] ctgryMlsfc) {
        this.ctgryMlsfc = ctgryMlsfc;
    }
    /**
     * @return the searchLevel
     */
    public int[] getSearchLevel() {
        return searchLevel;
    }
    /**
     * @param searchLevel the searchLevel to set
     */
    public void setSearchLevel(int[] searchLevel) {
        this.searchLevel = searchLevel;
    }
}
