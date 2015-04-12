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
   				.domain([minHeight, maxHeight + 50])
   				.range([680, 10]);	

   			var canvas = d3.select("#building-data")
   				.append("svg")
   				.attr("width", 1300)
   				.attr("height", 700)
   				.attr("fill", "white")
   				// .append("g")
   				.append("g");

   // ADD AXIS
   			var xAxis = d3.svg.axis()
   				.scale(xScale)
   				.orient("bottom")
   				.ticks(10);

   			var yAxis = d3.svg.axis()
   				.scale(yScale)
   				.orient("right")
   				.ticks(10);

   			canvas.append("svg:g")
   				.attr("class", "x axis")
   				.attr('transform', 'translate(0,'+ (700 - padding) + ')')
   				.call(xAxis);

   			canvas.append("svg:g")
   				.attr("class", "y axis")
   				// .attr('transform', 'translate(' +(1200 - padding) + ', 0)')
   				.attr('transform', 'translate(0, 0)')
   				.call(yAxis);

   // ADD AXIS LABELS

   // ADD CLOUDS
   // <a href="http://imgur.com/ScIgBRP"><img src="http://i.imgur.com/ScIgBRP.png" title="source: imgur.com" /></a>
      			
   			var cloudPositions = [[100,100], [125, 75]];

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 100)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 150)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 200)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 250)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 300)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);   				

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 350)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 400)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);     	

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 450)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 500)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 550)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 600)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);
      			
      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 650)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 700)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 750)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 800)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 850)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);  

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 900)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50); 

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 950)
      				.attr("y", 75)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/ScIgBRP.png")
      				.attr("x", 1000)
      				.attr("y", 100)
      				.attr("height", 50)
      				.attr("class", "cloud")
      				.attr("width", 50);
   // ADD CIRCLES FOR DATA POINTS
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
   				.on("click", function(d){
   					var url = "http://skyscraperpage.com/cities/?buildingID=";
   					var buildingID = d[4].toString();	
   					window.open(url+buildingID, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=700, height=700");
   				})
   				.on("mouseover", growCircle)
   				.on("mouseout", shrinkCircle)
   				.attr("opacity", 0)
   				.attr("class", function(d){
   					// return d[3].toLowerCase().replace(/\s+/g, '');
   					return d[3].toLowerCase().replace(/\s+/g, '') + ' hide';
   				});
   // ADD TEXT FOR DATA POINTS
   			canvas.selectAll("text")
   				.data(data)
   				.enter()
   				.append("text")
   				.text(function(d) {
   					return d[2];
   				})
   				.attr("x", function(d){
   					return xScale(d[0]+1);
   				})
   				.attr("y", function(d) {
   					return yScale(d[1]-2);
   				})
   				.attr("font-family", "sans-serif")
      				.attr("font-size", "4px")
      				.attr("fill", "red")
      				.on("click", function(d){
   					var url = "http://skyscraperpage.com/cities/?buildingID=";
   					var buildingID = d[4].toString();	
   					window.open(url+buildingID, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=700, height=700");
   				})
      				.attr("class", function(d){
      					// var buildingID = d[4].toString();
      					// return d[3].toLowerCase().replace(/\s+/g, '');
      					return d[3].toLowerCase().replace(/\s+/g, '') + ' hide';

      				})
      				.attr("opacity", 0)
      				.on("mouseover", growFont)
      				.on("mouseout", shrinkFont);
   // ADD MONSTERS!
      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/mRtDs6J.png")
      				.attr("x", 800)
      				.attr("y", 500)
      				.attr("height", 200)
      				.attr("width", 200)
      				.attr("class", "godzilla hide")
      				// .attr("class", "godzilla hide")
      				.attr("opacity", 0)
      				.on("click", goGoGodzilla);

      			canvas.append("svg:image")
      				.attr("xlink:href", "http://i.imgur.com/UsFz2mZ.png")
      				.attr("x", 610)
      				.attr("y", 630)
      				.attr("height", 50)
      				.attr("width", 50)
      				.attr("class", "staypuft hide")
      				.attr("opacity", 0)
      				.on("click", goGoGodzilla);
   		}
   	})
   })
}

// var floatClouds = function{
//    for (i = 0; i < 5; i++) {
//       d3.select(this).transition()
//          .duration(2000)
//          .attr("x", -50);
//    }
// }

// ANIMATIONS - MONSTERS
var goGoGodzilla = function() {
	d3.select(this).transition()
		.duration(5000)
		.attr("x", 100)
   	.attr("y", 500);
}

// ANIMATIONS - CITIES

var growCircle = function() {
	d3.select(this).transition()
        .duration(300)
        .attr("r", 10);	
}

var shrinkCircle = function() {
	d3.select(this).transition()
		.duration(300)
		.attr("r", 5);
}

var growFont = function() {
	d3.select(this).transition()
		.duration(300)
		.attr("font-size", "30px");

}

var shrinkFont = function() {
	d3.select(this).transition()
		.duration(1000)
		.attr("font-size", "4px");
}


var cityToggle = function(){
	$('.city-display').on('click', function(){
		console.log(this.id)
		var city = this.id
		var markers = $('.'+city)
		if(markers.attr('class').indexOf('hide') > 0){
			markers.attr('class', city)
			markers.animate({
				opacity: 1
			}, 400);
		}
		else{			
			// markers.attr("class", city + ' hide')
			markers.animate({
				opacity: 0
			}, 400, function(){
				markers.attr("class", city + ' hide')
			});
		}
	})
}


var summon = function(){
	$('.monster-display').on('click', function(){
		var monsterID = this.id
		var monster = $('.'+monsterID)
		if(monster.attr('class').indexOf('hide') > 0){
			monster.attr('class', monsterID)
			monster.animate({
				opacity: 1
			}, 400);
		}
		else{			
			// markers.attr("class", city + ' hide')
			monster.animate({
				opacity: 0
			}, 400, function(){
				monster.attr("class", monsterID + ' hide')
			});
		}
	})
}


// var summon = function() {
// 	$('.monster-display').on('click', function(){
// 	console.log(this.id)
// 	var monsterID = this.id
// 	var monster = $('.'+monsterID)
// 	 monster.animate({
// 		opacity: 1
// 	}, 400);		
// 	})
// }

window.onload = function(){
	makeGraph();
	cityToggle();
	summon();
   // floatClouds();	
}

// var cityToggle = function(){
// 	$('.city-display').on('click', function(){
// 		var city = this.id
// 		var markers = $('.'+city)
// 		if(markers.attr('class').indexOf('hide') > 0){
// 			markers.attr('class', city)
// 		}
// 		else{			
// 			markers.attr("class", city + ' hide')
// 		}
// 	})
// }

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
