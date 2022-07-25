const heart_button = document.querySelector('#heartCheck');
let isChecked = false;

heart_button.addEventListener("click", () => {
    isChecked = !isChecked;
    let counter_value = document.querySelector('.heartCount');
    let count = counter_value.innerHTML;

    if(isChecked) {
        counter = Number(count) + 1;
        console.log(counter);

        counter_value.innerHTML = counter;
    } else {
        counter = Number(count) - 1;
        console.log(counter);
        
        counter_value.innerHTML = counter;
    } // if-else
});