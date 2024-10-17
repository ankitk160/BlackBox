<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en" data-bs-theme="dark">
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

<!--Styles-->
<link href="/blackbox/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/blackbox/resources/assets/css/bootstrap-extended.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<link href="/blackbox/resources/sass/main.css" rel="stylesheet">
<link href="/blackbox/resources/sass/dark-theme.css" rel="stylesheet">
<link href="/blackbox/resources/sass/responsive.css" rel="stylesheet">
</head>

<body>

	<!-- Start wrapper-->
	<div class="pt-5">

		<div class="container pt-5">
			<div class="row pt-5">
				<div class="col-lg-12">
					<div class="text-center error-pages">
						<h1 class="error-title text-warning mb-3">500</h1>
						<h2 class="error-sub-title text-white">INTERNAL SERVER ERROR</h2>

						<p class="error-message text-white text-uppercase">SORRY, AN
							ERROR HAS OCURRED. IT'S NOT ON YOU, IT'S ON US</p>

						<sec:authorize access="hasRole('ROLE_USER')">
							<div
								class="mt-4 d-flex align-items-center justify-content-center gap-3">
								<a href="index-user" class="btn btn-grd-danger rounded-5 px-4"><i
									class="bi bi-house-fill me-2"></i>Go To Home</a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER2')">
							<div
								class="mt-4 d-flex align-items-center justify-content-center gap-3">
								<a href="index-user2" class="btn btn-grd-danger rounded-5 px-4"><i
									class="bi bi-house-fill me-2"></i>Go To Home</a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div
								class="mt-4 d-flex align-items-center justify-content-center gap-3">
								<a href="index" class="btn btn-grd-danger rounded-5 px-4"><i
									class="bi bi-house-fill me-2"></i>Go To Home</a>
							</div>
						</sec:authorize>

						<div class="mt-4">
							<p class="text-light">Copyright © 2024 | All rights reserved.</p>
						</div>
						<hr class="border-light border-2">
						<div class="list-inline contacts-social mt-4"></div>
					</div>
				</div>
			</div>
			<!--end row-->
		</div>

	</div>
	<!--wrapper-->

	<script src="/blackbox/resources/assets/js/pace.min.js"></script>
</body>
</html>
