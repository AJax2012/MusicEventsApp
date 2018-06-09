<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-slate.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/time-icon.css">

<script type="text/javascript" src="time-icon.js"></script>

<title>Music Events App</title>

</head>
<body>
	<!-- BEGIN NAV BAR -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Music Events App</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- DROPDOWN -->
				<!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li> -->
			</ul>
		</div>
	</div>
	</nav>
	<!-- END NAV BAR -->

	<div class="container">
		<table class="table table-striped table-hover ">
			<thead>
				<tr>
					<th>Date</th>
					<th>Time</th>
					<th>Artist</th>
					<th>Venue</th>
					<th>City</th>
					<th>State</th>
					<th>Ticket Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tempEvent" items="${events}">
					<tr>
						<td>
							<div class="date">
								<a href="#" class="date-btn"> <span class="binds"></span> <span
									class="month"><fmt:formatDate value="${tempEvent.date}" pattern="MMM" /></span>
									<h2 class="day"><fmt:formatDate value="${tempEvent.date}" pattern="dd" /></h2>
								</a>
							</div>
						</td>
						<td><span class="time"><fmt:formatDate value="${tempEvent.date}" pattern="h:mm a" /></span></td>
						<td><a href="#">${tempEvent.artist.artistName}</a></td>
						<td><a href="#">${tempEvent.venue.venueName}</a></td>
						<td><a href="#">${tempEvent.venue.city}</a></td>
						<td><a href="#">${tempEvent.venue.state}</a></td>
						<td><div class="btn btn-info btn-ticket">$${tempEvent.ticketPrice}</div></td>
					</tr>
				</c:forEach>
				<!-- <tr>
					<td>
						<div class="date">
							<a href="#" class="date-btn"> <span class="binds"></span> <span
								class="month">Aug</span>
								<h2 class="day">28</h2>
							</a>
						</div>
					</td>
					<td><span class="time">8:00PM</td>
					<td><a href="#">Blue Lake International Youth Orchestra</a></td>
					<td><a href="#">Island Grove Regional Park</a></td>
					<td><a href="#">New York City</a></td>
					<td><a href="#">NY</a></td>
					<td><div class="btn btn-info">Tickets</div></td>
				</tr>
				<tr>
					<td>
						<div class="date">
							<a href="#" class="date-btn"> <span class="binds"></span> <span
								class="month">Sep</span>
								<h2 class="day">1</h2>
							</a>
						</div>
					</td>
					<td><span class="time">7:00PM</span></td>
					<td><a href="#">XYZ</a></td>
					<td><a href="#">Red Rocks</a></td>
					<td><a href="#">Denver</a></td>
					<td><a href="#">CO</a></td>
					<td><div class="btn btn-info">Tickets</div></td>
				</tr> -->
			</tbody>
		</table>
	</div>
</body>
</html>