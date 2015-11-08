window.addEventListener("load", function() {
  distributionGraph();
  avgGraph();
  happinessSlider();
});

function distributionGraph() {
  var chart = document.getElementById("graph-distribution");
  if (!chart) return;
  var legend = document.getElementById("graph-distribution-legend");
  var ctx = chart.getContext("2d");
  var graph = new Chart(ctx).Doughnut([
      {
        value: stats.Distribution.happy,
        color: "#ffc107",
        highlight: "#ffb300",
        label: "Happy"
      },
      {
        value: stats.Distribution.neutral,
        color: "#4db6ac",
        highlight: "#009688",
        label: "Neutral"
      },
      {
        value: stats.Distribution.sad,
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
    labels: stats.Rate.Days,
    datasets: [
    {
      label: "Ratings",
      fillColor: "#e8f5e9",
      strokeColor: "#4caf50",
      pointColor: "#fff",
      pointStrokeColor: "#4caf50",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(220,220,220,1)",
      data: stats.Rate.Rate
    }
    ]
  },
  {
    scaleShowGridLines : false,
    pointDotRadius : 8,
    pointDotStrokeWidth : 5,
    pointHitDetectionRadius: 1
  }
  );
}

function happinessSlider() {
  var el = document.getElementById("rate");
  var name = document.getElementById("rate-label");
  var ranges = {
    5: 'Desperately Unhappy',
    15: 'Very Unhappy',
    25: 'Unhappy',
    35: 'Passable',
    45: 'Quite OK',
    55: 'OK',
    65: 'Content',
    75: 'Cheerful',
    85: 'Happy',
    95: 'Delighted',
    100: 'Blissful'
  };
  el.addEventListener("input", function(e) {
    var val = parseInt(el.value, 10);
    for (var i in ranges) {
      if (val <= i) {
        name.innerHTML = ranges[i];
        break;
      }
    }
  });
}
