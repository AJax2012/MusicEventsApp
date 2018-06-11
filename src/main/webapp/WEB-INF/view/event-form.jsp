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

	<div class="container">
		<div class="col-lg-offset-2">
			<form class="form-horizontal">
				<fieldset>

					<!-- LABEL -->
					<legend>Create or edit an event</legend>
					<form:form action="saveEvent" modelAttribute="event" method="POST"
						class="event-form">
						<form:hidden path="id" />

						<div class="form-group">
							<label for="venue-name" class="col-lg-2 control-label">Venue
								Name:</label>
							<div class="col-lg-5">
								<form:select type="select" id="venue-name" name="venue-name"
									class="form-control" placeholder="Venue Name"
									path="venue.venueName" autocomplete="on" />
							</div>
						</div>

						<div class="form-group">
							<label for="artist-name" class="col-lg-2 control-label">Artist
								Name:</label>
							<div class="col-lg-5">
								<form:select path="artist" items="${listArtists.artistName}"
									type="select" id="artist-name"
									name="artist-name" class="form-control"
									placeholder="Artist Name" autocomplete="off">
									
								</form:select>

							</div>
						</div>

						<div class="form-group">
							<label for="event-date" class="col-lg-2 control-label">Event
								Date:</label>
							<div class="col-lg-5">
								<form:input type="date" id="event-date" name="event-date"
									class="form-control" placeholder="Event Date" path="date"
									autocomplete="off" />
							</div>
						</div>

						<div class="form-group">
							<label for="event-time" class="col-lg-2 control-label">Event
								Time:</label>
							<div class="col-lg-5">
								<form:input type="time" id="event-time" name="event-time"
									class="form-control" placeholder="Event Time" path="date"
									autocomplete="off" />
							</div>
						</div>

						<div class="form-group">
							<label for="ticket-price" class="col-lg-2 control-label">Ticket
								Price:</label>
							<div class="col-lg-5">
								<form:input type="text" id="ticket-price" name="ticket-price"
									class="form-control" placeholder="0.00" path="ticketPrice"
									autocomplete="off" />
							</div>
						</div>

						<div class="form-group">
							<label for="event-description" class="col-lg-2 control-label">Event
								Description:</label>
							<div class="col-lg-5">
								<form:textarea id="event-description" name="event-description"
									class="form-control"
									placeholder="Write your description here..."
									path="eventDescription" autocomplete="off" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-5 col-lg-offset-2">
								<input type="submit" value="Save" class="btn btn-success" /> <input
									type="submit" value="Cancel" class="btn btn-danger"
									onclick="window.location.href='/MusicEvents'; return false" />
							</div>
						</div>
					</form:form>

				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>
