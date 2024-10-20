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
<link
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
	rel="stylesheet">
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
					<sec:authorize access="hasRole('ROLE_USER')">
						<h5>Hi ${username}, welcome to Blackbox</h5>
					</sec:authorize>
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
				<div class="breadcrumb-title pe-3">Blackbox Report</div>
			</div>
			<!--end breadcrumb-->
			<!-- Table Starts -->
			<hr>
			<div class="card">
				<div class="card-body">
					<form id="dateRangeValidation" method="post"
						action="blackboxReport">
						<div class=" row mb-3">
							<label for="dateRangeInput" class="form-label">Date Range</label>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<input type="text" class="form-control date-range"
									id="dateRangeInput" name="dateRangeInput"
									placeholder="Choose date range" required="required">
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 text-end">
								<div class="">
									<button type="submit" class="btn btn-grd btn-danger px-5">Fetch</button>
								</div>
							</div>
						</div>
					</form>
					<div class="table-responsive">
						<table id="example2" class="table table-striped table-bordered">
							<thead>
								<tr class="text-nowrap">
									<th
										style="position: sticky; left: 0px; background-color: #fff; z-index: 2;">Date</th>
									<th>Territory</th>
									<th>Operator</th>
									<th>Agency</th>
									<th>Partner</th>
									<th>OfferId</th>
									<th>CampId</th>
									<th>Camp Name</th>
									<th>Pin Gen Req</th>
									<th>Pin Gen Scs</th>
									<th>Pin Verify Scs</th>
									<th>Sub Cr %</th>
									<th>Optimize %</th>
									<th>Cb Sent</th>
									<th>Cb Cr %</th>
									<th>Logs Link</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allReportDataList}" var="report">
									<tr class="text-nowrap">
										<td style="position: sticky; left: 0; background-color: #fff;">${report.transData}</td>
										<td>${report.territoryName}</td>
										<td>${report.operatorName}</td>
										<td>${report.agencyName}</td>
										<td>${report.partnernName}</td>
										<td>${report.offerid}</td>
										<td>${report.campaignId}</td>
										<td>${report.campaignName}</td>
										<td>${report.totalPinGen}</td>
										<td>${report.totalPinScs}</td>
										<td>${report.totalPinVerifyScs}</td>
										<td>${String.format("%.2f", (report.totalPinVerifyScs / report.totalPinScs) * 100)}</td>
										<td>${report.optimizePerc}</td>
										<td>${report.totalCBSent}</td>
										<td>${String.format("%.2f", (report.totalCBSent / report.totalPinScs) * 100)}</td>
										<td class="text-center"><a
											href="http://35.200.175.6/vaspay/getAffProData?campaignName=${report.offerid}_${report.campaignId}&addtime=${report.transData}"
											target="_blank" style="color: #5b6166;"> <i
												class="material-icons-outlined">dataset_linked</i>
										</a></td>
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
		<p class="mb-0">Copyright � 2024. All right reserved.</p>
	</footer>
	<!--end footer-->

	<!--plugins-->
	<script src="/blackbox/resources/assets/js/jquery.min.js"></script>
	<!--bootstrap js-->
	<script src="/blackbox/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script
		src="/blackbox/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/metismenu/metisMenu.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/jquery.validate.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/validation-script.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/peity/jquery.peity.min.js"></script>
	<script>
		$(".data-attributes span").peity("donut")
	</script>
	<script src="/blackbox/resources/assets/js/main.js"></script>
	<script src="/blackbox/resources/assets/js/blackboxReport.js"></script>
</body>

</html>