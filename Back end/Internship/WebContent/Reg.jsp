<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<style type="text/css">
sup {
	color: red;
}
</style>
</head>
<body class="text-center">
	<h1>Register</h1>
	<form action="register" onsubmit="return validate();" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="uname">Username: <sup>*</sup></label> <input type="text"
				name="uname" id="uname" class="form-control" value="${param.uname}"
				required>
		</div>
		<div class="form-group">
			<label for="email">Email: <sup>*</sup></label> <input type="email"
				name="email" id="email" class="form-control" value="${param.email}"
				required>
		</div>
		<div class="form-group">
			<label for="p1">Password: <sup>*</sup></label><input type="password"
				name="pass1" id="p1" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="p2">Retype Password: <sup>*</sup></label><input
				type="password" name="pass2" id="p2" class="form-control" required>
		</div>
		<div class="custom-file">
			<input type="file" name="propic" id="propic"
				class="custom-file-input" required> <label for="propic"
				class="custom-file-label">Choose file</label>
		</div>
		<br />
		<br /> <input type="submit" value="Sign Up"
			class="btn btn-primary btn-block">
	</form>
	<a href="Login.jsp">Already have an account?</a>
</body>
<script>
	function validate() {
		var pass = document.getElementById("p1").value;
		var cpass = document.getElementById("p2").value;
		if (pass != cpass) {
			alert("Enter same passwords");
			event.preventDefault();
			return false;
		}
		return true;
	}
</script>
</html>