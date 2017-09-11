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
<script type="text/javascript">

$(document).ready(function(){

    /** 메인페이지 로딩에 따른 콤보레벨 값 초기 셋팅 **/
    $('#statsCombo1').ready(function(){
        setStatCombo('statsCombo1', {'statsLvl': 1 });
    });

    /** 대분류 변경에 따른 중분류 소분류 초기화 **/
    $('#statsCombo1').on('click', function(){
        $('#statsCombo2').empty();
        $('#statsCombo3').empty();
    });

    /** 대분류 변경에 따른 리스트변경 **/
    $('#statsCombo1').on('change', function(){
        setStatCombo('statsCombo2', {'ctgryLclas' : $('#statsCombo1').val(), 'statsLvl': 2 });
        $('#statsCombo2').empty();
        $('#statsCombo3').empty();
    });

    /** 중분류 변경에 따른 리스트변경 **/
    $('#statsCombo2').on('change', function(){
        setStatCombo('statsCombo3', {'ctgryLclas' : $('#statsCombo1').val(), 'ctgryMlsfc' : $('#statsCombo2').val(), 'statsLvl': 3 });
    });

    /** 콤보박스 변경에 따른 리스트변경 함수 **/
    var setStatCombo = function(tg, param) {
        var tgEle = $('[id='+tg + ']').empty();
        $.ajax({
            data : param,
            url : "<c:url value='/bdComboList.do'/>",
            success : function(data) {
                tgEle.append('<option value=""><선택></option>');
                for(idx in data) {
                    tgEle.append('<option value="' + data[idx].ctgryCd + '">' + data[idx].ctgryNm + '</option>');
                }
            }
        });
    };

    /** index.jsp 화면 **/
    $('#rsList').on('click', function(){

        var searchLvl = 1;

        if($('#statsCombo3').val() != null && $('#statsCombo3').val() != "") searchLvl = 3;
        else if($('#statsCombo2').val() != null && $('#statsCombo2').val() != "") searchLvl = 2;
        else if($('#statsCombo1').val() == null || $('#statsCombo1').val() == "") searchLvl = 0;

        var params = {
                'ctgryLclas' : (!$('#statsCombo1').val().length)? null:$('#statsCombo1').val(),
                'ctgryMlsfc' : ($('#statsCombo2').val() == null || $('#statsCombo2').val() == "")? null:$('#statsCombo2').val(),
                'searchLevel': searchLvl,
        };
        setSearch(params);
    });


    $('.board_list').on('click', '#excelBtn', function(){
        var searchLvl = 1;
        if($('#statsCombo3').val() != null && $('#statsCombo3').val() != "") searchLvl = 3;
        else if($('#statsCombo2').val() != null && $('#statsCombo2').val() != "") searchLvl = 2;
        else if($('#statsCombo1').val() == null || $('#statsCombo1').val() == "") searchLvl = 0;

        var ctgryLclas = (!$('#statsCombo1').val().length)? null:$('#statsCombo1').val();
        var ctgryMlsfc = ($('#statsCombo2').val() == null || $('#statsCombo2').val() == "")? null:$('#statsCombo2').val();
        var ctgrySclas = ($('#statsCombo3').val() == null || !$('#statsCombo3').val().length)? null:$('#statsCombo3').val();
        var startDt = $("input[name=startDate]").val();
        var endDt = $("input[name=endDate]").val();

        var form = "<form  action='/exceldown.do'>";
            form += "<input type='hidden' name='searchLevel' value='"+searchLvl+"'/>";
            form += "<input type='hidden' name='ctgryLclas' value='"+ctgryLclas+"'/>";
            form += "<input type='hidden' name='ctgryMlsfc' value='"+ctgryMlsfc+"'/>";
            form += "<input type='hidden' name='ctgrySclas' value='"+ctgrySclas+"'/>";
            form += "<input type='hidden' name='startDt' value='"+startDt+"'/>";
            form += "<input type='hidden' name='endDt' value='"+endDt+"'/>";
            form += "</form>";
            jQuery(form).appendTo("body").submit().remove();

    });




});

/** 검색버튼 조건 클릭시 조회 기능 + 검색후 페이징처리 **/
function fn_search(pageNo) {

    var searchLvl = 1;

    if($('#statsCombo3').val() != null && $('#statsCombo3').val() != "") searchLvl = 3;
    else if($('#statsCombo2').val() != null && $('#statsCombo2').val() != "") searchLvl = 2;
    else if($('#statsCombo1').val() == null || $('#statsCombo1').val() == "") searchLvl = 0;

    var params = {
            'ctgryLclas'  : (!$('#statsCombo1').val().length)? null:$('#statsCombo1').val(),
            'ctgryMlsfc'  : ($('#statsCombo2').val() == null || $('#statsCombo2').val() == "")? null:$('#statsCombo2').val(),
            'searchLevel' : searchLvl,
            'pageIndex'   : pageNo
    };
    setSearch(params);
}



/** 검색버튼 조건 클릭시 조회 기능  + 페이징처리  **/
var setSearch = function(param) {
    var tgEle = $('.board_list').empty();
    $.ajax({
        data : param,
        url : "<c:url value='/rsSearchList.do'/>"  ,
        success : function(data) {
            $('.board_list').empty();
            $('.board_list').append(data)
        }
    });
}


</script>


                 <!-- category_cont -->
                    <div class="section_title">
                        <p class="title">자동분류 통계</p>
                    </div>
                    <!-- board_write -->
                    <div class="board_view mgb10">
                        <table cellpadding="0" cellspacing="0" border="0" summary="" class="mgb10">
                            <caption>리스트</caption>
                            <colgroup>
                                <col width="12%" />
                                <col width="*" />
                            </colgroup>
                            <tbody>




                   <tr>
                      <th>카테고리</th>
                      <td>
                          <div class="sort">



                              <span>대분류</span>
                              <select name="" id="statsCombo1">
                                <c:forEach var="bdComboList" items="${selectBdComboList}" varStatus="status">
                                    <option id="combo1" name="CTGRY_LCLAS" value="<c:out value="${bdComboList.ctgryCd}"/>"><c:out value="${bdComboList.ctgryNm}"/></option>
                                </c:forEach>
                              </select>

                              <span>중분류</span>
                              <select name="" id="statsCombo2">
                                <c:forEach var="bdComboList" items="${selectBdComboList}" varStatus="status">
                                    <option id="combo2" name="CTGRY_MLSFC" value="<c:out value="${bdComboList.ctgryCd}"/>"><c:out value="${bdComboList.ctgryNm}"/></option>
                                </c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              </select>



                          </div>
                      </td>
                  </tr>






                            </tbody>
                        </table>


                        <div class="tcenter">
                            <span class="btn_pack orange"><div id="rsList" class="btn_pack orange">검색</div></span>
                        </div>




            <!-- <input type="hidden" name="statsCd" /> -->




                    </div>
                    <!-- // board_write -->

                    <!-- board_list -->
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
