const heart_button = document.querySelector('#heartCheck');
let isChecked = false;

heart_button.addEventListener("click", () => {
    isChecked = !isChecked;

    let counter_value = document.querySelector('.heartCount');
    let count = Number(counter_value.innerHTML);

    count = isChecked ? ++count : --count;
    console.log(count);
    
    counter_value.innerHTML = count;
});