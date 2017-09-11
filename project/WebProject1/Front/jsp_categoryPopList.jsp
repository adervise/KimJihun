<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
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
 * @since   2015. 7. 16.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by  All right reserved.
 */
%>
<form:form commandName="bpVO" id="popForm" name="popForm" method="post">
<table  cellpadding="0" cellspacing="0" border="0" summary="" id="popListForm">
                <caption>리스트</caption>
                <colgroup>
                    <col width="15%" />
                    <col width="15%" />
                    <col width="10%" />
                    <col width="*" />
                    <col width="10%" />
                    <col width="10%" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">카테고리ID</th>
                    <th scope="col">카테고리명</th>
                    <th scope="col">카테고리순번</th>
                    <th scope="col">설명</th>
                    <th scope="col">사용유무</th>
                    <th scope="col">행삭제</th>
                </tr>
                </thead>
                <tbody id="statNewsTable">
                   <c:forEach var="searchPopResult" items="${searchPopResult}" varStatus="status">
                   <tr class="trItem${status.count}" data-row="${status.index}">
                        <td><form:input path="ctgryId"   id="ctgryId"   name="ctgryId"   style="width:70px;"   value="${searchPopResult.ctgryId}" readonly="${true}" class="required"/></td>
                        <td><form:input path="ctgryNm"   id="ctgryNm"   name="ctgryNm"   style="width:100px;"  value="${searchPopResult.ctgryNm}"/></td>
                        <td><form:input path="ctgryOrdr" id="ctgryOrdr" name="ctgryOrdr" style="width:30px;"   value="${searchPopResult.ctgryOrdr}"/></td>
                        <td><form:input path="ctgryDc"   id="ctgryDc"   name="ctgryDc"   style="width:250px;"  value="${searchPopResult.ctgryDc}"/></td>
                        <td>
                        <c:set var="useYSelected" value="${searchPopResult.useYn == 'Y' ? 'selected' : ''}"/>
                        <c:set var="useNSelected" value="${searchPopResult.useYn == 'N' ? 'selected' : ''}"/>
                           <form:select path="useYn" style="width:50px;">
                                <form:option value="Y" label="Y" selected="${useYSelected}"/>
                                <form:option value="N" label="N" selected="${useNSelected}"/>
                           </form:select>
                        </td>
                        <td>
                           <input type="hidden" name="registerFlag" value="update"/>
                           <form:hidden path="searchLevel" id="searchLevel" name="searchLevel"/>
                           <form:hidden path="ctgryLclas"  id="ctgryLclas"  name="ctgryLclas" value="${searchPopResult.ctgryLclas}" />
                           <form:hidden path="snId"        id="snId"        name="snId"       value="${searchPopResult.snId}"/>
                           <span class="btn_pack gray" id="lineDel" style="display:none;"><a href="#">행삭제</a></span>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
</table>
</form:form>
