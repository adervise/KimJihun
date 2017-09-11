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
 * @ 2015. 7. 16.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 16.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by All right reserved.
 */
%>
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

            <th scope="col" rowspan="2">수집일시</th>
            <th scope="col" colspan="3">카테고리</th>
            <th scope="col" rowspan="2">건수</th>
        </tr>
        <tr>
            <th scope="col" class="b_left">대분류</th>
            <th scope="col">중분류</th>
            <th scope="col">소분류</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="searchResult" items="${searchResult}" varStatus="status">
        <tr>
            <td><c:out value="${searchResult.colctDt}"/></td>
            <td><c:out value="${searchResult.lclasNm}"/></td>
            <td><c:out value="${searchResult.mlsfcNm}"/></td>
            <td><c:out value="${searchResult.sclasNm}"/></td>
            <td><c:out value="${searchResult.rsct}"/></td>
         </tr>
         </c:forEach>
    </tbody>
</table>

<div class="paging_wrap">
	<!-- paging -->
    <div id="paging" class="paging">
        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_search"/>
    </div>
	<!-- // paging -->
	<p class="btn"><span id="excelBtn" class="btn_pack blue"><a href="#" class="letter">Excel</a></span></p>
</div>
