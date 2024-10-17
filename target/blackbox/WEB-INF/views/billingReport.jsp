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
<link
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css">
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
				<div class="breadcrumb-title pe-3">Billing Report</div>
				<div class="ps-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 p-0">
							<li class="breadcrumb-item active" aria-current="page"><c:choose>
									<c:when test="${empty to}">Today's Billing Report</c:when>
									<c:otherwise>Custom Billing Report</c:otherwise>
								</c:choose></li>
						</ol>
					</nav>
				</div>
			</div>
			<!--end breadcrumb-->

			<!-- Table Starts -->
			<hr>
			<div class="card">
				<div class="card-body">
					<form id="billingValidation" method="post" action="billingReport">
						<div class="row mb-3">
							<label for="territory" class="col-sm-2 col-form-label">Select
								Territory</label>
							<div class="col-sm-4">
								<select class="form-select" id="territory" name="territory"
									data-placeholder="Select Territory">
									<option value="">Select Territory</option>
									<c:forEach items="${allTerritoryDataList}" var="territory">
										<option value="${territory.id}"
											data-name="${territory.territoryName}">${territory.id}
											- ${territory.territoryName}</option>
									</c:forEach>
								</select>
							</div>
							<label for="operator" class="col-sm-2 col-form-label">Select
								Operator</label>
							<div class="col-sm-4">
								<select class="form-select" id="operator" name="operator"
									data-placeholder="Select Operator">
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label for="serviceid" class="col-sm-2 col-form-label">Select
								Service ID</label>
							<div class="col-sm-4">
								<select class="form-select" id="serviceid" name="serviceid"
									data-placeholder="Select Service ID">
								</select>
							</div>
							<label for="dateRangeInput" class="col-sm-2 form-label">Date
								Range</label>
							<div class="col-sm-4">
								<input type="text" class="form-control date-range"
									id="dateRangeInput" name="dateRangeInput"
									placeholder="Choose date range" required="required">
							</div>
						</div>
						<div class=" row mb-3">
							<div class="col-lg-12 col-md-12 col-sm-12 text-end">
								<div class="">
									<button type="submit" class="btn btn-grd btn-danger px-5">Fetch</button>
								</div>
							</div>
						</div>
					</form>
					<div class="table-responsive">
						<table id="example2" class="table table-bordered">
							<thead>
								<tr class="text-nowrap">
									<c:choose>
										<c:when test="${empty to}">
											<th>Service Name</th>
											<th>Territory Operator</th>
										</c:when>
										<c:otherwise>
											<th>Date</th>
										</c:otherwise>
									</c:choose>
									<th>Total Act</th>
									<th>Total Chg Act</th>
									<th>Total Park Act</th>
									<th>Total Renew</th>
									<th>Total Chg</th>
									<th>Dct Count</th>
									<th>Total Base</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allBillingDataList}" var="item">
									<tr class="text-nowrap">
										<c:choose>
											<c:when test="${empty to}">
												<td>${item.servicename}</td>
												<td>${item.territ_oper}</td>
											</c:when>
											<c:otherwise>
												<td>${item.transtime}</td>
											</c:otherwise>
										</c:choose>
										<td>${item.totAct}</td>
										<td>${item.totChgActCnt}</td>
										<td>${item.totparkedCount}</td>
										<td>${item.totalRenew}</td>
										<td>${item.totalcharged}</td>
										<td>${item.dctCount}</td>
										<td>${item.totalbase}</td>
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

	<!--plugins-->
	<script src="/blackbox/resources/assets/js/jquery.min.js"></script>
	<!--bootstrap js-->
	<script src="/blackbox/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script
		src="/blackbox/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script
		src="/blackbox/resources/assets/plugins/select2/js/select2.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/select2/js/select2-custom.js"></script>
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
		src="/blackbox/resources/assets/plugins/peity/jquery.peity.min.js"></script>
	<script>
		$(".data-attributes span").peity("donut")
	</script>
	<script src="/blackbox/resources/assets/js/main.js"></script>
	<script src="/blackbox/resources/assets/js/billingReport.js"></script>
</body>

</html>