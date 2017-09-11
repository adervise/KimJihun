/**
 * @ClassName    : BdDAO.java
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 7. 1.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 1.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by  All right reserved.
 */
package ***.bd.service.impl.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ***.bd.service.vo.BdDefaultVO;
import ***.bd.service.vo.BdPopVO;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("bdDAO")
public class BdDAO extends EgovAbstractDAO{

    public List<?> selectBdList(BdDefaultVO bVO) throws Exception {
        return list("bdDAO.selectBdList", bVO);
    }

    // 자동분류통계 & 자동분류모니터링 전체리스트 가져오기
    public List<?> selectBdListLeft() throws Exception {
        return list("bdDAO.selectBdListLeft");
    }

    // 메인수집통계화면 전체리스트 가져오기
    public List<?> selectBdList(String queryId, Object bVO) throws Exception {
        return list(queryId, bVO);
    }

    public List<?> selectPopBdList(String queryId, BdPopVO bpVO) throws Exception {
        return list(queryId, bpVO);
    }

    //페이징 처리를 위한 전체 건수 카운트
    public int selectBdTotCnt(String queryId, BdDefaultVO bVO) throws Exception {
        return (Integer) select(queryId, bVO);
    }

    //소분류 카테고리를 조회한다. 콤보박스, spring form 사용을 위해 리턴타입을 BdDefaultVO로 사용
    public BdDefaultVO selectView(String queryId, BdDefaultVO bVO) throws Exception{
        BdDefaultVO  bdDefaultVO = (BdDefaultVO)select(queryId, bVO);
        return bdDefaultVO;
    }

    // 소분류 카테고리를 등록한다.
    public void insertView(String queryID, BdDefaultVO bVO) throws Exception {
        insert(queryID, bVO);
    }

    public void insertPop(String queryID, BdPopVO bpVO) throws Exception {
        insert(queryID, bpVO);
    }


    // 소분류 카테고리를 수정한다.
    public void updateView(String queryID, BdDefaultVO bVO) throws Exception {
        update(queryID, bVO);
    }

    public void updatePop(String queryID, BdPopVO bpVO) throws Exception {
        update(queryID, bpVO);
    }

    // 소분류 카테고리를 삭제한다.
    public void deleteView(BdDefaultVO bVO) throws Exception {
        delete("deleteView", bVO);
    }

    //분류값 Max를 구한다.
    public int selectMaxOrdr(String queryId, String Lclas) throws Exception {
        return (Integer) select(queryId, Lclas);
    }

}
