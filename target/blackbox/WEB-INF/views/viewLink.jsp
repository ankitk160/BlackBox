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
				<li><a class="has-arrow" href="javascript:;">
						<div class="parent-icon">
							<i class="material-icons-outlined">link</i>
						</div>
						<div class="menu-title">Smart Link</div>
				</a>
					<ul>
						<li><a href="viewLink"><i class="material-icons-outlined">arrow_right</i>View
								SmartLink</a></li>
						<li><a href="addLink"><i class="material-icons-outlined">arrow_right</i>Add
								SmartLink</a></li>
					</ul></li>
				<li><a href="blackboxReport">
						<div class="parent-icon">
							<i class="material-icons-outlined">list_alt</i>
						</div>
						<div class="menu-title">Blackbox Report</div>
				</a></li>
				<li><a href="hardMsisdn">
						<div class="parent-icon">
							<i class="material-icons-outlined">numbers</i>
						</div>
						<div class="menu-title">HardCoded MSISDN</div>
				</a></li>
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
				<div class="breadcrumb-title pe-3">Smart Link</div>
				<div class="ps-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 p-0">
							<li class="breadcrumb-item active" aria-current="page">View
								Smart Links</li>
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
									<th>Name</th>
									<th>Territory</th>
									<th>Agency</th>
									<th>Operators</th>
									<th class="text-center">Copy</th>
									<th class="text-center">Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allLinkDataList}" var="link">
									<tr>
										<td class="text-nowrap">${link.name}</td>
										<td>${link.territoryName}</td>
										<td>${link.agency}</td>
										<td><c:if test="${not empty link.operatorName1}">${link.operatorName1}</c:if>
											<c:if test="${not empty link.operatorName2}">, ${link.operatorName2}</c:if>
											<c:if test="${not empty link.operatorName3}">, ${link.operatorName3}</c:if>
											<c:if test="${not empty link.operatorName4}">, ${link.operatorName4}</c:if></td>
										<td class="text-center"><button
												class="transparent-button"
												onclick="copyToClipboard(this, ${link.id})">
												<i class="material-icons-outlined">link</i>
											</button></td>
										<td class="text-center"><form action="editLink"
												method="post">
												<button type="submit" class="transparent-button"
													name="linkId" value="${link.id}">
													<i class="material-icons-outlined">edit_note</i>
												</button>
											</form></td>
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
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
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
	<script src="/blackbox/resources/assets/js/viewLink.js"></script>
	<script>
		$(document).ready(function() {
			var successMessage = "${successMessage}";
			var errorMessage = "${errorMessage}";
			if (successMessage) {
				Lobibox.notify('success', {
					pauseDelayOnHover : true,
					continueDelayOnInactiveTab : false,
					position : 'center top',
					size : 'mini',
					msg : successMessage,
				});
			}
			if (errorMessage) {
				Lobibox.notify('error', {
					pauseDelayOnHover : true,
					continueDelayOnInactiveTab : false,
					position : 'center top',
					size : 'mini',
					msg : errorMessage,
				});
			}
		});
	</script>
</body>

</html>