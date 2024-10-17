<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en" data-bs-theme="semi-dark">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Blackbox</title>
<!--favicon-->
<link rel="icon"
	href="/blackbox/resources/assets/images/favicon-32x32.jpg"
	type="image/jpg">
<!-- loader-->
<link href="/blackbox/resources/assets/css/pace.min.css"
	rel="stylesheet">
<script src="/blackbox/resources/assets/js/pace.min.js"></script>

<!--plugins-->
<link
	href="/blackbox/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/blackbox/resources/assets/plugins/metismenu/metisMenu.min.css">
<link rel="stylesheet" type="text/css"
	href="/blackbox/resources/assets/plugins/metismenu/mm-vertical.css">
<link rel="stylesheet" type="text/css"
	href="/blackbox/resources/assets/plugins/simplebar/css/simplebar.css">
<!--bootstrap css-->
<link href="/blackbox/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/blackbox/resources/assets/plugins/datatable/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons+Outlined"
	rel="stylesheet">
<!--main css-->
<link href="/blackbox/resources/assets/css/bootstrap-extended.css"
	rel="stylesheet">
<link href="/blackbox/resources/sass/main.css" rel="stylesheet">
<link href="/blackbox/resources/sass/semi-dark.css" rel="stylesheet">
<link href="/blackbox/resources/sass/responsive.css" rel="stylesheet">
<!-- notifications css -->
<link rel="stylesheet"
	href="/blackbox/resources/assets/plugins/notifications/css/lobibox.min.css">

</head>

<body>

	<!--start header-->
	<header class="top-header">
		<nav class="navbar navbar-expand align-items-center gap-4">
			<div class="btn-toggle">
				<a href="javascript:;"><i class="material-icons-outlined">menu</i></a>
			</div>
			<div class="search-bar flex-grow-1">
				<div class="position-relative">
					<div class="search-popup p-3">
						<div class="card rounded-4 overflow-hidden">
							<div class="card-header d-lg-none"></div>
							<div class="card-body search-content"></div>
						</div>
					</div>
				</div>
			</div>
			<ul class="navbar-nav gap-1 nav-right-links align-items-center">
				<li class="nav-item dropdown"></li>
				<li class="nav-item dropdown position-static  d-md-flex d-none">
				</li>
				<li class="nav-item dropdown"></li>
				<li class="nav-item dropdown">
					<div class="dropdown-menu dropdown-notify dropdown-menu-end shadow">
						<div class="notify-list"></div>
					</div>
				</li>
				<li class="nav-item dropdown"><a href="javascrpt:;"
					class="dropdown-toggle dropdown-toggle-nocaret"
					data-bs-toggle="dropdown"> <img
						src="/blackbox/resources/assets/images/user-1.jpg"
						class="rounded-circle p-1 border" width="45" height="45" alt="">
				</a>
					<div class="dropdown-menu dropdown-user dropdown-menu-end shadow">
						<a class="dropdown-item  gap-2 py-2" href="javascript:;">
							<div class="text-center">
								<img src="/blackbox/resources/assets/images/user-1.jpg"
									class="rounded-circle p-1 shadow mb-3" width="90" height="90"
									alt="">
								<h5 class="user-name mb-0 fw-bold">Hello, ${username}</h5>
							</div>
						</a>
						<hr class="dropdown-divider">
						<a class="dropdown-item d-flex align-items-center gap-2 py-2"
							href="logout"><i class="material-icons-outlined">power_settings_new</i>Logout</a>
					</div></li>
			</ul>

		</nav>
	</header>
	<!--end top header-->


	<!--start sidebar-->
	<aside class="sidebar-wrapper" data-simplebar="true">
		<div class="sidebar-header">
			<div class="logo-icon">
				<img src="/blackbox/resources/assets/images/logo-icon.png"
					class="logo-img" alt="">
			</div>
			<div class="logo-name flex-grow-1">
				<img class="mb-0"
					src="/blackbox/resources/assets/images/logo-icon2.png" alt=""
					style="width: 142px; height: 21px;">
			</div>
			<div class="sidebar-close">
				<span class="material-icons-outlined">close</span>
			</div>
		</div>
		<div class="sidebar-nav">
			<!--navigation-->
			<ul class="metismenu" id="sidenav">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="index">
							<div class="parent-icon">
								<i class="material-icons-outlined">home</i>
							</div>
							<div class="menu-title">Dashboard</div>
					</a></li>
				</sec:authorize>
				<li><a href="javascript:;" class="has-arrow">
						<div class="parent-icon">
							<i class="material-icons-outlined">monitor_heart</i>
						</div>
						<div class="menu-title">Campaign</div>
				</a>
					<ul>
						<li><a href="viewCampaign"><i
								class="material-icons-outlined">arrow_right</i>View Campaign</a></li>
						<li><a href="addCampaign"><i
								class="material-icons-outlined">arrow_right</i>Add Campaign</a></li>
					</ul></li>
				<li><a class="has-arrow" href="javascript:;">
						<div class="parent-icon">
							<i class="material-icons-outlined">recommend</i>
						</div>
						<div class="menu-title">Offer</div>
				</a>
					<ul>
						<li><a href="viewOffer"><i
								class="material-icons-outlined">arrow_right</i>View Offer</a></li>
						<li><a href="addOffer"><i class="material-icons-outlined">arrow_right</i>Add
								Offer</a></li>
					</ul></li>
				<li><a href="javascript:;" class="has-arrow">
						<div class="parent-icon">
							<i class="material-icons-outlined">groups</i>
						</div>
						<div class="menu-title">Agency</div>
				</a>
					<ul>
						<li><a href="viewAgency"><i
								class="material-icons-outlined">arrow_right</i>View Agency</a></li>
						<li><a href="#"><i class="material-icons-outlined">arrow_right</i>Add
								Agency</a></li>
					</ul></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a class="has-arrow" href="javascript:;">
							<div class="parent-icon">
								<i class="material-icons-outlined">link</i>
							</div>
							<div class="menu-title">Smart Link</div>
					</a>
						<ul>
							<li><a href="viewLink"><i
									class="material-icons-outlined">arrow_right</i>View SmartLink</a></li>
							<li><a href="addLink"><i class="material-icons-outlined">arrow_right</i>Add
									SmartLink</a></li>
						</ul></li>
				</sec:authorize>
				<li><a href="blackboxReport">
						<div class="parent-icon">
							<i class="material-icons-outlined">list_alt</i>
						</div>
						<div class="menu-title">Blackbox Report</div>
				</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="hardMsisdn">
							<div class="parent-icon">
								<i class="material-icons-outlined">numbers</i>
							</div>
							<div class="menu-title">HardCoded MSISDN</div>
					</a></li>
				</sec:authorize>
				<li><a href="billingReport">
						<div class="parent-icon">
							<i class="material-icons-outlined">receipt_long</i>
						</div>
						<div class="menu-title">Billing Report</div>
				</a></li>
			</ul>
			<!--end navigation-->
		</div>
	</aside>
	<!--end sidebar-->

	<!--start main wrapper-->
	<main class="main-wrapper">
		<div class="main-content">
			<!--breadcrumb-->
			<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
				<div class="breadcrumb-title pe-3">Campaign</div>
				<div class="ps-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 p-0">
							<li class="breadcrumb-item active" aria-current="page">View
								Campaigns</li>
						</ol>
					</nav>
				</div>
			</div>
			<!--end breadcrumb-->

			<!-- Table Starts -->
			<hr>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table id="example2" class="table table-bordered">
							<thead>
								<tr class="text-nowrap">
									<th>ID</th>
									<th>Service Name</th>
									<th>Territory</th>
									<th>Operator</th>
									<th>Partner</th>
									<th>Price</th>
									<th>Validity</th>
									<th>Edit</th>
									<th>Test</th>
									<th>Created By</th>
									<th>API Developed By</th>
									<th>Edited By</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allCampaignDataList}" var="campaign">
									<tr class="text-nowrap">
										<td>${campaign.id}</td>
										<td>${campaign.servicename}</td>
										<td>${campaign.territoryName}</td>
										<td>${campaign.operatorName}</td>
										<td>${campaign.partnerName}</td>
										<td class="text-end">${campaign.price}</td>
										<td class="text-end">${campaign.chargingmode}</td>
										<td class="text-center">
											<form action="editCampaign" method="post">
												<button type="submit" class="transparent-button"
													name="campaignId" value="${campaign.id}">
													<i class="material-icons-outlined">edit_note</i>
												</button>
											</form>
										</td>
										<td class="text-center">
											<button type="submit" class="transparent-button"
												data-bs-toggle="modal" data-bs-target="#responseModal"
												onclick="loadCampaignData(${campaign.id})">
												<i class="material-icons-outlined">checklist_rtl</i>
											</button>
										</td>
										<td>${campaign.createdBy}</td>
										<td>${campaign.apiDevelopedBy}</td>
										<td>${campaign.editedBy}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Ends -->
		</div>
	</main>
	<!--end main wrapper-->


	<!--start overlay-->
	<div class="overlay btn-toggle"></div>
	<!--end overlay-->


	<!--start footer-->
	<footer class="page-footer">
		<p class="mb-0">Copyright © 2024. All right reserved.</p>
	</footer>
	<!--end footer-->

	<!-- Modal Starts-->
	<div class="modal fade" id="responseModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="responseModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-bottom-0 py-2 bg-dark">
					<h5 class="modal-title" style="color: #FFF;">Test URLs</h5>
					<a href="javascript:;" class="primaery-menu-close"
						data-bs-dismiss="modal"> <i class="material-icons-outlined">close</i>
					</a>
				</div>
				<div class="modal-body">
					<div class="form-body">
						<form class="row g-3" id="urlsForm">
							<div class="col-md-6">
								<label for="msisdn" class="form-label">Mobile Number</label> <input
									type="text" class="form-control" id="msisdn"
									placeholder="Enter Mobile Number" name="msisdn"
									required="required">
							</div>
							<div class="col-md-6">
								<label for="pin" class="form-label">PIN</label> <input
									type="text" class="form-control" id="pin"
									placeholder="Enter PIN" name="pin" required="required">
							</div>
							<div class="col-md-12 mb-3">
								<div class="d-md-flex d-grid align-items-center gap-3">
									<button type="submit" class="btn btn-dark px-4">Generate
										Urls</button>
								</div>
							</div>
						</form>
						<div id="urls" style="display: none;">
							<div class="input-group mb-3">
								<span class="text-center input-group-text">Pin Gen Url</span> <input
									type="text" id="pinGenUrl" class="form-control" readonly>
								<button id="testButton1" class="btn btn-primary"
									style="width: 60px;">Test</button>
							</div>
							<div id="alert-container1"></div>
							<div class="input-group mb-3">
								<span class="text-center input-group-text">Pin Valid Url</span>
								<input type="text" id="pinValidUrl" class="form-control"
									readonly>
								<button id="testButton2" class="btn btn-primary"
									style="width: 60px;">Test</button>
							</div>
							<div id="alert-container2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Ends -->

	<!--plugins-->
	<script src="/blackbox/resources/assets/js/jquery.min.js"></script>
	<!--bootstrap js-->
	<script src="/blackbox/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script
		src="/blackbox/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/metismenu/metisMenu.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/jquery.validate.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/validation-script.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/peity/jquery.peity.min.js"></script>
	<script>
		$(".data-attributes span").peity("donut")
	</script>
	<!--notification js -->
	<script
		src="/blackbox/resources/assets/plugins/notifications/js/lobibox.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/notifications/js/notifications.min.js"></script>
	<script src="/blackbox/resources/assets/js/main.js"></script>
	<script src="/blackbox/resources/assets/js/viewCampaign.js"></script>
	<script>
	$(document).ready(function() {
	var successMessage = "${successMessage}";
	var errorMessage = "${errorMessage}";
	if (successMessage) {
		Lobibox.notify('success', {
			pauseDelayOnHover: true,
			continueDelayOnInactiveTab: false,
			position: 'center top',
			size: 'mini',
			msg: successMessage,
		});
	}
	if (errorMessage) {
		Lobibox.notify('error', {
			pauseDelayOnHover: true,
			continueDelayOnInactiveTab: false,
			position: 'center top',
			size: 'mini',
			msg: errorMessage,
		});
	}
	});
	</script>
</body>

</html>