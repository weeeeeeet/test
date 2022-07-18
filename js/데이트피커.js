$(function () {
    $('#datetimepicker1').datetimepicker({ format: 'L'});
    $("#datetimepicker1").on("change.datetimepicker", function (e) {
        $('#datetimepicker2').datetimepicker('minDate', e.date);
    });
});