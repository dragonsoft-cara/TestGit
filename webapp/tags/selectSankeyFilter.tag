<div aria-hidden="true" aria-labelledby="customModalLabel" role="dialog" tabindex="-1" id="customModal" class="modal fade" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
				<h4 class="modal-title">Filter Sankey</h4>
			</div>
			<div class="modal-body">
				<form id="selectFilter" role="form" class="form-horizontal bucket-form">
					<div class="form-group">
	                   <div class="col-sm-9 icheck minimal">
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="DataCenterData"> DataCenter</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="ClusterData"> Cluster</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="HostData"> Host</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="VSwitchData"> DvSwitch</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="PortGroupData"> PortGroup</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="VAppData"> vApp</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="VMData"> VM</label>
							</div>
							<div class="checkbox single-row">
								<label> <input name="nodeType" type="checkbox" value="ClassifierData"> App</label>
							</div>
							<div id="filterTypesWarning" class="hidden alert alert-warning fade in">Please select at least two levels</div>
							<div class="single-row">
								<button aria-hidden="true" data-dismiss="modal" type="button" class="btn btn-default">Cancel</button>
								<button id="filterTypesSubmit" aria-hidden="true" data-dismiss="modal" type="button" class="btn btn-info">Submit</button>
							</div>
						</div>
					</div>
				</form> 
			</div>
		</div>
	</div>
</div>