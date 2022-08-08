const goPayment = () => {
    console.clear();

    let pg = $('btn-check').val();
    console.log(pg);
    let name = $('.class-title').text();    // 상품정보s
    let amount = parseInt($('#total-amount').text().substring(0, $('#total-amount').text().length - 1).replace(",", "")); // 금액

    console.log(name);

    event.preventDefault();

    const IMP = window.IMP; // 생략 가능
    IMP.init("imp98682392"); // Example: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay(
        {
            // param
            pg: pg,
            pay_method: "card",
            merchant_uid: "ORD20180131-0000023",
            name: name,
            amount: 10,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181",
        },
        async function (rsp) {
            // callback
            if (rsp.success) {
                alert("결제완료");
                console.log(rsp);
                window.location.href = "weet_payment_succeeded.html";
            } else {
                alert("결제가 취소되었습니다. 다시 진행해 주세요.");
            }
        }
    );
} // goPayment

// 체크박스 전체선택
const selectAll = (selectAll) => {
    const checkboxes = document.querySelectorAll('input[name="agmt"]');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
    }); // forEach
    
} // selectAll

// 하나라도 체크 해제되면 전체선택 해제
const checkSelectAll = (checkbox) => {
    const selectall = document.querySelector('#agmt-all');

    if (checkbox.checked === false) {
        selectall.checked = false;
    } // if

} // checkSelectAll
