<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" data-bs-theme="blue-theme">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Blacbox</title>
<!--favicon-->
<link rel="icon"
	href="/blackbox/resources/assets/images/favicon-32x32.jpg"
	type="image/jpg">
<!-- loader-->
<link href="/blackbox/resources/assets/css/pace.min.css"
	rel="stylesheet">
<script src="/blackbox/resources/assets/js/pace.min.js"></script>
<!--plugins-->
<link rel="stylesheet" type="text/css"
	href="/blackbox/resources/assets/plugins/metismenu/metisMenu.min.css">
<link rel="stylesheet" type="text/css"
	href="/blackbox/resources/assets/plugins/metismenu/mm-vertical.css">
<link rel="stylesheet"
	href="/blackbox/resources/assets/plugins/notifications/css/lobibox.min.css">
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
<link href="/blackbox/resources/sass/blue-theme.css" rel="stylesheet">
<link href="/blackbox/resources/sass/responsive.css" rel="stylesheet">
<!-- notifications css -->
<link rel="stylesheet"
	href="/blackbox/resources/assets/plugins/notifications/css/lobibox.min.css">
<style>
.logo-image {
	z-index: 10;
	position: absolute;
	width: 49.71vh;
	height: 9.36vh;
	top: 8.59vh;
}

.form-control {
	border-color: #FFF;
}
</style>
</head>

<body>
	<!--authentication-->
	<div class="section-authentication-cover">
		<div class="">
			<div class="row g-0">
				<div
					class="col-12 col-xl-7 col-xxl-8 auth-cover-left align-items-center justify-content-center d-none d-xl-flex border-end bg-transparent">
					<img src="/blackbox/resources/assets/images/logo3.png"
						class="mb-4 logo-image" alt="">
					<div
						class="card rounded-0 mb-0 border-0 shadow-none bg-transparent bg-none">
						<div class="card-body">
							<img alt="" src="/blackbox/resources/assets/images/auth/lock.png"
								style="position: absolute; left: 67vh; top: 23vh; z-index: 2; width: 11.44vh; height: 14vh;">
							<img src="/blackbox/resources/assets/images/auth/login1.png"
								class="img-fluid auth-img-cover-login" alt=""
								style="position: relative; width: 69.87vh;">
						</div>
					</div>
				</div>
				<div
					class="col-12 col-xl-5 col-xxl-4 auth-cover-right align-items-center justify-content-end border-top border-4 border-primary border-gradient-1">
					<div class="card rounded-0 mb-0 border-0 shadow-none bg-none">
						<div class="card-body p-sm-4">
							<div class="form-body mt-4">
								<form class="row g-3" id="loginValidation" method="POST"
									action="loginUser">
									<div class="col-12">
										<label for="username" class="form-label">Username</label> <input
											type="text" class="form-control" id="username"
											name="username" placeholder="Enter Username">
									</div>
									<div class="col-12">
										<label for="password" class="form-label">Password</label> <input
											type="password" class="form-control" id="password"
											name="password" placeholder="Enter Password">
									</div>
									<div class="col-4">
										<div class="d-grid">
											<button type="submit" class="btn btn-grd-primary">Login</button>
										</div>
									</div>
									<div class="col-12"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--end row-->
		</div>
	</div>
	<!--authentication-->

	<!--bootstrap js-->
	<script src="/blackbox/resources/assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script src="/blackbox/resources/assets/js/jquery.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/jquery.validate.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/validation/validation-script.js"></script>
	<!--notification js -->
	<script
		src="/blackbox/resources/assets/plugins/notifications/js/lobibox.min.js"></script>
	<script
		src="/blackbox/resources/assets/plugins/notifications/js/notifications.min.js"></script>
	<script>
		$(document).ready(function() {
			var alertMessage = "${alertMessage}";
			if (alertMessage) {
				Lobibox.notify('warning', {
					pauseDelayOnHover : true,
					continueDelayOnInactiveTab : false,
					position : 'center top',
					size : 'mini',
					msg : alertMessage,
				});
			}
		});
	</script>
</body>
</html>