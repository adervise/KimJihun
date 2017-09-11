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
 *    Copyright (C) by  All right reserved.
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="all" href="../../../css/bd/common.css" />
<link rel="stylesheet" type="text/css" media="all" href="../../../css/bd/layout.css" />
<link rel="stylesheet" type="text/css" media="all" href="../../../css/bd/contents.css" />
<link rel="stylesheet" type="text/css" media="all" href="../../../css/bd/jquery.ui.datepicker.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="../css/ie7.css" />
<![endif]-->
<script type="text/javascript" src="../../../js/bd/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery-ui.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.yakutree.js"></script>
<script type="text/javascript" src="../../../js/bd/common.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.ui.core.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../../../js/bd/jsviews.min.js"></script>
<!-- validate -->
<script type="text/javascript" src="../../../js/bd/jquery.validate.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.mockjax.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.form.js"></script>
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
    $('#searchList').on('click', function(){

        var searchLvl = 1;

        if($('#statsCombo3').val() != null && $('#statsCombo3').val() != "") searchLvl = 3;
        else if($('#statsCombo2').val() != null && $('#statsCombo2').val() != "") searchLvl = 2;
        else if($('#statsCombo1').val() == null || $('#statsCombo1').val() == "") searchLvl = 0;

        var params = {
                'ctgryLclas' : (!$('#statsCombo1').val().length)? null:$('#statsCombo1').val(),
                'ctgryMlsfc' : ($('#statsCombo2').val() == null || $('#statsCombo2').val() == "")? null:$('#statsCombo2').val(),
                'ctgrySclas' : ($('#statsCombo3').val() == null || !$('#statsCombo3').val().length)? null:$('#statsCombo3').val(),
                'startDt'    : $("input[name=startDate]").val(),
                'endDt'      : $("input[name=endDate]").val(),
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

    //$("input[name=startDate]").val("");
    //alert($.datepicker.formatDate('yymmdd', new Date()));
    var startDate = new Date();
    startDate.setMonth(startDate.getMonth()-1);
    $("input[name=startDate]").val($.datepicker.formatDate('yy-mm-dd', startDate));
    $("input[name=endDate]").val($.datepicker.formatDate('yy-mm-dd', new Date()));
    // alert($("input[name=startDate]").val());

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
            'ctgrySclas'  : ($('#statsCombo3').val() == null || !$('#statsCombo3').val().length)? null:$('#statsCombo3').val(),
            'startDt'     : $("input[name=startDate]").val(),
            'endDt'       : $("input[name=endDate]").val(),
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
        url : "<c:url value='/searchList.do'/>"  ,
        success : function(data) {
            $('.board_list').empty();
            $('.board_list').append(data)
        }
    });
}

/** category_register.jsp List 출력 **/
function register(SN_ID) {

    var params = {
            'snId': SN_ID
    };

    $.ajax({
           data : params,
           url : "<c:url value='/register.do'/>" ,
           success : function(data) {

               $('.category_cont').empty();
               $('.category_cont').append(data)
           }
       });
}


/** category_register.jsp 화면에서 출력되는 콤보메뉴 **/
var fn_bd_setCombo = function(tg, nTg, lvl) {
    var param = {
    		ctgryLclas : $(tg).val(),
            statsLvl     : 2
    };

    $.ajax({
        data : param,
        url : "<c:url value='/bdComboList.do'/>",
        success : function(data) {
            loadCombo($(nTg), data);
        }
    });
};

/** category_register.jsp 화면에서 출력되는 콤보메뉴 **/
var loadCombo = function(tg, data) {
    var dataArr = [];
    var inx = 0;
    tg.empty();

    //dataArr[0] = "<option value=''><선택></option>";
    $(data).each( function() {

    	dataArr[inx++] = "<option value=" + this.ctgryCd + ">" + this.ctgryNm + "</option> ";
    });
    tg.append('<option value=""><선택></option>');
    tg.append(dataArr);
}

/** 자동분류 통계 화면 호출 **/
function viewRs() {

    $.ajax({
           url : "<c:url value='/rsList.do'/>" ,
           success : function(data) {
               $('.category_cont').empty();
               $('.category_cont').append(data);
           }
    });
}


/** 소분류 등록화면 호출 **/
function viewNew() {

    $.ajax({
           url : "<c:url value='/viewNew.do'/>" ,
           success : function(data) {
               $('.category_cont').empty();
               $('.category_cont').append(data);
           }
    });
}

/** 팝업화면 호출하는 함수 **/
function categoryPop(){

	    initLayer("/categoryPop.do");
}




</script>
<title>O</title>
</head>
<body>
    <div id="nWrap">
        <!--
         @ Header
        -->
        <div id="nHeader">
            <h1 class="logo"><a href="#"><img src="../../../images/bd/common/admin_logo.png" height="24" alt="" /></a></h1>
            <ul class="gnb">
                <!-- <li><span class="fc_04 bold">홍길동</span>님, 로그인 접속중</li>
                <li><a href="#">프론트</a></li>
                <li><a href="#">로그아웃</a></li> -->
            </ul>
        </div>
        <!--
         @ // Header
        -->
        <!--
         @ Container
        -->
        <div id="nContainer">
            <!--
             @ // Content
            -->
            <div id="nContent" class="categoryWrap">
                <div class="contentBar"><a href="#" class="contentAction"></a></div>
                <div class="nLocation">
                    <p class="subMenu">카테고리관리</p>
                    <div class="top_btn">
                        <span class="btn_pack white"><a href="index.jsp">카테고리 수집통계</a></span>
                        <span class="btn_pack white" id=""><a href="#" onclick="viewRs();">자동분류통계</a></span>
                        <span class="btn_pack white" id=""><a href="#" onclick="viewNew();">카테고리 관리</a></span>
                    </div>
                </div>
                <div id="category" class="sort_list">
                    <div class="gExplorerCtrl">
                        <!-- <span class="btn_pack white"><a href="#" class="btnUp">▲</a></span> -->
                        <!-- <span class="btn_pack white mgr05"><a href="#" class="btnDown">▼</a></span> -->
                        <span class="btn_pack gray mgr05"><a href="#" class="btnAdd" onclick="categoryPop();">대분류 / 중분류 추가</a></span>
                        <!-- <p><span class="btn_pack white"><a href="#" >새로고침</a></span></p> -->
                    </div>


       <%--                             <c:forEach var="resultLeft" items="${resultListLeft}" varStatus="status">
                                    <td><c:out value="${resultLeft.lv}"/></td>
                                 </c:forEach> --%>

		<c:set var="menuLvlStatus" value="0"/>
		<div class="directory">
		<div class="root bold">##</div>
		    <ul id="sdk">
		     <li><a href="#">01. *** 3.0</a>
		      <ul>
		      <c:forEach var="resultLeft" items="${resultListLeft}" varStatus="status">
		        <c:if test="${resultLeft.lv == 'LV1'}">
		          <c:if test="${status.index != 0 && menuLvlStatus == 2}">
			           </ul>
					  </li>
					 </ul>
					</li>
		          </c:if>

		          <c:if test="${menuLvlStatus == 0}">
                    </li>
                  </c:if>

		          <c:if test="${menuLvlStatus == 1}">
		                </li>
		              </ul>
                    </li>
                  </c:if>

		            <li><a href="#"><c:out value="${resultLeft.ctgryNm}" /></a>

		          <c:set var="menuLvlStatus" value="0"/>
		        </c:if>

			     <c:if test="${resultLeft.lv == 'LV2'}">
			       <c:if test="${menuLvlStatus == '0'}">
		           <ul>
			       </c:if>
			       <c:if test="${menuLvlStatus == '1'}">
                   </li>
                   </c:if>
			       <c:if test="${menuLvlStatus == '2'}">
			         </ul>
			         </li>
		           </c:if>
		           <li><a href="#"><c:out value="${resultLeft.ctgryNm}" /></a>
			       <c:set var="menuLvlStatus" value="1"/>
			     </c:if>

			     <c:if test="${resultLeft.lv == 'LV3'}">
			       <c:if test="${menuLvlStatus == '1'}">
		               <ul>
		           </c:if>
		               <li><a href="#" id="snId" onclick="register(${resultLeft.snId});return false;"><c:out value="${resultLeft.ctgryNm}" /></a></li>
		         <c:set var="menuLvlStatus" value="2"/>
		         </c:if>
		         </c:forEach>

		         <c:out value="${status.index}"/>

		         <c:if test="${status.count != '0'}" >

		         </li>
		        </ul>
		        </c:if>
		      </ul>
		    </li>
		  </ul>
		</div>
                 </div>
                 <!-- category_cont -->
                 <div class="category_cont">
                    <div class="section_title">
                        <p class="title">카테고리 수집통계</p>
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
                                    <th>수집일자</th>
                                    <td>
                                        <input type="text" name="startDate" class="date" title="기간선택" /> ~ <input type="text" name="endDate" class="date" title="기간선택" />
                                    </td>
                                </tr>



                   <tr>
                      <th>카테고리</th>
                      <td>
                          <div class="sort">


                              <%-- <select name="" id="statsCombo1">
                              <c:forEach var="resultLeft" items="${resultListLeft}" varStatus="status">
                                <c:if test="${resultLeft.lv == 'LV1'}">
                                  <option value="<c:out value="${resultLeft.ctgryLclas}"/>"><c:out value="${resultLeft.ctgryNm}"/></option>
                                </c:if>
                              </c:forEach>

                              </select> --%>

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

                              <span>소분류</span>
                              <select name="" id="statsCombo3">
                                <c:forEach var="bdComboList" items="${selectBdComboList}" varStatus="status">
                                    <option id="combo3" name="CTGRY_SCLAS" value="<c:out value="${bdComboList.ctgryCd}"/>"><c:out value="${bdComboList.ctgryNm}"/></option>
                                </c:forEach>
                              </select>


                          </div>
                      </td>
                  </tr>






                            </tbody>
                        </table>


                        <div class="tcenter">
                            <span class="btn_pack orange"><div id="searchList" class="btn_pack orange">검색</div></span>
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
					        <c:forEach var="searchResult" items="${selectSearchList}" varStatus="status">
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
                </div>
                <!--// category_cont -->
            </div>
            <!--
             @ // Content
            -->
        </div>
        <!--
         @ // Container
        -->
    </div>
    <script type="text/javascript">
        $(function(){
            $("#category").css({"height":$(window).height()-83});
            //category
            $("#sdk").yakutree({
                btnUp : '.btnUp',
                btnDown : '.btnDown',
                btnAdd : '.btnAdd',
                btnCallback : function ( type, $source, $target) {
                    switch( type ) {
                        case 'moveUp':
                            //this.moveAnimation(  $source, $target, 'revert' );
                            break;
                    }
                }
            });
        });

			/* $(document).ready(function(){
				$('#board_list').load('url', {
					startDt : '20151212',
					endDt : '20151231'
				},function({

				}));
			}); */

			$(document).ready(function(){
				$('#board_list').load('url',{})
			})


    </script>
    <div id="layerMask" onclick="layerClose();"></div>
    <div id="layerWrap" class="layerWrap" style="width:60%; height:50%;"></div>
</body>
</html>
