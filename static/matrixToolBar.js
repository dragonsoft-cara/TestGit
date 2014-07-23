(function($){	
	/*
	 * Matrix tool bar, draw matrix chart on sliderbar.
	 * sub class of laygoon.widgets.sliderBar.
	 */
	
	var CUSTOMER_ID = 12345678912345,
		MATRIX_URL = "/matrixBar/query",
		Y_LABELS = {
			APP_RESPONSE: "App Response Time",
			CPU_USAGE: "CPU Usage",
			MEMORY_CONSUMED: "Memory Consumed",
			STORAGE_LATENCY: "Storage Latency",
			NETWORK_TCP_FATAL: "TCP Fatal Retry"//add something
		};
	
	var matrixToolbar = function() {
		laygoon.widgets.sliderBar.apply(this, arguments);
	}
	matrixToolbar.prototype = {
		/*
		 * Implement drawChart from superClass.
		 * Draw matrix chart on sliderbar.
		 */
		drawChart: function(svg) {
			//console.log("Draw matrix tool bar...")
			//draw the grid background
			svg.append("rect")
				.attr("class", "grid-background")
				.attr("width", this.sliderBarWidth)
				.attr("height", this.sliderBarHeight);			
			
			// create rect with class "date" for num of data length and position each rect.
			var	cellWidth = this.sliderBarWidth / this.config.numOfColumn,
				cellHeight = this.sliderBarHeight / this.config.numOfRow;				
			var heatMap = svg.selectAll(".date")
			.data(this.data)
			.enter().append("rect")
			.attr("x", function(d) { return d.col * cellWidth; })
			.attr("y", function(d) { return d.row * cellHeight; })
			.attr("width", cellWidth)
			.attr("height", cellHeight)
			.style("fill", function(d) { return d.color; });		
		},
		
		/*
		 * Implement bootRealTimeMode from superClass.
		 * Draw matrix chart on sliderbar.
		 */		
		bootRealTimeMode: function(){
			var startDate = new Date(moment().add('days', -1));
			var endDate = new Date(moment());
			var that = this;
			laygoon.widgets.matrixToolBar.ajaxRequest(startDate.getTime(), endDate.getTime(), function(data) {
				that.config.numOfColumn = data.numOfColumn;
				var timeSeries = data.timeSeries;		
				that.refreshChart(timeSeries);
			});
		}
	};	
	
	$.extend(matrixToolbar.prototype, laygoon.widgets.sliderBar.prototype);
	
	laygoon.widgets.matrixToolBar = {
			
			SELECTION_RANGE:{
				Current:"Current",
				Today:"Today",
				Yesterday:"Yesterday",
				ThisWeek:"This Week",
				LastWeek:"Last Week",
				Custom:"Custom"
			},
			
			TIME_RANGE:{
				Current: [moment().add('days', -1), moment()],
				Today: [moment().startOf('day'), moment()],
                Yesterday: [moment().add('days', -1).startOf('day'), moment().add('days', -1).endOf('day')],
                ThisWeek: [moment().startOf('week'), moment()],
                LastWeek: [moment().startOf('week').add('week',-1), moment()]
			},
			
			ajaxRequest: function(startTime, endTime, callBack) {
				if(startTime && endTime){
					var urlParam = {};
					urlParam.startTime = startTime;
					urlParam.endTime = endTime;
					urlParam.customerId = CUSTOMER_ID;
					
 					$.get(MATRIX_URL, $.param(urlParam, true) , function(data){
 						callBack(data);
					});
				}				
			},
			init: function(){
				$(document.body).addClass("matrix-tool-bar-page");
				var startTime;
				var endTime;
				var sRange = laygoon.helpers.getSession(laygoon.helpers.SESSIONKEY.RANGE);
				if(sRange && sRange!= this.SELECTION_RANGE.Current){
					if(sRange == this.SELECTION_RANGE.Today){
						startTime = this.TIME_RANGE.Today[0];
						endTime = this.TIME_RANGE.Today[1];
					}else if(sRange == this.SELECTION_RANGE.Yesterday){
						startTime = this.TIME_RANGE.Yesterday[0];
						endTime = this.TIME_RANGE.Yesterday[1];
					}else if(sRange == this.SELECTION_RANGE.ThisWeek){
						startTime = this.TIME_RANGE.ThisWeek[0];
						endTime = this.TIME_RANGE.ThisWeek[1];
					}else if(sRange == this.SELECTION_RANGE.LastWeek){
						startTime = this.TIME_RANGE.LastWeek[0];
						endTime = this.TIME_RANGE.LastWeek[1];
					}else{
						startTime = parseInt(laygoon.helpers.getSession(laygoon.helpers.SESSIONKEY.START_TIME));
						endTime = parseInt(laygoon.helpers.getSession(laygoon.helpers.SESSIONKEY.END_TIME));
					}
				}else{
					startTime = this.TIME_RANGE.Current[0];
					endTime = this.TIME_RANGE.Current[1];
				}
				
				var endDate = new Date(endTime);
				var startDate = new Date(startTime);
				startTime = new Date(startTime).getTime();
				endTime = new Date(endTime).getTime();
				var that = this;
				var CONTAINER_CSS = "matrix-toolbar",
					data = [],
					state = {sliderWidth: 900, sliderHeight:"130", marginTop:10, marginLeft:20, marginRight:150, marginBottom:30, sliderWidth:"1300"};			
					that.instance = {startTime: startTime, endTime: endTime};
					this.ajaxRequest(startTime, endTime, function(data) {
						var errorLables = [];
						for (var i = 0; i < data.yLabels.length; i++) {
							errorLables.push(Y_LABELS[data.yLabels[i]]);
						};
						state.numOfColumn = data.numOfColumn;
						var timeSeries = data.timeSeries;
						var mtb = new matrixToolbar("."+ CONTAINER_CSS +"", timeSeries, {
		                    startDate: startDate,
		                    endDate: endDate,
							margin: {top: state.marginTop, right: state.marginRight, bottom: state.marginBottom, left: state.marginLeft},
							numOfColumn: state.numOfColumn,
							numOfRow: errorLables.length,
							sliderHeight: state.sliderHeight,
							sliderWidth: state.sliderWidth,
							yLabels: errorLables
						}, function(start, end) {
							var state = {sliderWidth: 900, sliderHeight:"130", marginTop:10, marginLeft:20, marginRight:150, marginBottom:30, sliderWidth:"1300"};						
							that.ajaxRequest(start, end, function(data) {
								mtb.config.numOfColumn = data.numOfColumn;
								var timeSeries = data.timeSeries;		
								mtb.refreshChart(timeSeries);
							});
							
							var chartObj = this;
							if(chartObj.isRealTimeMode){
								chartObj.realTimeIntervalId = setInterval(function(){chartObj.bootRealTimeMode()}, chartObj.INTERVAL_MILLSECONDS);
							}							
						});	
						if(mtb.isRealTimeMode){
							mtb.realTimeIntervalId = setInterval(function(){mtb.bootRealTimeMode()}, mtb.INTERVAL_MILLSECONDS);
						}						
						that.instance = mtb;	
					});
			},
			on: function(ev, callback) {
				if (this.instance && this.instance.on) {
					this.instance.on("timeRangeChanged", callback);
				} else {
					// if ajax request is not ready, wait for another 100 millseconds
					var that = this;
					setTimeout(function() {that.on(ev, callback);}, 100);
				}				
			}
	};	
	
}(jQuery));

$(function() {
	laygoon.widgets.matrixToolBar.init();	
})