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
				<div class="breadcrumb-title pe-3">Offer</div>
				<div class="ps-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 p-0">
							<li class="breadcrumb-item active" aria-current="page">View
								Offers</li>
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
									<th>Offer Name</th>
									<th>Territory</th>
									<th>Operator</th>
									<th>Agency</th>
									<th>Default Campaign</th>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<th>Switch Flag</th>
										<th>Switching</th>
									</sec:authorize>
									<th>Edit</th>
									<th>Doc Link</th>
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<th>Landing Page Url</th>
									</sec:authorize>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allOfferDataList}" var="offer">
									<tr class="text-nowrap"
										data-switch-flag="${offer.switchingCampFlag}"
										data-doc-link="${offer.id}">
										<td>${offer.id}</td>
										<td>${offer.offerName}</td>
										<td>${offer.territoryName}</td>
										<td>${offer.operatorName}</td>
										<td>${offer.agencyData}</td>
										<td>${offer.defaultCampaignId}</td>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<td class="text-center align-middle"><div
													class="form-check form-switch form-check-danger d-flex justify-content-center align-items-center">
													<c:choose>
														<c:when
															test="${offer.switchingCampFlag == null || empty offer.switchingCampGroupId}">
															<input class="form-check-input toggle-switch"
																type="checkbox" role="switch" disabled="disabled"
																data-offer-id="${offer.id}">
														</c:when>
														<c:otherwise>
															<input class="form-check-input toggle-switch"
																type="checkbox" role="switch"
																data-offer-id="${offer.id}"
																<c:if test="${offer.switchingCampFlag == 'Y'}">checked</c:if>>
														</c:otherwise>
													</c:choose>

												</div></td>
											<td class="text-center"><c:choose>
													<c:when test="${not empty offer.switchingCampGroupId}">
														<form action="editSwitching" method="post">
															<button type="submit" class="transparent-button"
																name="offerId1" value="${offer.id}"
																<sec:authorize access="hasRole('ROLE_USER')">disabled</sec:authorize>>
																<i class="material-icons-outlined">visibility</i>
															</button>
														</form>
													</c:when>

													<c:otherwise>
														<form action="addSwitching" method="POST">
															<input type="hidden" name="offerId" value="${offer.id}">
															<button type="submit" class="transparent-button"
																<sec:authorize access="hasRole('ROLE_USER')">disabled</sec:authorize>>
																<i class="material-icons-outlined">note_add</i>
															</button>
														</form>
													</c:otherwise>
												</c:choose></td>
										</sec:authorize>
										<td class="text-center"><form action="editOffer"
												method="POST">
												<button type="submit" class="transparent-button"
													name="offerId" value="${offer.id}">
													<i class="material-icons-outlined">edit_note</i>
												</button>
											</form></td>
										<td class="text-center">
											<form action="offerDetails" method="GET">
												<button type="submit" class="transparent-button"
													name="offerDetails" value="${offer.id}">
													<i class="material-icons-outlined">description</i>
												</button>
											</form>
										</td>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<td class="text-center">
												<button type="submit" class="transparent-button"
													data-bs-toggle="modal" data-bs-target="#landingModal"
													data-id="${offer.id}">
													<i class="material-icons-outlined">send</i>
												</button>
											</td>
										</sec:authorize>
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

	<!-- Landing Modal Starts -->
	<div class="modal fade" id="landingModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="landingModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-bottom-0 py-2 bg-dark">
					<h5 class="modal-title" style="color: #FFF;">Generate Landing
						URL</h5>
					<a href="javascript:;" class="primaery-menu-close"
						data-bs-dismiss="modal"> <i class="material-icons-outlined">close</i>
					</a>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="domain" class="form-label">Select Domain</label>
						<div class="row">
							<div class="col">
								<select id="domain" class="form-control" name="domain"
									required="required">
									<option value="" selected disabled>Select Domain</option>
									<option value="promolink">Promo Link</option>
								</select>
							</div>
						</div>
					</div>
					<div class="mb-3" id="themeDiv">
						<label for="theme" class="form-label">Select Theme</label>
						<div class="row">
							<div class="col">
								<select id="theme" class="form-control" name="theme"
									required="required">
									<option value="" selected disabled>Select Theme</option>
									<option value="starLight">Star Light</option>
									<option value="light2">Light 2</option>
									<option value="bird">Bird</option>
									<option value="dark2">Dark 2</option>
									<option value="dark3">Dark 3</option>
									<option value="bright">Bright</option>
								</select>
							</div>
						</div>
					</div>
					<div id="linkDiv">
						<div class="input-group mb-3">
							<input type="text" id="linkInput" class="form-control" value=""
								readonly>
							<button id="copyButton" class="btn btn-primary"
								onclick="copyLink()">Copy</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Landing Modal Ends -->

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
	<script src="/blackbox/resources/assets/js/viewOffer.js"></script>
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