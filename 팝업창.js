$(document).ready(function() {
  lineChart();

  $(window).resize(function() {
    window.lineChart.redraw();
  });
});


function lineChart() {
  window.lineChart = Morris.Line({
    element: 'myfirstchart',

    // 날짜와 해당 데이터
    data: [
      { d: '2022-06-01', a: 66 },
      { d: '2022-06-02', a: 75},
      { d: '2022-06-03', a: 50}
    ],

    xkey: 'd',
    ykeys: ['a'],
    labels: ['체중(kg)'],
    lineColors: ['#14E302'],
    lineWidth: '3px',
    resize: true,
    redraw: true

  });
}