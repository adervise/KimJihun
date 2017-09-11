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
 * @ 2015. 7. 29.   김지훈            최초생성
 *
 * @author  빅데이터 김지훈
 * @since   2015. 7. 29.
 * @version 1.0
 * @see
 *
 *    Copyright (C) by  All right reserved.
 */
%>
<script type="text/javascript">
$(document).ready(function(){

    /** [팝업창_콤보기능] 메인페이지 로딩에 따른 콤보레벨 값 초기 셋팅 **/
    $('#statsComboPop1').ready(function(){
        setStatCombo('statsComboPop1', {'statsLvl': 1 });
    });

    /** [팝업창_콤보기능] 대분류 변경에 따른 중분류 소분류 초기화 **/
    $('#statsComboPop1').on('change', function(){
        $('#statsComboPop2').empty();
    });


    /** [팝업창_콤보기능] 대분류 변경에 따른 리스트변경 **/
    $('#statsComboPop1').on('change', function(){
        setStatCombo('statsComboPop2', {'ctgryLclas' : $('#statsComboPop1').val(), 'statsLvl': 2 });
        $('#statsComboPop2').empty();

    });

    /** [팝업창_콤보기능] 콤보박스 변경에 따른 리스트변경 함수 **/
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

    /** [팝업창_검색기능] 검색버튼 클릭시 검색 데이터 전달 **/
    $('#searchPopList').on('click', function(){

        var searchLvl = 0;

        if($('#statsComboPop1').val() == null || $('#statsComboPop1').val() == ""){

            searchLvl = 0;
            $('#searchLevel').val(searchLvl);
        }else if(($('#statsComboPop1').val() != null || $('#statsComboPop1').val() != "")  && ($('#statsComboPop2').val() == null || $('#statsComboPop2').val() == "")){

            searchLvl = 1;
            $('#searchLevel').val(searchLvl);

        }else{

            searchLvl = 2;
            $('#searchLevel').val(searchLvl);
        }

        var params = {
                'ctgryLclas' : (!$('#statsComboPop1').val().length)? null:$('#statsComboPop1').val(),
                'ctgryMlsfc' : ($('#statsComboPop2').val() == null || $('#statsComboPop2').val() == "")? null:$('#statsComboPop2').val(),
                'searchLevel': searchLvl
        };
        setPopSearch(params);
    });
});

    /** [팝업창_검색기능] 검색 버튼 조건 클릭시 조회 후 출력  **/
	var setPopSearch = function(param) {
	    var tgEle = $('.pop_list').empty();
	    $.ajax({
	        data : param,
	        url : "<c:url value='/searchPopList.do'/>"  ,
	        success : function(data) {
	            $('.pop_list').empty();
	            $('.pop_list').append(data)
	        }
	    });
	}

	/* 팝업에서 대분류 중분류 라인추가 기능 */
	function lineAdd(){

	    var addIdx;

		if($("#popListForm tr:last").attr("class") != null){
		    var lastTrNo = $("#popListForm tr:last").attr("class").replace("trItem","");
		    addIdx = parseInt(lastTrNo) +1;
		}
		else{
			addIdx = 1;
		}

		var dataSeq = 1;
	    var tmpl = $.templates('#statNewsTmpl');
	    var newItem = $("#popListForm tr:eq(1)").clone();
	    var lclas = $("#statsComboPop1").val();

	    var level = 0;
	    if(lclas.length == 0){
	        level = 0
	    }else if(lclas.length == 2){
	        level = 1
	    }else if(lclas.length > 2){
	        level = 2
	    }

	    var htmlOutput = tmpl.render({trSeq: addIdx ,seq: ++dataSeq, searchLevel: level, ctgryLclas: lclas });
	    $("#statNewsTable").append(htmlOutput);
	}

	function lineDel() {
	    $('#statNewsTable').on('click', '#lineDel', lineDel);
	    $(this).parent().parent().remove();
	}

	    /* 팝업에서 대분류 중분류 수정 후 저장 기능 */
	function fn_save() {

	    var lastTrNo = $("#popListForm tr:last").attr("class").replace("trItem","");
	    var addIdx = parseInt(lastTrNo);
	    var checkCnt = 0;
	    for(i=1; i <= addIdx;  i++){
	        if($(".trItem"+i).find("[name=ctgryId]").val() == "" || $(".trItem"+i).find("[name=ctgryId]").val() == null){
	            alert(i+"번째"+"아이디 입력하세요");
	            checkCnt++;
	            break;
	        }
	        if($(".trItem"+i).find("[name=ctgryNm]").val() == "" || $(".trItem"+i).find("[name=ctgryNm]").val() == null){
	            alert(i+"번째"+"이름을 입력하세요");
	            checkCnt++;
	            break;
	        }
	        if($(".trItem"+i).find("[name=ctgryOrdr]").val() == "" || $(".trItem"+i).find("[name=ctgryOrdr]").val() == null){
	            alert(i+"번째"+"순번을 입력하세요");
	            checkCnt++;
	            break;
	        }
	    }

	    if(checkCnt > 0){

	    	return;
	    }

	    var saveConfirm = confirm("저장하시겠습니까?")
	    $.ajax({
	        type : "POST",
	        url : "<c:url value='/popViewInsert.do'/>",
	        data : $('#popForm').serialize(),
	        success : function(data) {
	            categoryPop();
	             $('#searchPopList').trigger('click');
	        }
	    });
	}

</script>

<script id="statNewsTmpl" type="text/x-jsrender">
<tr class="trItem{{:trSeq}}" data-row="{{:seq}}">
    <td><input type="text" id="ctgryId"   name="ctgryId"   style="width:70px"   /></td>
    <td><input type="text" id="ctgryNm"   name="ctgryNm"   style="width:100px"  /></td>
    <td><input type="text" id="ctgryOrdr" name="ctgryOrdr" style="width:30px"   /></td>
    <td><input type="text" id="ctgryDc"   name="ctgryDc"   style="width:250px"  /></td>
    <td>
        <select id="useYn" name="useYn" style="width:50px;">
            <option value="Y" label="Y" selected="selected"/>
            <option value="N" label="N"/>
        </select>
    </td>
    <td><span class="btn_pack gray" id="lineDel"><a href="#" onclick="lineDel();">행삭제</a></span></td>

    <input type="hidden" name ="registerFlag" id="registerFlag" value="insert"/>
    <input type="hidden" name ="searchLevel"  id="searchLevel"  value="{{:searchLevel}}"/>
    <input type="hidden" name ="ctgryLclas"   id="ctgryLclas"   value="{{:ctgryLclas}}"/>
    <input type="hidden" name ="snId"         id="snId"         value="1"/>

</tr>
</script>

<p class="layerTitle">카테고리 대분류, 중분류 입력</p>
<div class="contWrap">
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
                    <th>카테고리 분류</th>
                    <td>
                        <div class="sort">
                            <span>대분류</span>
                            <select name="" id="statsComboPop1">
                                <c:forEach var="bdComboList" items="${selectBdComboList}" varStatus="status">
                                    <option id="comboPop1" name="CTGRY_LCLAS" value="<c:out value="${bdComboList.ctgryCd}"/>"><c:out value="${bdComboList.ctgryNm}"/></option>
                                </c:forEach>
                            </select>

                            <span>중분류</span>
                            <select name="" id="statsComboPop2">
                                <c:forEach var="bdComboList" items="${selectBdComboList}" varStatus="status">
                                    <option id="comboPop2" name="CTGRY_MLSFC" value="<c:out value="${bdComboList.ctgryCd}"/>"><c:out value="${bdComboList.ctgryNm}"/></option>
                                </c:forEach>
                            </select>


                            <span id="aaa" class="btn_pack gray_s"><div class="btn_pack orange" id="searchPopList">검색</div></span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- // board_write -->
    <!-- board_list -->
    <!-- <div class="pop_list" style= "width:1119px; height:500px; overflow: auto"> -->
        <div class="pop_list">
        <table cellpadding="0" cellspacing="0" border="0" summary="" id="listForm">
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
                <tbody>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
               </tbody>
        </table>
    </div>
    <!-- // board_list -->

    <div class="tcenter mgt20">
        <!-- <span class="btn_pack gray" id="lineDel"><a href="#" onclick="lineDel();">행삭제</a></span> -->
        <span class="btn_pack gray" id="lineAdd"><a href="#" onclick="lineAdd();">행추가</a></span>
        <span class="btn_pack orange"><a href="#" onclick="fn_save();">저장</a></span>
        <span class="btn_pack white"><a href="#" onclick="layerClose();">닫기</a></span>
    </div>
</div>
<p class="close">
    <a href="#close" class="layerClose" onclick="layerClose();" title="레이어팝업 닫기"><img src="../images/bd/btn/btn_close.gif" alt="닫기" /></a>
</p>
