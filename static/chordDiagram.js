function Chord(ele, urlParam) {
	typeof (ele) == 'string' && (ele = document.getElementById(ele));

	var width = 1360,
		height = 600,
	    outerRadius = Math.min(width, height) / 2 - 10,
	    innerRadius = outerRadius - 24;
	
	var formatPercent = d3.format(".1%");
	var colors = d3.scale.category20();

	var arc = d3.svg.arc()
		.innerRadius(innerRadius)
		.outerRadius(outerRadius);

	var layout = d3.layout.chord()
		.padding(.04)		//gap between the arc
		.sortSubgroups(d3.descending)
		.sortChords(d3.ascending);

	var path = d3.svg.chord()
		.radius(innerRadius);

	//var svg = d3.select(ele).append("svg").attr("width", w).attr("height", h);
	var svg = d3.select(ele).append("svg")
		.attr("width", width)
		.attr("height", height)
		.append("g")
		.attr("id", "circle")
		.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

	svg.append("circle")
		.attr("r", outerRadius);

	$.ajax({
		type: "GET",
		url: urlParam,
		data: {customerId:123456789},
		contentType: "application/json; charset=utf-8",
		dataType: "text",
		success: function (data) {
			var json = JSON.parse(data);
			//alert(json.matrix);
			//alert(json.nodes);
			var matrix = json.matrix;
			var nodes = json.nodes;

			// Compute the chord layout.
			layout.matrix(matrix);

			// Add a group per neighborhood.
			var group = svg.selectAll(".group")
				.data(layout.groups)
				.enter().append("g")
				.attr("class", "group")
				.on("mouseover", mouseover)
				//.on("mouseover", fade(.1))
				.on("mouseout", fade(1));

			// callback for mouse click on node
			group.on("click", function(d, i) {
				//alert("clicked on node name=" + nodes[i].name + " value=" + nodes[i].value);
				//self.onNodeClicked(nodes[i].name);
			});

			// Returns an event handler for fading a given chord group.
			function fade(opacity) {
				return function(g, i) {
					svg.selectAll("path.chord")
						.filter(function(d) { return d.source.index != i && d.target.index != i; })
						.transition()
						.style("opacity", opacity);
				};
			}

			// Add a mouseover title.
			group.append("title").text(function(d, i) {
				//return nodes[i].name + ": " + d.value + " of origins";
				return nodes[i].name + ": " + nodes[i].value + " of origins";
			});

			// Add the group arc.
			var groupPath = group.append("path")
				.attr("id", function(d, i) { return "group" + i; })
				.attr("d", arc)
				.style("fill", function(d, i) { return colors(i); });
				//.style("fill", function(d, i) { return nodes[i].color; });

			// Add a text label.
			var groupText = group.append("text")
				.attr("x", 6)	//Firefox does not work
				.attr("dy", 15);

			groupText.append("textPath")
				.attr("xlink:href", function(d, i) { return "#group" + i; })
				.text(function(d, i) { return nodes[i].name; });

			// Remove the labels that don't fit. :(
			groupText.filter(function(d, i) { return groupPath[0][i].getTotalLength() / 2 - 16 < this.getComputedTextLength(); })
				.remove();

			// Add the chords.
			var chord = svg.selectAll(".chord")
				.data(layout.chords)
				.enter().append("path")
				.attr("class", "chord")
				.style("fill", function(d) { return colors(d.source.index); })
				//.style("fill", function(d) { return nodes[d.source.index].color; })
				.attr("d", path);

			// Add an elaborate mouseover title for each chord.
			chord.append("title").text(function(d) {
				return nodes[d.source.index].name
					+ " → " + nodes[d.target.index].name
					+ ": " + d.source.value
					+ "\n" + nodes[d.target.index].name
					+ " → " + nodes[d.source.index].name
					+ ": " + d.target.value;
			});

			function mouseover(d, i) {
				chord.classed("fade", function(p) {
					return p.source.index != i
						&& p.target.index != i;
				});
			}
		}
	});
}
