const loremIpsum = document.getElementById("lorem-ipsum")

fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
    .then(response => response.text())
    .then(result => loremIpsum.innerHTML = result)

// 특정 버튼을 누르면 모달창이 켜지게 하기
const modal = document.getElementById("modal")

function modalOn() {
    modal.style.display = "flex"
}

function isModalOn() {
    return modal.style.display === "flex"
}

// 모달 초기상태
function modalOff() {
    modal.style.display = "none"
}


const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modalOn()
})

// 모달창의 클로즈(x) 버튼을 누르면 모달창이 꺼지게 하기
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})

// 모달창이 켜진 상태에서 ESC 버튼을 누르면 모달창이 꺼지게 하기
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})