// $(function(){
//   var buildings = window.buildings = new BuildingCollection();
//   buildings.fetch({
//     success: function(){
//       var buildingsView = new BuildingCollectionView({
//         collection: buildings
//       })
//     } 
//   });
// })
// ^backbone stuff above that I want to keep


var makeGraph = function(){
$(function() {
	$.ajax({
		url: '/buildings.json',
		dataType: 'json',
		success: function(data){
			console.log('buildings array!');

			var minYear = d3.min(data, function (d) {
				return d[0];
			});

			var maxYear = d3.max(data, function (d) {
				return d[0];
			});

			console.log(minYear, maxYear);

			var minHeight = d3.min(data, function (d) {
				return d[1];
			});

			var maxHeight = d3.max(data, function (d) {
				return d[1];
			});

			console.log(minHeight, maxHeight);

			var xScale = d3.scale.linear()
				.domain([minYear, 2030])
				.range([10, 1000]);

			var yScale = d3.scale.linear()
				.domain([minHeight, maxHeight])
				.range([680, 10]);


			var canvas = d3.select("#building-data")
				.attr("width", 1100)
				.attr("height", 700)
				.attr("fill", "black");

			var xAxis = d3.svg.axis()
				.scale(xScale)
				.orient("bottom");

			canvas.append("g")
				.attr("class", "axis")
				.call(xAxis);


			canvas.selectAll("circle")
				.data(data)
				.enter()
				.append("circle")
				.attr("cx", function(d){
					return xScale(d[0]);
				})
				.attr("cy", function(d){
					return yScale(d[1]);
				})
				.attr("fill", "black")
				.attr("r", 5)
				.attr("class", function(d){
					return d[3];
				});


			canvas.selectAll("text")
				.data(data)
				.enter()
				.append("text")
				.text(function(d) {
					return d[2];
				})
				.attr("x", function(d){
					return xScale(d[0]);
				})
				.attr("y", function(d) {
					return yScale(d[1]);
				})
				.attr("font-family", "sans-serif")
   				.attr("font-size", "10px")
   				.attr("fill", "red")
   				.attr("class", function(d){
   					return d[3];
   				});
		}
	})
})
}

window.onload = function(){
	makeGraph();
}

