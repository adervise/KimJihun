<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%
 /**
 * @ClassName    : file_name
 * @Description  :
 * @ModificationInformation
 * @
 * @  수정일               수정자            수정내용
 * @ ----------    ---------   -------------------------------
 * @ 2015. 7. 6.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 6.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by All right reserved.
 */
%>

                    <div class="board_list">
                       <table cellpadding="0" cellspacing="0" border="0" summary="" class="category_sort reset_input">
                        <caption>리스트</caption>
                        <colgroup>
                            <col width="10%" />
                            <col width="*" />
                            <col width="*" />
                            <col width="*" />
                            <col width="20%" />
                        </colgroup>
                        <thead>
                            <tr>

                                <th scope="col" rowspan="2">No</th>
                                <th scope="col" colspan="3">자동분류</th>
                                <th scope="col" rowspan="2">소분류 건수</th>
                            </tr>
                            <tr>
                                <th scope="col" class="b_left">대분류</th>
                                <th scope="col">중분류</th>
                                <th scope="col">-</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rsList" items="${rsList}" varStatus="status">
					        <tr>
					            <td><c:out value="${rsList.rowNum}"/></td>
					            <td><c:out value="${rsList.lclasNm}"/></td>
					            <td><c:out value="${rsList.mlsfcNm}"/></td>
					            <td>-</td>
					            <td><c:out value="${rsList.cnt}"/></td>
					         </tr>
					         </c:forEach>
                        </tbody>
                       </table>
                        <div class="paging_wrap">
                            <!-- paging -->
                            <div id="paging" class="paging">
                                <!-- <a class="prevEnd" href="#"><img src="../../../images/bd/btn/btn_prevEnd.gif" alt="처음"></a> -->
                                <!-- <a class="prev" href="#"><img src="../../../images/bd/btn/btn_prev.gif" alt="이전"></a> -->
                                <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_search"  />
                                <!-- <a class="next" href="#"><img src="../../../images/bd/btn/btn_next.gif" alt="다음"></a> -->
                                <!-- <a class="nextEnd" href="#"><img src="../../../images/bd/btn/btn_nextEnd.gif" alt="끝"></a>  -->
                            </div>
                            <!-- // paging -->
                            <p class="btn"><span id="excelBtn" class="btn_pack blue"><a href="#" class="letter">Excel</a></span></p>
                        </div>





                    </div>
                    <!-- // board_list -->
