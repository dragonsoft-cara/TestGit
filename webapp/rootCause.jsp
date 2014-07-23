<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="widget" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/rootCause" %>
<%@ taglib prefix="tpl" tagdir="/WEB-INF/tags/tpls" %>
<widget:header/> 
<link rel="stylesheet" type="text/css" href="${path}/static/bucketAdmin/js/morris-chart/morris.css" />
<link rel="stylesheet" href="${path}/static/css/rootCause.css" /> 
<link rel="stylesheet" href="${path}/static/css/lineChart.css" />
<link rel="stylesheet" href="${path}/static/css/jquery.dataTables.css" />
<!-- Get Application Topology page parameters -->
Modified 2nd
<input type="hidden" id="nodeText" value="<%=request.getParameter("nodeName") %>" />
<input type="hidden" id="clusterName" value="<%=request.getParameter("clusterName") %>" />
<input type="hidden" id="hostname" value="<%=request.getParameter("hostname") %>" />
<input type="hidden" id="classifier" value="<%=request.getParameter("classifier") %>" /> 
<!--Widget used in this page-->

<widget:leftSiderBar/> 
    <!--main content start-->
    <section id="main-content" class="root-cause">
        <section class="wrapper">
        <!-- page start TODO:-->
			<div class="row top-container">
				<div class="">
					<div class="row">
						<div class="col-md-12">
							<div class="left-right-arrow" id="arrowText">Application response Time for FTP</div>					
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="btn btn-host">
								<div class="btn btn-vm" id="btnText">
									
								</div>
								<div class="host-text" id="hostText">
									
								</div>
							</div>
						</div>
		<div class="col-md-8 app-response-time-chart  APP-Res-FTP-Chart">
							<div id="AppResFTP"></div>
						</div>				
					</div>				
				</div>
			</div>
			<div class="row tab-page">			
				<div class="col-md-12">
					<section class="panel">
		                <header class="panel-heading tab-bg-dark-navy-blue ">
		                    <ul class="nav nav-tabs" id="myTab">
							  <li><a href="#rootCause" tabName="rootCause">Root Cause</a></li>
							  <li><a href="#compute" tabName="compute">Compute</a></li>
							  <li><a href="#storage" tabName="storage">Storage</a></li>
							  <li><a href="#network" tabName="network">Network</a></li>
		                    </ul>
		                </header>
		                <div class="panel-body" >
		                    
		                    <div class="tab-content" id="TabContent">
		                    
							  <div class="tab-pane fade" id="rootCause"><tab:rootCauseSummary></tab:rootCauseSummary></div>
							  <div class="tab-pane fade" id="compute"><tab:compute></tab:compute></div>
							  <div class="tab-pane fade" id="storage"><tab:storage></tab:storage></div>
							  <div class="tab-pane fade" id="network"><tab:network></tab:network></div>
		                    </div>
		                </div>
		            </section>
				</div>
				<div class="col-md-12 transaction-table">
					<section class="panel">
	                    <header class="panel-heading">
	                        Worst 3 Transaction
	                    </header>
	                    <div class="panel-body">
                             
	                    </div>
	                </section>
				</div>
			</div>       
		</section>
    </section>
    <!--main content end-->
<widget:rightSiderBar/> 

<widget:footer/>
<script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/morris.min.js"></script>
<script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/raphael-min.js"></script>
<script type="text/javascript" src="${path}/static/js/handlebars/handlebars.debug.js"></script>
<!-- Matrix tool bar -->
<script type="text/javascript" src="${path}/static/js/matrixToolBar.js"></script>
<!-- lineChart js -->
<script type="text/javascript" src="${path}/static/js/widgets/lineChart-morris.js"></script>
<!-- templates used in this page -->
<script id="sankey-table-view" type="text/x-handlebars-template">
	<tpl:worstTransactionTable></tpl:worstTransactionTable>  
</script>
<script type="text/javascript" src="${path}/static/js/widgets/jquery.dataTables.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/rootCause-morris.js"></script>
