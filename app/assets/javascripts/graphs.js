$(function() {
//check level graph
if($("#check_graph").length > 0){
  host_id = $("#check_graph").data('host_id');
  check_id = $("#check_graph").data('check_id');
  console.log("/hosts/"+host_id+"/checks/"+check_id+"/graph.json")
  $.getJSON("/hosts/"+host_id+"/checks/"+check_id+"/graph.json",function(data){
    console.log(data)
    createSingleLineChart(data);
  });
}
//network level graphs

});

function createSingleLineChart(data) {
  var chart = new Highcharts.StockChart({
    chart: {
      renderTo: 'check_graph'
    },
    rangeSelector: {
      selected: 1
    },
    title: {
      text: data.title
    },
    series: [{
      name: data.series.name,
      data: data.series.data,
      tooltip: {
	valueDecimals:2
      }
    }]
  })
}