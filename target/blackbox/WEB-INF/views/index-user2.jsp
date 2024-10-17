<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en" data-bs-theme="semi-dark">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Platform X</title>
<!--favicon-->
<link rel="icon"
	href="/platformX/resources/assets/images/favicon-32x32.jpg"
	type="image/jpg">
<!-- loader-->
<link href="/platformX/resources/assets/css/pace.min.css"
	rel="stylesheet">
<script src="/platformX/resources/assets/js/pace.min.js"></script>

<!--plugins-->
<link
	href="/platformX/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/platformX/resources/assets/plugins/metismenu/metisMenu.min.css">
<link rel="stylesheet" type="text/css"
	href="/platformX/resources/assets/plugins/metismenu/mm-vertical.css">
<link rel="stylesheet" type="text/css"
	href="/platformX/resources/assets/plugins/simplebar/css/simplebar.css">
<!--bootstrap css-->
<link href="/platformX/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons+Outlined"
	rel="stylesheet">
<!--main css-->
<link href="/platformX/resources/assets/css/bootstrap-extended.css"
	rel="stylesheet">
<link href="/platformX/resources/sass/main.css" rel="stylesheet">
<link href="/platformX/resources/sass/semi-dark.css" rel="stylesheet">
<link href="/platformX/resources/sass/responsive.css" rel="stylesheet">
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
					<h5>Hi ${username}, welcome to PlatformX</h5>
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
						src="/platformX/resources/assets/images/user-1.jpg"
						class="rounded-circle p-1 border" width="45" height="45" alt="">
				</a>
					<div class="dropdown-menu dropdown-user dropdown-menu-end shadow">
						<a class="dropdown-item  gap-2 py-2" href="javascript:;">
							<div class="text-center">
								<img src="/platformX/resources/assets/images/user-1.jpg"
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
				<img src="/platformX/resources/assets/images/logo-icon.png"
					class="logo-img" alt="">
			</div>
			<div class="logo-name flex-grow-1">
				<img class="mb-0"
					src="/platformX/resources/assets/images/logo-icon2.png" alt=""
					style="width: 142px; height: 21px;">
			</div>
			<div class="sidebar-close">
				<span class="material-icons-outlined">close</span>
			</div>
		</div>
		<div class="sidebar-nav">
			<!--navigation-->
			<ul class="metismenu" id="sidenav">
				<li><a href="index-user2">
						<div class="parent-icon">
							<i class="material-icons-outlined">home</i>
						</div>
						<div class="menu-title">Dashboard</div>
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
				<div class="breadcrumb-title pe-3">Dashboard</div>
			</div>
			<!--end breadcrumb-->

			<div class="row">
				<div class="col">
					<div class="card rounded-4">
						<div class="card-body">
							<div class="d-flex align-items-center gap-3 mb-2">
								<div class="">
									<h2 class="mb-0">$${indexData.yesterday}</h2>
								</div>
							</div>
							<p class="mb-0">Previous Day's Earning</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card rounded-4">
						<div class="card-body">
							<div class="d-flex align-items-center gap-3 mb-2">
								<div class="">
									<h2 class="mb-0">$${indexData.today}</h2>
								</div>
							</div>
							<p class="mb-0">Today's Earning</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card rounded-4">
						<div class="card-body">
							<div class="d-flex align-items-center gap-3 mb-2">
								<div class="">
									<h2 class="mb-0">$${indexData.currentMonth}</h2>
								</div>
							</div>
							<p class="mb-0">Monthly Earning</p>
						</div>
					</div>
				</div>
			</div>
			<!--end row-->

			<div class="row">
				<div class="col-12 col-xxl-12 d-flex">
					<div class="card rounded-4 w-100">
						<div class="card-body">
							<div
								class="d-flex align-items-start justify-content-between mb-3">
								<div class="">
									<h5 class="mb-0">Profit Overview</h5>
								</div>
							</div>
							<div id="chart1"></div>
						</div>
					</div>
				</div>
			</div>
			<!--end row-->
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
	<script src="/platformX/resources/assets/js/jquery.min.js"></script>
	<!--bootstrap js-->
	<script src="/platformX/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script
		src="/platformX/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<script
		src="/platformX/resources/assets/plugins/metismenu/metisMenu.min.js"></script>
	<script
		src="/platformX/resources/assets/plugins/apexchart/apexcharts.min.js"></script>
	<script
		src="/platformX/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script
		src="/platformX/resources/assets/plugins/peity/jquery.peity.min.js"></script>
	<script>
		$(".data-attributes span").peity("donut")
	</script>
	<script src="/platformX/resources/assets/js/dashboard2.js"></script>
	<script src="/platformX/resources/assets/js/main.js"></script>
</body>

</html>