<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-slate.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/time-icon.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/above-table.css">
<link rel="stylesheet" type="text/css"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">



<title>Music Events App</title>

</head>
<body>
	<!-- NAV BAR -->
	<jsp:include page="navbar.jsp" />

	<!-- BEGIN BODY -->
	<div class="container">
		<div class="row">
			<!-- add event button -->
			<div class="box">
				<input type="button" value="Add Event" class="btn btn-success"
					id="add-event-button"
					onclick="window.location.href='showFormForAddEvent'; return false;" />

				<input type="button" value="Add Artist" class="btn btn-success"
					id="add-artist-button"
					onclick="window.location.href='showFormForAddArtist'; return false;" />

				<input type="button" value="Add Venue" class="btn btn-success"
					id="add-venue-button"
					onclick="window.location.href='showFormForAddVenue'; return false;" />

				<!-- BEGIN SEARCH BOX -->
				<div class="container-search">
					<span class="icon"><i class="fa fa-search"></i></span>
					<form:form action="search" method="POST">
						<input type="search" id="search" name="theSearchEvents" />
						<input type="submit" value="Search" class="btn btn-success"
							id="btn-search" />
					</form:form>
				</div>
			</div>
		</div>
		<!-- END SEARCH -->

		<!-- PARTIALS: todo -->
		<%-- <div id="event-form-modal" class="modal hide fade in " data-url="@Url.Action('showFormForAddEvent')">
			<div id="event-form-container"><jsp:include page="forms/event-form.jsp"></jsp:include></div>
		</div> --%>

		<!-- BEGIN TABLE -->
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
									class="month"><fmt:formatDate value="${tempEvent.date}"
											pattern="MMM" /></span>
									<h2 class="day">
										<fmt:formatDate value="${tempEvent.date}" pattern="dd" />
									</h2>
								</a>
							</div>
						</td>
						<td><span class="time"> <fmt:formatDate
									value="${tempEvent.date}" pattern="h:mm a" /></span></td>
						<td><a href="#">${tempEvent.artist.artistName}</a></td>
						<td><a href="#">${tempEvent.venue.venueName}</a></td>
						<td><a href="#">${tempEvent.venue.city}</a></td>
						<td><a href="#">${tempEvent.venue.state}</a></td>
						<td><div class="btn btn-success btn-ticket">$${tempEvent.ticketPrice}</div></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>