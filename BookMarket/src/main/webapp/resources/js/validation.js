/**
 * 
 */

function checkAddBook() {
	let bookId = document.getElementById("bookId");
	let name = document.getElementById("name");
	let unitPrice = document.getElementById("unitPrice");
	let unitsInStock = document.getElementById("unitsInStock");
	let description = document.getElementById("description");
	
	if(!check(/^ISBN[0-9]{4,11}$/, bookId, "[도서 코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.")) {
		return false;
	}
	
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요.");
		name.focus();
		return false;
	}
	
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.focus();
		return false;
	}
		
	if (unitPrice.value < 0) {
		alert("[가격]\음수를 입력할 수 없습니다.");
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소주점 둘째 자리까지만 입력하세요.")) {
		return false;	
	}
			
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요.");
		unitsInStock.focus();
		return false;
	}
	
	if (description.value.length < 5) {
		alert("[상세설명]\n최소 100자 이상 입력하세요.");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newBook.submit();
}

