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
 * @ 2015. 7. 6.   최종진            최초생성
 *
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!--<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>-->
<script type="text/javascript" src="../../../js/bd/jquery-ui.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.yakutree.js"></script>
<script type="text/javascript" src="../../../js/bd/common.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.ui.core.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="../../../js/bd/jquery.mCustomScrollbar.concat.min.js"></script>
<title>ON</title>
</head>
<body>
    <div id="nWrap">
        <!--
         @ Header
        -->
        <div id="nHeader">
            <h1 class="logo"><a href="#"><img src="../../../images/bd/common/admin_logo.png" height="24" alt="" /></a></h1>
            <ul class="gnb">
                <li><span class="fc_04 bold">홍길동</span>님, 로그인 접속중</li>
                <li><a href="#">프론트</a></li>
                <li><a href="#">로그아웃</a></li>
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
                        <span class="btn_pack white"><a href="#">초기화면가기</a></span>
                        <span class="btn_pack white"><a href="#">카테고리관리</a></span>
                    </div>
                </div>
                <div id="category" class="sort_list">
                    <div class="gExplorerCtrl">
                        <span class="btn_pack white"><a href="#" class="btnUp">▲</a></span>
                        <span class="btn_pack white mgr05"><a href="#" class="btnDown">▼</a></span>
                        <span class="btn_pack gray mgr05"><a href="#" class="btnAdd">카테고리추가</a></span>
                        <p><span class="btn_pack white"><a href="#">새로고침</a></span></p>
                    </div>
                    <div class="directory">
                        <div class="root bold">###</div>
                        <ul id="sdk">
                            <li><a href="#">01. ***포털 3.0</a>
                                <ul>
                                    <li><a href="#">01. 지도서비스(3건)</a>
                                        <ul>
                                            <li><a href="#">01.지도</a>
                                                <ul>
                                                    <li><a href="#">01. 위성지도(2건)</a></li>
                                                    <li><a href="#">02. 지번정보(1건)</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">02. 연계서비스</a></li>
                                    <li><a href="#">03. 조회서비스</a></li>
                                    <li><a href="#">04. 모바일서비스</a></li>
                                </ul>
                            </li>
                            <li><a href="#">02. 웹관리시스템</a></li>
                        </ul>
                     </div>
                 </div>
                 <!-- category_cont -->
                 <div class="category_cont">
                    <div class="section_title">
                        <p class="title">카테고리 관리</p>
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
                                        <input type="text" name="" class="date" title="기간선택" /> ~ <input type="text" name="" class="date" title="기간선택" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>카테고리</th>
                                    <td>
                                        <div class="sort">
                                            <select name="" id="">
                                                <option value="">대분류</option>
                                            </select>
                                            <select name="" id="">
                                                <option value="">중분류</option>
                                            </select>
                                            <select name="" id="">
                                                <option value="">소분류</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="tcenter">
                            <span class="btn_pack orange"><a href="#">검색</a></span>
                        </div>
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
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <thead>
                                <tr>

                                    <th scope="col" rowspan="2">수집일시</th>
                                    <th scope="col" colspan="3">카테고리</th>
                                    <th scope="col" rowspan="2">건수</th>
                                    <th scope="col" rowspan="2">LV</th>
                                </tr>
                                <tr>
                                    <th scope="col" class="b_left">대분류</th>
                                    <th scope="col">중분류</th>
                                    <th scope="col">소분류</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="result" items="${resultList}" varStatus="status">
                                <tr>
                                    <td><c:out value="${result.COLCT_DT}"/></td>
                                    <td><c:out value="${result.CTGRY_LCLAS}"/></td>
                                    <td><c:out value="${result.CTGRY_MLSFC}"/></td>
                                    <td><c:out value="${result.CTGRY_SCLAS}"/></td>
                                    <td><c:out value="${result.RSCT}"/></td>
                                     <td>-</td>

                                </c:forEach>
<%--                                  <c:forEach var="resultLeft" items="${resultListLeft}" varStatus="status">
                                    <td><c:out value="${resultLeft.lv}"/></td>
                                 </c:forEach> --%>
                                 </tr>
                            </tbody>
                        </table>
                        <div class="paging_wrap">
                        <!-- paging -->
                        <div class="paging">
                            <a class="prevEnd" href="#"><img src="../../../images/bd/btn/btn_prevEnd.gif" alt="처음"></a>
                            <a class="prev" href="#"><img src="../../../images/bd/btn/btn_prev.gif" alt="이전"></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a class="next" href="#"><img src="../../../images/bd/btn/btn_next.gif" alt="다음"></a>
                            <a class="nextEnd" href="#"><img src="../../../images/bd/btn/btn_nextEnd.gif" alt="끝"></a>
                        </div>
                        <!-- // paging -->
                        <p class="btn"><span class="btn_pack blue"><a href="#" class="letter">Excel</a></span></p>
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
        })
    </script>
</body>
</html>
