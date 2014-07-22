// namespace
laygoon = {}; 
laygoon.pages = {};
laygoon.widgets = {};
laygoon.common = {
	/*
	 * The width of right side bar.
	 */
	RIGHT_SIDE_BAR_WIDTH: 240,
	/*
	 * Attach events for dashboard page.
	 */
	attachEvents: function(){
		
		/*
		 * Attach events to resize the width of matrixbar when right siderbar show/hide
		 */
		$('.toggle-right-box .fa-bars').click(function(){
			laygoon.common.matrixContainerResize();
		});
		
		/*
		 * Resize the height of treeview and forcelayout as the maximum height of window's view.
		 */
		$(window).resize(function(){
			 laygoon.common.matrixContainerResize();
		});
	},
	/*
	 * Resize matrix container width if needed
	 */
	matrixContainerResize: function() {
		var totalWidth = $("#container").outerWidth(),
		brandWidth = $("#container .brand").outerWidth();
		//console.log([totalWidth, brandWidth]);
		$(".matrix-container").css("width", (totalWidth - brandWidth - 0 - 15) + "px");		
	},
	/*
	 * Expand sub menu in left side if current page is in sub menu
	 */
	initLeftMenu: function(){
		
		
		var currentPath = window.location.href.replace("http://", "");
		var currentMenu = currentPath.substring(currentPath.indexOf("/"));
		currentMenu = currentMenu == "/" ? "/dashboard" : currentMenu; // default page is dashboard
		$("#sidebar .leftside-navigation a[href='"+ currentMenu +"']").addClass("active-menu"); // Make current Menu selected.
		var parentMenu = $("#sidebar .leftside-navigation a[href='"+ currentMenu +"']").closest("li.sub-menu");
		if (parentMenu.length > 0) {//It's a sub menu
			parentMenu.find("a")[0].click();
		} else {
			// make "Monitor" open
			$("#sidebar .leftside-navigation .sub-menu.opened a").click();
		}
	}
};

/*
 * Useful helpers
 */
laygoon.helpers = {
		
		SESSIONKEY: {
			RANGE:"range",
			START_TIME:"startTime",
			END_TIME:"endTime"
		},
		  
		/**
		 * Get values of parameters on location
		 */
		getUrlParam: function (name) {
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg);  
			if (r!=null) return unescape(r[2]); return null;
		},

		setSession: function(key, value) {
			$.session.set(key, value);
		},
		
		getSession: function(key) {
			return $.session.get(key);
		},
		
		clearSession: function(){
			$.session.clear();
		},
		
		removeSession: function(key){
			$.session.remove(key);
		}
}


$(document).ready(function(){
	laygoon.common.matrixContainerResize();
	laygoon.common.attachEvents();
	setTimeout(laygoon.common.initLeftMenu, 0); //do after Accordion menu to collapse
});
