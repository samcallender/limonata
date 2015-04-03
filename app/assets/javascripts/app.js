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

			var minHeight = d3.min(data, function (d) {
				return d[1];
			});

			var maxHeight = d3.max(data, function (d) {
				return d[1];
			});

			var padding = 20;


			var xScale = d3.scale.linear()
				.domain([minYear, 2030])
				.range([10, 1000]);

			var yScale = d3.scale.linear()
				.domain([minHeight, maxHeight])
				.range([680, 10]);	

			var canvas = d3.select("#building-data")
				.append("svg")
				.attr("width", 1200)
				.attr("height", 700)
				// .append("g")
				.append("g")
				.attr("fill", "black");

			var xAxis = d3.svg.axis()
				.scale(xScale)
				.orient("bottom")
				.ticks(10);

			var yAxis = d3.svg.axis()
				.scale(yScale)
				.orient("left")
				.ticks(10);

			canvas.append("svg:g")
				.attr("class", "x axis")
				.attr('transform', 'translate(0,'+ (700 - padding) + ')')
				.call(xAxis);

			canvas.append("svg:g")
				.attr("class", "y axis")
				.attr('transform', 'translate(' +(1200 - padding) + ', 0)')
				.call(yAxis);

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
				.attr("r", 3)
				.attr("class", function(d){
					return d[3].toLowerCase().replace(/\s+/g, '');
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
   					return d[3].toLowerCase().replace(/\s+/g, '');
   				});   				

		}
	})
})
}

var cityToggle = function(){
	$('.city-display').on('click', function(){
		var city = this.id
		var markers = $('.'+city)
		if(markers.attr('class').indexOf('hide') > 0){
			markers.attr('class', city)
		}
		else{			
			markers.attr("class", city + ' hide')
		}
	})
}

window.onload = function(){
	makeGraph();
	cityToggle();
	
}


// var toggleNewYork = function(){
// 	var display =  $('.York').attr("display")

// 	if (display != "none") { 
// 		$('#newyork').on('click', function(){
// 		$('.York').attr("class", "hide");
// 	})
// 	}
// 	else {
// 		$('#newyork').on('click', function(){
// 		$('.York').attr("class", "hide");
// 		})
// 	}
// }

// var toggleChicago = function(){
// 	var display =  $('.Chicago').attr("display")

// 	if (display != "none") { 
// 		$('#chicago').on('click', function(){
// 		$('.Chicago').attr("class", "hide");
// 	})
// 	}
// 	else {
// 		$('#chicago').on('click', function(){
// 		$('.Chicago').removeAttr("class", "hide");
// 		})
// 	}
// }

// var toggleSeattle = function(){
// 	var display =  $('.Seattle').attr("display")

// 	if (display != "none") { 
// 		$('#seattle').on('click', function(){
// 		$('.Seattle').attr("class", "hide");
// 	})
// 	}
// 	else {
// 		$('#seattle').on('click', function(){
// 		$('.Seattle').removeAttr("class", "hide");
// 		})
// 	}
// }


// var toggleNewYork = function(){
// 		$('#newyork').on('click', function(){
// 		$('.York').attr("display", "none");
// 	})
// }

// var toggleChicago = function(){
// 		$('#chicago').on('click', function(){
// 		$('.Chicago').attr("class", "hide");
// 	})
// }

// var toggleSeattle = function(){
// 		$('#seattle').on('click', function(){
// 		$('.Seattle').attr("class", "hide");
// 	})
// }
