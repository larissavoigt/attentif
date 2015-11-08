window.addEventListener("load", function() {
  distributionGraph();
  avgGraph();
});

function distributionGraph() {
  var chart = document.getElementById("graph-distribution");
  if (!chart) return;
  var legend = document.getElementById("graph-distribution-legend");
  var ctx = chart.getContext("2d");
  var graph = new Chart(ctx).Doughnut([
      {
        value: 50,
        color: "#ffc107",
        highlight: "#ffb300",
        label: "Happy"
      },
      {
        value: 100,
        color: "#4db6ac",
        highlight: "#009688",
        label: "Neutral"
      },
      {
        value: 300,
        color:"#5c6bc0",
        highlight: "#3f51b5",
        label: "Sad"
      }
  ]);
  legend.innerHTML = graph.generateLegend();
}

function avgGraph() {
  var chart = document.getElementById("graph-avg");
  if (!chart) return;
  var legend = document.getElementById("graph-avg-legend");
  var ctx = chart.getContext("2d");
  var graph = new Chart(ctx).Line({
    labels: ["10/01", "10/02", "10/04", "10/08", "10/9", "10/10", "10/12"],
    datasets: [
    {
      label: "Ratings",
      fillColor: "#e8f5e9",
      strokeColor: "#4caf50",
      pointColor: "#fff",
      pointStrokeColor: "#4caf50",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(220,220,220,1)",
      data: [65, 59, 80, 81, 56, 55, 40]
    }
    ]
  },
  {
    scaleShowGridLines : false,
    pointDotRadius : 8,
    pointDotStrokeWidth : 5
  }
  );
}
