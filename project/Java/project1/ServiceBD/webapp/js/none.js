/*************************** categoryPop.jsp참고 ***************************/

/** categoryPop 클릭시 라인 추가 다른 코딩 **/
$("#addRow").click(function(){
	var lastTrNo = $("#example tr:last").attr("class").replace("trItem","");
	var addIdx = parseInt(lastTrNo) +1;
	var newItem = $("#example tr:eq(1)").clone();
	newItem.removeClass();
	newItem.addClass("trItem"+ addIdx);
	newItem.find('input').val('');
	$("#example").append(newItem);
});

/** categoryPop 클릭시 라인 삭제 다른 코딩 **/
function lineDel(rowIdx){

      var $chkObj = $("input[name='useCheck']");
      var chkCnt = $chkObj.size();
      var chkdIdx = [];
      for(var i=0; i < chkCnt; i++){
          if($chkObj.eq(i).is(":checked")){
              chkdIdx.push(i);
          }
      }
      if(chkdIdx.length > 0){
          for(var i=0; i < chkdIdx.length; i++){
              $chkObj.eq(chkdIdx[i]).parent().parent().remove();
          }
      }else{
          alert("체크하세요");
      }
}

/* 팝업화면에서 행추가 기능 */
function lineAdd(){

    var lastTrNo = $("#popListForm tr:last").attr("class").replace("trItem","");
    var addIdx = parseInt(lastTrNo) + 1;
    var newItem = $("#popListForm tr:eq(1)").clone();

    newItem.removeClass();
    newItem.addClass("trItem"+ addIdx);
    // newItem.find('input').val('').attr('value','');
    newItem.find("[name=ctgryId]").val('').attr('value','');
    newItem.find("[name=ctgryNm]").val('').attr('value','');
    newItem.find("[name=ctgryOrdr]").val('').attr('value','');
    newItem.find("[name=ctgryDc]").val('').attr('value','');
    newItem.find('span').css("display", "");
    newItem.find("[name=registerFlag]").val('insert');
    newItem.find("[name=ctgryId]").attr('readonly',false);
    $("#popListForm").append(newItem);
    //행 삭제하는 부분
    $('.btn_pack', newItem).on('click', function(){
        $(this).parent().parent().remove();
    });
}
