<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="widget" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="${path}/static/css/dashboard.css" /> 
<!--The dependency that charts need  -->
<link rel="stylesheet" type="text/css" href="${path}/static/bucketAdmin/js/morris-chart/morris.css" />
<widget:header/>  
<!--Widget used in this page-->

<widget:leftSiderBar/>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start TODO:-->

		<div class="dashboard-main">
	        <div class="row">
				<jsp:include page="dataCenter.jsp" />
	            
	            <div class="col-lg-4">
	               <section class="panel">
	               	 	<header class="panel-heading">Application Performance</header>
	                    <div class="panel-body">
					   		<div id="app-color-wheel" style="height: 280px;position: relative;">
					
							</div> 
					   		<ul class="arrow">
						   		<li class="pull-right visit-chart-title">
						   			<i class="fa fa-arrow-up">4%</i>
					   			</li>
					   		</ul>
	                    </div>
	                </section>
	            </div>
           		
           		<jsp:include page="worstPerformers.jsp" />
	            
	        </div>
			 
			<div class="row">
			  <div class="col-lg-12">
			  	<header class="panel-heading">Infrastructure Health</header>
			  </div>
			 </div>
	        
	        <div class="row">
	            <div class="col-lg-3">
	                
	               
	                <section class="panel">
	                	<header class="panel-heading">Network Performance</header>
	                    <div class="panel-body">
					   		<div id="net-color-wheel" style="height: 280px;position: relative;">
							</div> 
					   		<ul class="arrow">
						   		<li class="pull-right visit-chart-title">
						   			<i class="fa fa-arrow-up">5%</i>
						   		</li>
					   		</ul>
	                    </div>
	                </section>
	            </div>
	            <div class="col-lg-3">
	                <section class="panel">
	                	<header class="panel-heading">Storage Performance</header>
	                    <div class="panel-body">
	                    	<div id="stor-color-wheel" style="height: 280px;position: relative;">
							</div> 
					   		<ul class="arrow">
						   		<li class="pull-right visit-chart-title">
						   			<i class="fa fa-arrow-up">5%</i>
						   		</li>
					   		</ul>
	                    </div>
	                </section>
	            </div>
	            <div class="col-lg-3">
	                <section class="panel">
	              
	                	<header class="panel-heading">CPU Performance</header>
	                    <div class="panel-body">
	                           <div id="cpu-color-wheel" style="height: 280px;position: relative; ">
							   </div> 
					   		<ul class="arrow">
						   		<li class="pull-right visit-chart-title">
						   			<i class="fa fa-arrow-up">5%</i>
						   		</li>
					   		</ul>
	                    </div>
	                </section>
	            </div>    
	            <div class="col-lg-3">
	                <section class="panel">
	                	<header class="panel-heading">Memory Performance</header>
	                    <div class="panel-body">
                                <div id="mem-color-wheel" style="height: 280px; position: relative;">
							</div> 
					   		<ul class="arrow">
						   		<li class="pull-right visit-chart-title">
						   			<i class="fa fa-arrow-up">5%</i>
						   		</li>
					   		</ul>
	                    </div>
	                </section>
	            </div>  	                    
	        </div>	        
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<widget:rightSiderBar/>

<widget:footer/>
<script type="text/javascript" src="${path}/static/js/appTopology/appTopology.js"></script>
<!--widgets on this page-->
<script type="text/javascript" src="${path}/static/js/widgets/ToolTips.js"></script>
<!-- Staict charts -->
<!-- script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/morris.min.js"></script>
<script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/raphael-min.js"></script>
<script type="text/javascript" src="${path}/static/js/dashboard/worstPerformers.js"></script -->

<!-- Matrix tool bar -->
<script type="text/javascript" src="${path}/static/js/matrixToolBar.js"></script>
<script type="text/javascript" src="${path}/static/js/sunburst/sunburst.js"></script>
<script type="text/javascript" src="${path}/static/js/d3/innersvg.js"></script>
<script type="text/javascript" src="${path}/static/js/dashboard/total.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/static/css/menu_options.css" />
