/**
 * @ClassName    : BdServiceImpl.java
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 7. 2.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 2.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by  All right reserved.
 */
package ***.bd.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ***.bd.service.BdService;
import ***.bd.service.impl.dao.BdDAO;
import ***.bd.service.vo.BdDefaultVO;
import ***.bd.service.vo.BdPopVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Service("bdService")
public class BdServiceImpl extends EgovAbstractServiceImpl implements BdService {

    private static final Logger LOGGER = LoggerFactory.getLogger(BdServiceImpl.class);
    //@Autowired 클래스 이름을 가지고 참조한다.
    @Resource(name = "bdDAO")
    private BdDAO bdDAO;

    /** ID Generation */
    @Resource(name = "egovIdGnrService")
    private EgovIdGnrService egovIdGnrService;

    public List<?> selectBdList(BdDefaultVO bVO) throws Exception {
        List<?> list = bdDAO.selectBdList(bVO);
        return list;
    }

    public List<?> selectBdListLeft() throws Exception {
        List<?> list = bdDAO.selectBdListLeft();
        return list;
    }

    public List<?> selectBdList(String queryId, BdDefaultVO bVO) throws Exception {
        List<?> list = bdDAO.selectBdList(queryId, bVO);
        return list;
    }

    //팝업관련
    @Override
    public List<?> selectPopBdList(String queryId, BdPopVO bpVO) throws Exception {
        // TODO Auto-generated method stub
        List<?> list = bdDAO.selectPopBdList(queryId, bpVO);
        return list;
    }


    @Override
    public int selectBdTotCnt(String queryID, BdDefaultVO bVO) throws Exception {
        // TODO Auto-generated method stub
        int totCnt = (Integer)bdDAO.selectBdTotCnt(queryID, bVO);
        return totCnt;
    }

    @Override
    public BdDefaultVO selectView(String queryID, BdDefaultVO bVO) throws Exception {
        // TODO Auto-generated method stub
        return bdDAO.selectView(queryID, bVO);
    }

    @Override
    public void insertView(String queryID, BdDefaultVO bVO) throws Exception {
        // TODO Auto-generated method stub
        bdDAO.insertView(queryID, bVO);
    }

    @Override
    public void updateView(String queryID, BdDefaultVO bVO) throws Exception {
        bdDAO.updateView(queryID, bVO);
    }

    @Override
    public void deleteView(BdDefaultVO bVO) throws Exception {
        bdDAO.deleteView(bVO);
    }

    /* (non-Javadoc)
     * @see ***.bd.service.BdService#insertPop(java.lang.String, ***.bd.service.vo.BdPopVO)
     */
    @Override
    public void insertPop(String queryID, BdPopVO bpVO) throws Exception {
        // TODO Auto-generated method stub
        bdDAO.insertPop(queryID, bpVO);
    }

    /* (non-Javadoc)
     * @see ***.bd.service.BdService#updatePop(java.lang.String, ***.bd.service.vo.BdPopVO)
     */
    @Override
    public void updatePop(String queryID, BdPopVO bpVO) throws Exception {
        // TODO Auto-generated method stub
        bdDAO.updatePop(queryID, bpVO);
    }

    /* (non-Javadoc)
     * @see ***.bd.service.BdService#selectMaxOrdr(java.lang.String, ***.bd.service.vo.BdPopVO)
     */
    @Override
    public int selectMaxOrdr(String queryID, String Lclas) throws Exception {
        // TODO Auto-generated method stub
        int maxOrdr = (Integer)bdDAO.selectMaxOrdr(queryID, Lclas);
        return maxOrdr;
    }
}
