/**
 * @ClassName    : BdService.java
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
 *    Copyright (C) by  All right reserved.
 */
package ***.bd.service;

import java.util.List;
import java.util.Map;

import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ***.bd.service.vo.BdDefaultVO;
import ***.bd.service.vo.BdPopVO;

public interface BdService {

    /**
     * 글 목록을 조회한다.
     * @param BdDefaultVO - 조회할 정보가 담긴 VO
     * @return 통계항목 목록
     * @exception Exception
     */

    //통계리스트 받아오기
    List<?> selectBdList (BdDefaultVO bVO) throws Exception;

    //도메인카테고리관리기 리스트
    List<?> selectBdListLeft () throws Exception;

    //통계리스트 쿼리로 받아오기
    List<?> selectBdList (String queryId, BdDefaultVO bVO) throws Exception;
    List<?> selectPopBdList (String queryId, BdPopVO bpVO) throws Exception;

    //통계리스트 카운트 받아오기
    int selectBdTotCnt(String queryID, BdDefaultVO bVO) throws Exception;

    //BdDefaultVO로 정의된 인터페이스, egovMap resultClass가 spring form을 사용못하기에 아래 서비스 생성
    BdDefaultVO selectView(String queryID, BdDefaultVO bVO) throws Exception;

    // 글을 등록한다.
    void insertView(String queryID, BdDefaultVO bVO) throws Exception;
    void insertPop(String queryID, BdPopVO bpVO) throws Exception;

    // 글을 수정한다.
    void updateView(String queryID, BdDefaultVO bVO) throws Exception;
    void updatePop(String queryID, BdPopVO bpVO) throws Exception;

    // 글을 삭제한다.
    void deleteView(BdDefaultVO bVO) throws Exception;

    //오더링 최대값 구하기
    int selectMaxOrdr(String queryID, String Lclas) throws Exception;

}
