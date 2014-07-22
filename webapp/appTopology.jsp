<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="widget" tagdir="/WEB-INF/tags" %>
<widget:header/> 
<link rel="stylesheet" href="${path}/static/css/appTopology.css" /> 
<!--Widget used in this page-->
<!--The dependency that charts need  -->
<link rel="stylesheet" type="text/css" href="${path}/static/bucketAdmin/js/morris-chart/morris.css" />

<!-- load searchbox CSS file -->
<link rel="stylesheet" href="${path}/static/css/searchBox.css" />
<!-- load the treeview CSS file -->
<link rel="stylesheet" href="${path}/static/js/vakata-jstree/dist/themes/default/style.min.css" />
<link rel="stylesheet" href="${path}/static/css/treeView.css" />
<!-- load the topology CSS file --> 
<link rel="stylesheet" href="${path}/static/css/topology.css" /> 
<widget:leftSiderBar/> 
    <!--main content start-->
    <section id="main-content" class="app-topology">
        <section class="wrapper">
        <!-- page start TODO:-->
        <div class="row">
            <div class="col-lg-6 force-layout">
                <section class="panel">
                    <div class="panel-body">
                    	<div id="force-div">
			                <div class="tree-view-search-box">
								<widget:searchBox></widget:searchBox>
			                </div>                    		
                    	</div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
						<header class="panel-heading">Traffic Volume</header>
						<widget:areaChart chartName="trafficVolume"/>                    
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
   						<header class="panel-heading">TCP Fatal Retry</header>
                   		<widget:barChart chartName="tcpFatalRetry"/>     
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
						<header class="panel-heading">Server/App Response</header>
						<widget:areaChart chartName="serverAppResponse"/>                    
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
   						<header class="panel-heading">Net Round Trip Time</header>
                   		<widget:areaChart chartName="netRoundTripTime"/>     
                    </div>
                </section>
            </div>
        </div> 
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
						<header class="panel-heading">Alarm</header>
						<widget:barChart chartName="alarm"/>                    
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
   						<header class="panel-heading">TCP Zero Window</header>
                   		<widget:barChart chartName="tcpZeroWindow"/>     
                    </div>
                </section>
            </div>
        </div> 
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
						<header class="panel-heading">Packet Loss</header>
						<widget:barChart chartName="packetLoss"/>                    
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
   						<header class="panel-heading">TCP Reset</header>
                   		<widget:barChart chartName="tcpReset"/>     
                    </div>
                </section>
            </div>
        </div>                      
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<widget:rightSiderBar/> 

<widget:footer/>

<!--widgets on this page-->
<!-- tooltips  -->
<script type="text/javascript" src="${path}/static/js/widgets/ToolTips.js"></script>
<script type="text/javascript" src="${path}/static/js/widgets/searchBox.js"></script>
<!-- Matrix tool bar -->
<script type="text/javascript" src="${path}/static/js/matrixToolBar.js"></script>
<!-- force layout -->
<script type="text/javascript" src="${path}/static/js/appTopology/topology_new.js"></script>
<!-- tree view -->
<script type="text/javascript" src="${path}/static/js/vakata-jstree/dist/jstree.js"></script>
<script src="${path}/static/js/appTopology/treeView.js"></script>

<!-- Staict charts -->
<script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/morris.min.js"></script>
<script type="text/javascript" src="${path}/static/bucketAdmin/js/morris-chart/raphael-min.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/trafficVolume.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/tcpFatalRetry.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/serverAppResponse.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/netRoundTripTime.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/alarm.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/tcpZeroWindow.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/packetLoss.js"></script>
<script type="text/javascript" src="${path}/static/js/appTopology/tcpReset.js"></script>

<!-- Page realted js -->
<script type="text/javascript" src="${path}/static/js/appTopology/appTopology.js"></script>

