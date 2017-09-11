function fn_validate(){

		for(i=0; i<max;  i++){

			if($(".trItem"[i]).find("[name=ctgryId]").val() == null){
				alert(i+"번째"+"아이디 입력하세요");
				break;
			}
			if($(".trItem"[i]).find("[name=ctgryNm]").val() == null){
				alert(i+"번째"+"아이디 입력하세요");
				break;
			}
			if($(".trItem"[i]).find("[name=ctgryOrdr]").val() == null){
				alert(i+"번째"+"아이디 입력하세요");
				break;
			}
		}
	}
