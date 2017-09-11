/**
 * @ClassName    : serviceController.java
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 7. 1.   김지훈            최초생성
 *
 * @author  김지훈
 * @since   2015. 7. 1.
 * @version 1.0
 *
 */
package ***.bd.web;

import java.util.List;
import javax.annotation.Resource;

import ***.bd.cmm.BizlogRecordDAO;
import ***.bd.service.BdService;
import ***.bd.service.vo.BdDefaultVO;
import ***.bd.service.vo.BdPopVO;
import ***.bd.service.vo.ListBdPopVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BdController {

    @Resource(name="bdService")
    private BdService bdService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
    protected DefaultBeanValidator beanValidator;


    @Autowired
    private BizlogRecordDAO bizlogRecordDAO;
    //private BizlogRecordDAO bizlogRecordDAO;

    /**
     * 글 목록을 조회한다. (paging)
     * @param searchVO - 조회할 정보가 담긴 BdDefaultVO
     * @param model
     * @return "egovSampleList"
     * @exception Exception
     */
    @RequestMapping(value = "/bdCtgryList.do")
    public String selectBdList (BdDefaultVO bVO, ModelMap model) throws Exception{

        //전체 리스트 카운트
        int totCnt = 0;

        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        String totCntQueryId = "selectBdTotCnt";

        /** EgovPropertyService.sample */
        bVO.setPageUnit(propertiesService.getInt("pageUnit"));
        bVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(bVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
        paginationInfo.setPageSize(bVO.getPageSize());

        bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        bVO.setLastIndex(paginationInfo.getLastRecordIndex());
        bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        totCnt = bdService.selectBdTotCnt(totCntQueryId, bVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        /** SearchLevel setting */
        if("".equals(bVO.getSearchLevel()) || bVO.getSearchLevel() == null){
            bVO.setSearchLevel("99");
        }

        List<?> selectSearchList = bdService.selectBdList("selectSearchList", bVO);
        model.addAttribute("selectSearchList", selectSearchList);

        List<?> bdListLeft = bdService.selectBdListLeft();
        model.addAttribute("resultListLeft", bdListLeft);

        //Bizlog
        bizlogRecordDAO.insertBizLog("MA","ST00", "ST00", "bdDAO.selectBdListLeft");

        return "main";
    }

    /**
     * 콤보박스 데이터를 조회한다. (paging)
     * @param searchVO - 조회할 정보가 담긴 BdDefaultVO
     * @param model
     * @param bdListLeft
     * @return "egovSampleList"
     * @exception Exception
     */
    @RequestMapping(value = "/bdComboList.do")
    @ResponseBody
    protected Object selectBdComboList(@ModelAttribute("bVO") BdDefaultVO bVO) throws Exception{

        List <?> bdComboList = null;
        try {

            bdComboList = bdService.selectBdList("selectBdComboList", bVO);

        } catch (Exception e) {
            e.getMessage();
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return bdComboList;
    }

    /**
     * 콤보박스 검색조건을 넘겨받아서 다시 조회한다. (paging)
     * @param searchVO - 조회할 정보가 담긴 BdDefaultVO
     * @param model
     * @param bdListLeft
     * @return "egovSampleList"
     * @exception Exception
     */
    @RequestMapping(value="/searchList.do")
    //@ResponseBody
    protected Object selectSearchList(@ModelAttribute("bVO") BdDefaultVO bVO, ModelMap model) {

        //전체 리스트 카운트
        int totCnt = 0;
        //통계 데이터를 받아 온다.
        List <?> searchList = null;
        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        String totCntQueryId = "selectSearchBdTotCnt";

        /** EgovPropertyService.sample */
        bVO.setPageUnit(propertiesService.getInt("pageUnit"));
        bVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(bVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
        paginationInfo.setPageSize(bVO.getPageSize());

        bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        bVO.setLastIndex(paginationInfo.getLastRecordIndex());
        bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        bVO.setStartDt(bVO.getStartDt().replaceAll("-", ""));
        bVO.setEndDt(bVO.getEndDt().replaceAll("-", ""));

        try {
            searchList = bdService.selectBdList("selectSearchList", bVO);
            totCnt = bdService.selectBdTotCnt(totCntQueryId, bVO);

        } catch (Exception e) {
            e.getMessage();
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("searchResult", searchList);
        model.addAttribute("paginationInfo", paginationInfo);
        return "mainSearchList";
    }

    @RequestMapping(value="/rsList.do")
    protected String selectRsList(@ModelAttribute("bVO") BdDefaultVO bVO, ModelMap model) throws Exception {

        //전체 리스트 카운트
        int totCnt = 0;
        //통계 데이터를 받아 온다.
        List <?> rsList = null;
        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        String totCntQueryId = "rsSearchTotCnt";

        /** EgovPropertyService.sample */
        bVO.setPageUnit(propertiesService.getInt("pageUnit"));
        bVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(bVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
        paginationInfo.setPageSize(bVO.getPageSize());

        bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        bVO.setLastIndex(paginationInfo.getLastRecordIndex());
        bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        /** SearchLevel setting */
        if("".equals(bVO.getSearchLevel()) || bVO.getSearchLevel() == null){
            bVO.setSearchLevel("0");
        }

        try {
            rsList = bdService.selectBdList("rsList", bVO);
            totCnt = bdService.selectBdTotCnt(totCntQueryId, bVO);

        } catch (Exception e) {
            e.getMessage();
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("rsList", rsList);
        model.addAttribute("paginationInfo", paginationInfo);
        return "mainRsList";
    }

    @RequestMapping(value="/rsSearchList.do")
    protected String selectRsSearchList(@ModelAttribute("bVO") BdDefaultVO bVO, ModelMap model) throws Exception {

      //전체 리스트 카운트
        int totCnt = 0;
        //통계 데이터를 받아 온다.
        List <?> rsList = null;
        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        String totCntQueryId = "rsSearchTotCnt";

        /** EgovPropertyService.sample */
        bVO.setPageUnit(propertiesService.getInt("pageUnit"));
        bVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(bVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
        paginationInfo.setPageSize(bVO.getPageSize());

        bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        bVO.setLastIndex(paginationInfo.getLastRecordIndex());
        bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        try {
            rsList = bdService.selectBdList("rsList", bVO);
            totCnt = bdService.selectBdTotCnt(totCntQueryId, bVO);

        } catch (Exception e) {
            e.getMessage();
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("rsList", rsList);
        model.addAttribute("paginationInfo", paginationInfo);
        return "mainRsSearchList";
    }




    //Left 클릭시 조회컨트롤러
    @RequestMapping(value="/register.do")
    protected String selectView(@ModelAttribute("bVO") BdDefaultVO bVO, ModelMap model) throws Exception{

        BdDefaultVO result = bdService.selectView("selectView", bVO);

        BdDefaultVO comboVO1 = new BdDefaultVO();
        BdDefaultVO comboVO2 = new BdDefaultVO();


        comboVO1.setStatsLvl(1);
        //comboVO1.setCTGRY_LCLAS(result.getCTGRY_LCLAS());
        comboVO2.setStatsLvl(2);
        comboVO2.setCtgryLclas(result.getCtgryLclas());
        //comboVO2.setCTGRY_MLSFC(result.getCTGRY_MLSFC());

        Object comboList1 = selectBdComboList(comboVO1); // 대분류 list
        Object comboList2 = selectBdComboList(comboVO2); // 소분류 list

        model.addAttribute("combo1",comboList1);
        model.addAttribute("combo2",comboList2);
        model.addAttribute("selectView",result);

        return "category_register";
    }

    //등록화면 조회 컨트롤러
    @RequestMapping(value="/viewNew.do")
    protected String selectViewClear(@ModelAttribute("bVO") BdDefaultVO bVO, ModelMap model) throws Exception{

        BdDefaultVO comboVO1 = new BdDefaultVO();
        comboVO1.setStatsLvl(1);

        Object comboList1 = selectBdComboList(comboVO1); // 대분류 list
        model.addAttribute("combo1",comboList1);
        model.addAttribute("selectView",new BdDefaultVO());

        return "category_register";
    }

    //등록화면 입력 컨트롤러
    @RequestMapping(value="/viewInsert.do", method = RequestMethod.POST)
    protected String insertView(@ModelAttribute("selectView") BdDefaultVO bVO, ModelMap model, BindingResult bindingResult) throws Exception{


        // Server-Side Validation
        /* beanValidator.validate(bVO, bindingResult);
           if (bindingResult.hasErrors()) {
               model.addAttribute("selectView", bVO);
               return "category_register";
           }    */

        bdService.insertView("insertView", bVO);
        int snId = bdService.selectBdTotCnt("selectLastInsert", bVO);
        bVO.setSnId(snId);
        bdService.insertView("insertDetailView", bVO);

        return "redirect:/bdCtgryList.do";
    }

    //등록화면 수정 컨트롤러
    @RequestMapping(value="/viewUpdate.do")
    protected String updateView(@ModelAttribute("bVO") BdDefaultVO bVO) throws Exception{

        bdService.updateView("updateMaster", bVO);
        bdService.updateView("updateDetail", bVO);
        return "redirect:/bdCtgryList.do";
    }

    //등록화면 삭제 컨트롤러
    @RequestMapping(value="/viewDelete.do")
    protected String deleteView(@ModelAttribute("bVO") BdDefaultVO bVO) throws Exception{

        bdService.updateView("deleteView", bVO);
        return "redirect:/bdCtgryList.do";
    }

    //팝업 화면 출력
    @RequestMapping(value="/categoryPop.do")
    protected String categoryPopView(){
        return "categoryPop";
    }


    @RequestMapping(value="/searchPopList.do")
    protected String selectSearchPopList(@ModelAttribute("bpVO") BdPopVO bpVO, ModelMap model) throws Exception {

        //통계 데이터를 받아 온다.
        List <?> searchPopList = null;

        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        searchPopList = bdService.selectPopBdList("selectPopSearchList", bpVO);

        model.addAttribute("searchPopResult", searchPopList);
        return "categoryPopList";
    }

    @RequestMapping(value="/popViewInsert.do", method = RequestMethod.POST)
    private String popInsertView(@ModelAttribute("bpVO") ListBdPopVO listBpVO, ModelMap model) throws Exception{

        //@ModelAttribute("bpVO") BdPopVO bpVO,
        String[] flag = listBpVO.getRegisterFlag();

        BdPopVO bpVO;

        for(int i=0; i < flag.length; i++){
               bpVO = new BdPopVO();

               bpVO.setSnId(listBpVO.getSnId()[i]);
               bpVO.setCtgryNm(listBpVO.getCtgryNm()[i]);
               bpVO.setUseYn(listBpVO.getUseYn()[i]);
               bpVO.setCtgryDc(listBpVO.getCtgryDc()[i]);

               if("insert".equals(flag[i])){

                   if(listBpVO.getSearchLevel()[i] == 0){  // 대분류 입력시

                       bpVO.setCtgryLclas(listBpVO.getCtgryId()[i]);
                       bpVO.setCtgryMlsfc("");
                       bpVO.setCtgrySclas("");
                       /*bpVO.setLclasOrdr(listBpVO.getCtgryOrdr()[i]);*/
                       bpVO.setLclasOrdr(listBpVO.getCtgryOrdr()[i]);
                       bpVO.setMlsfcOrdr(0);
                       bpVO.setSclasOrdr(0);
                   }else if(listBpVO.getSearchLevel()[i] == 1){       // 중분류 입력시

                       bpVO.setCtgryLclas(listBpVO.getCtgryLclas()[i]);
                       bpVO.setCtgryMlsfc(listBpVO.getCtgryId()[i]);
                       bpVO.setCtgrySclas("");
                       bpVO.setLclasOrdr(bdService.selectMaxOrdr("selectMaxOrdr", listBpVO.getCtgryLclas()[i]));
                       bpVO.setMlsfcOrdr(listBpVO.getCtgryOrdr()[i]);
                       bpVO.setSclasOrdr(0);

                   }
                   bdService.insertPop("insertPop", bpVO);

               } else if("update".equals(flag[i])) {

                   if(listBpVO.getSearchLevel()[i] == 0){
                       bpVO.setLclasOrdr(listBpVO.getCtgryOrdr()[i]);

                   }else if(listBpVO.getSearchLevel()[i] == 1){
                       bpVO.setLclasOrdr(bdService.selectMaxOrdr("selectMaxOrdr", listBpVO.getCtgryLclas()[i]));
                       bpVO.setMlsfcOrdr(listBpVO.getCtgryOrdr()[i]);
                   }else if(listBpVO.getSearchLevel()[i] == 2){
                       bpVO.setLclasOrdr(bdService.selectMaxOrdr("selectMaxOrdr", listBpVO.getCtgryLclas()[i]));
                       bpVO.setMlsfcOrdr(listBpVO.getCtgryOrdr()[i]);
                   }
                   bdService.updatePop("updatePop", bpVO);
                   } else {
                       new Exception();
                   }
               }

        return "categoryPopList";
    }

    @RequestMapping("/exceldown.do")
	public String excelDownload(BdDefaultVO bVO, Model model){

		//전체 리스트 카운트
        int totCnt = 0;

        //통계 데이터를 받아 온다.
        List <?> searchList = null;

        //쿼리 ID : 메뉴 코드를 가지고 조회 하여 셋팅
        String totCntQueryId = "selectSearchBdTotCnt";

        /** EgovPropertyService.sample */
        bVO.setPageUnit(propertiesService.getInt("pageUnit"));
        bVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(bVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(bVO.getPageUnit());
        paginationInfo.setPageSize(bVO.getPageSize());

        bVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        bVO.setLastIndex(paginationInfo.getLastRecordIndex());
        bVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());


        bVO.setStartDt(bVO.getStartDt().replaceAll("-", ""));
        bVO.setEndDt(bVO.getEndDt().replaceAll("-", ""));

        try {
            searchList = bdService.selectBdList("selectSearchList", bVO);
            totCnt = bdService.selectBdTotCnt(totCntQueryId, bVO);

        } catch (Exception e) {
            e.getMessage();
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("searchList", searchList);

		return "excelDownload";
	}
}
