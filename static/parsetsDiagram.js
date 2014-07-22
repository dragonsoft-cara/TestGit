/*var parsetsDiagram;
$(function() {
	parsetsDiagram = new ParSets("endUser-div", "enduserexp/populate");
});*/

function ParSets(ele, urlParam) {
	typeof (ele) == 'string' && (ele = document.getElementById(ele));

	var w = 1360,
	    h = 600,
	    self = this;

	var svg = d3.select(ele).append("svg").attr("width", w).attr("height", h);

	$.ajax({
        type: "GET",
        url: urlParam,
        data: {customerId:123456789},
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        success: function (data) {
        	var jsonData = eval('(' + data + ')');
        	//var json = JSON.parse(data);

        	if (jsonData.length > 0) {
        		//retrieve the object field names for dimensions
        		var dimArray = new Array();
        		var singleStr = JSON.stringify(jsonData[0]);
        		JSON.parse(singleStr, function (key, value) {
        			if (typeof value === "string")
        				dimArray.push(key);
        			return value;
        		});

        		var chart = d3.parsets()
        			//.dimensions(["Sales", "vApp", "VM", "Host", "Gateway", "Client"]);
        			.dimensions(dimArray);

        		var partition = d3.layout.partition()
        			.sort(null)
        			.size([chart.width(), chart.height() * 5 / 4])
        			.children(function(d) { return d.children ? d3.values(d.children) : null; })
        			.value(function(d) { return d.count; });

        		svg.datum(jsonData).call(chart);
        	}
        }
    });

}
