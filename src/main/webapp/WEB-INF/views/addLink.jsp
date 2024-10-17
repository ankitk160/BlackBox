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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css">
<!--bootstrap css-->
<link href="/blackbox/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
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
							<li class="breadcrumb-item active" aria-current="page">Add
								Smart Link</li>
						</ol>
					</nav>
				</div>
			</div>
			<!--end breadcrumb-->

			<hr>
			<!-- Form Starts -->
			<div class="row">
				<div class="col-lg-12 mx-auto">
					<div class="card">
						<div class="card-body p-4">
							<form id="addLinkValidation" action="saveSmartLink" method="post">
								<div class="row mb-3">
									<label for="name" class="col-sm-3 col-form-label">Link
										Name</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Enter Link Name">
									</div>
								</div>
								<div class="row mb-3">
									<label for="territory" class="col-sm-3 col-form-label">Select
										Territory</label>
									<div class="col-sm-9">
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
								</div>
								<div class="row mb-3" id="agency-div" style="display: none">
									<label for="agency" class="col-sm-3 col-form-label">Select
										Agency</label>
									<div class="col-sm-9">
										<select class="form-select" id="agency" name="agency"
											data-placeholder="Select Agency">
											<option selected disabled value="">Select Agency</option>
											<c:forEach items="${allAgencyDataList}" var="agency">
												<option value="${agency.id}"
													data-name="${agency.agencyName}">${agency.id}-
													${agency.agencyName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div id="operatorDiv"></div>
								<div class="row mb-3">
									<label for="lang" class="col-sm-3 col-form-label">Select
										Language</label>
									<div class="col-sm-9">
										<select class="form-select" id="lang" name="lang"
											data-placeholder="Select Language">
											<option selected disabled value="">Select Language</option>
											<option value="en">English</option>
											<option value="fr">French</option>
											<option value="ar">Arabic</option>
										</select>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-3 col-form-label"></label>
									<div class="col-sm-9">
										<div class="d-md-flex d-grid align-items-center gap-3">
											<button type="submit" class="btn btn-primary px-4">Submit</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--end row-->
		</div>
	</main>
	<!--end main wrapper-->
	<!-- Modal -->
	<div class="modal fade" id="responseModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="responseModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="responseModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="responseMessage"></p>
					<c:if test="${result == 'success'}">
						<div class="input-group mb-3">
							<span class="text-center input-group-text"><i
								class="material-icons-outlined">link</i></span> <input type="text"
								id="linkInput" class="form-control" value="${link}" readonly>
							<button id="copyButton" class="btn btn-primary"
								onclick="copyLink()">Copy</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- Hidden fields to store messages -->
	<c:if test="${not empty result}">
		<input type="hidden" id="result" value="${result}" />
		<c:if test="${result == 'success'}">
			<input type="hidden" id="successMessage" value="${successMessage}" />
			<input type="hidden" id="link" value="${link}" />
		</c:if>
		<c:if test="${result == 'error'}">
			<input type="hidden" id="errorMessage" value="${errorMessage}" />
		</c:if>
	</c:if>

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
		src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/select2/js/select2-custom.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/jquery.validate.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/validation-script.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script src="/blackbox/resources/assets/js/main.js"></script>
	<script src="/blackbox/resources/assets/js/addLink.js"></script>
	<script type="text/javascript">
		/* Script to show agency when territory changes */
		$('#territory').change(
				function() {
					var selectedTerritory = $(this).val();

					if (selectedTerritory
							&& selectedTerritory !== '-Select Territory-') {
						$('#agency-div').show();
					} else {
						$('#agency-div').hide();
					}
				});
	</script>
	<script type="text/javascript">
		$('#agency').on('change', function() {
			loadOperatorsAndOffers();
		});
	</script>
</body>

</html>