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
 * @ 2015. 7. 21.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 21.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by  All right reserved.
 */
%>
<!--For Commons Validator Client Side -->
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"/>
<validator:javascript formName="selectView" staticJavascript="false" xhtml="true" cdata="false"/>


<script type="text/javaScript" language="javascript" defer="defer">
/* 소분류 등록 function */
function fn_egov_save() {
    var frm = document.viewForm;
    if(!validateSelectView(frm)) {
        return;
    }
    frm.action = "<c:url value="viewInsert.do"/>";
    frm.submit();
}
/* 소분류 삭제 function */
function fn_egov_delete() {

    frm = document.viewForm;
    frm.action = "<c:url value="viewDelete.do"/>";
    frm.submit();
}
/* 소분류 수정 function */
function fn_egov_modify() {

    frm = document.viewForm;
    frm.action = "<c:url value="viewUpdate.do"/>";
    frm.submit();
}
</script>

<div class="section_title">
    <p class="title">카테고리 관리</p>
</div>
<!-- board_write -->
<form:form commandName="selectView" id="viewForm" name="viewForm" method="post">
<div class="board_view mgb10">
    <table cellpadding="0" cellspacing="0" border="0" summary="" class="mgb10">
        <caption>리스트</caption>
        <colgroup>
            <col width="12%" />
            <col width="*" />
        </colgroup>
        <tbody>
            <tr>
                <th>카테고리 분류</th>
                    <td>
                        <div class="sort">
                            <span>대분류</span>
	                        <form:select path="ctgryLclas" name="ctgryLclas" id="detailCombo1" onchange="fn_bd_setCombo(this, ctgryMlsfc, 2)">
	                           <option value="" selected="selected"><선택></option>
	                        <form:options items="${combo1}" itemValue="ctgryCd" itemLabel="ctgryNm"/><form:errors path="ctgryLclas"/>
	                        </form:select>

	                        <span>중분류</span>
                            <form:select path="ctgryMlsfc" name="ctgryMlsfc" id="detailCombo2">
                                <form:options items="${combo2}" itemValue="ctgryCd" itemLabel="ctgryNm" /><form:errors path="ctgryMlsfc"/>
                            </form:select>
                        <span class="btn_pack gray_s"><a href="#" id="layerOpenTarget" onclick="categoryPop();">대분류 / 중분류 추가</a></span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>카테고리 ID</th>
                <td>
                    <form:input path="ctgrySclas" size="25" name="ctgrySclas" maxlength="7"/><form:errors path="ctgrySclas"/>
                </td>
            </tr>

            <tr>
                <th>카테고리 명</th>
                <td>
                    <form:input path="ctgryNm" size="35" name="ctgryNm" /><form:errors path="ctgryNm"/>

                </td>
            </tr>
            <tr>
                <th>카테고리 설명</th>
                <td>
                    <form:textarea path="ctgryDc" cols="100" rows="3" name="ctgryDc"/>
                </td>
            </tr>
            <tr>
                <th>카테고리 최초등록일</th>
                <td>
                    <form:input path="ctgryFrstInputDt" size="25" name="ctgryFrstInputDt"/>
                </td>
            </tr>
            <tr>
                <th>데이터 수집 유형</th>
                <td>
                    <p class="radio_list">

                        <form:radiobutton path="colctTyp" name="colctTyp" value="DBMS TABLE" label="DBMS TABLE"/>
                        <form:radiobutton path="colctTyp" name="colctTyp" value="FILE" label="FILE"/>
                        <form:radiobutton path="colctTyp" name="colctTyp" value="XML" label="XML"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th>수집 로그 적재 위치</th>
                <td>
                     <form:input path="ldadngTy" size="35" name="ldadngTy"/>
                </td>
            </tr>
            <tr>
                <th>수집 로그 적재 유형</th>
                <td>
                    <p class="radio_list">
                        <form:radiobutton path="ldadngLc" name="ldadngLc" value="DBMS TABLE" label="DBMS TABLE"/>
                        <form:radiobutton path="ldadngLc" name="ldadngLc" value="HIVE TABLE" label="HIVE TABLE"/>
                        <form:radiobutton path="ldadngLc" name="ldadngLc" value="XML" label="XML"/>
                    </p>
                </td>
            </tr>
        </tbody>

    </table>
    <div class="tcenter">
        <span class="btn_pack gray"><a href="#" onclick="viewNew();">신규</a></span>
        <c:set var="registerFlag" value="${selectView.detailsnId == 0 ? 'create' : 'modify'}"/>
        <c:if test="${registerFlag == 'create'}"><span class="btn_pack orange"><a href="javascript:fn_egov_save();">저장</a></span></c:if>
        <c:if test="${registerFlag == 'modify'}"><span class="btn_pack orange"><a href="javascript:fn_egov_modify();">수정</a></span></c:if>
        <span class="btn_pack white"><a href="javascript:fn_egov_delete();">삭제</a></span>
    </div>
</div>

<form:hidden path="snId"/>
<form:hidden path="detailsnId"/>
</form:form>
