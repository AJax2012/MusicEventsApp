package com.ajax2012.musicevents.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ajax2012.musicevents.entity.Artist;
import com.ajax2012.musicevents.entity.Event;
import com.ajax2012.musicevents.entity.Venue;
import com.ajax2012.musicevents.service.ArtistService;
import com.ajax2012.musicevents.service.EventService;
import com.ajax2012.musicevents.service.VenueService;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private EventService eventService;

	@Autowired
	private VenueService venueService;

	@Autowired
	private ArtistService artistService;

	@GetMapping("/")
	public String listEvents(Model theModel) {

		// pull from EventDAOImple -> getEvents method. Lists all events
		List<Event> theEvents = eventService.getEvents();

		// adds result of previous queries to the Model
		theModel.addAttribute("events", theEvents);

		return "home";
	}

	/*
	 * must fix this! do not have a form EVENTS
	 */
	@GetMapping("/showFormForAddEvent")
	public String showFormForAddEvent(Model theModel) {

		// create model attribute to bind form data
		Event theEvent = new Event();
		theModel.addAttribute("event", theEvent);

		return "event-form";
	}

	@PostMapping("/saveEvent")
	public String saveEvent(@ModelAttribute("event") Event theEvent) {

		// save the event using our service
		eventService.saveEvent(theEvent);

		return "redirect:/home";
	}

	/*
	 * must fix this! do not have a form
	 */
	@GetMapping("/showFormForUpdateEvent")
	public String showFormForUpdateEvent(@RequestParam("eventId") int theId, Model theModel) {

		// get the event from the service
		Event theEvent = eventService.getEvent(theId);

		// set event as a model attribute to pre-populate the form
		theModel.addAttribute("event", theEvent);

		// send to form
		return "event-form";
	}

	@GetMapping("/deleteEvent")
	public String deleteEvent(@RequestParam("eventId") int theId) {

		// delete the event
		eventService.deleteEvent(theId);

		return "redirect:/home";
	}

	@PostMapping("/search")
	public String searchEvents(@RequestParam("theSearchEvents") String theSearchEvents, Model theModel) {

		// search customers from the service
		List<Event> theEvents = eventService.searchEvent(theSearchEvents);

		// add the customers to the model
		theModel.addAttribute("events", theEvents);

		return "home";
	}

	/*
	 * must fix this! do not have a form VENUE
	 */
	
	@GetMapping("/venues")
	public String listVenues(Model theModel) {

		// pull from EventDAOImple -> getEvents method. Lists all events
		List<Venue> theVenues = venueService.getVenues();

		// adds result of previous queries to the Model
		theModel.addAttribute("venues", theVenues);

		return "event-form";
	}
	
	@PostMapping("/saveVenue")
	public String saveVenue(@ModelAttribute("venue") Venue theVenue) {

		// save the venue using our service
		venueService.saveVenue(theVenue);

		return "redirect:/home";
	}

	/*
	 * must fix this! do not have a form
	 */
	@GetMapping("/showFormForUpdateVenue")
	public String showFormForUpdateVenue(@RequestParam("venueId") int theId, Model theModel) {

		// get the event from the service
		Venue theVenue = venueService.getVenue(theId);

		// set event as a model attribute to pre-populate the form
		theModel.addAttribute("event", theVenue);

		// send to form
		return "venue-form";
	}

	@GetMapping("/deleteVenue")
	public String deleteVenue(@RequestParam("venueId") int theId) {

		// delete the event
		venueService.deleteVenue(theId);

		return "redirect:/home";
	}
	
	/*
	 * FIX THIS ONE
	 * ASAP
	 * LIKE NOW
	 * HAHAHA
	 */
	@GetMapping("/listArtists")
	public String listArtists(Model theModel) {

		// pull from EventDAOImple -> getEvents method. Lists all events
		List<Artist> theArtists = artistService.getArtists();

		// adds result of previous queries to the Model
		theModel.addAttribute("artists", theArtists);
		
		return "event-form";
	}
	
	/*
	 * must fix this! do not have a form ARTIST
	 */
	@PostMapping("/saveArtist")
	public String saveArtist(@ModelAttribute("artist") Artist theArtist) {

		// save the customer using our service
		artistService.saveArtist(theArtist);

		return "redirect:/home";
	}

	/*
	 * must fix this! do not have a form
	 */
	@GetMapping("/showFormForUpdateArtist")
	public String showFormForUpdateArtist(@RequestParam("artistId") int theId, Model theModel) {

		// get the event from the service
		Artist theArtist = artistService.getArtist(theId);

		// set event as a model attribute to pre-populate the form
		theModel.addAttribute("artist", theArtist);

		// send to form
		return "artist-form";
	}

	@GetMapping("/deleteArtist")
	public String deleteArtist(@RequestParam("artistId") int theId) {

		// delete the event
		artistService.deleteArtist(theId);

		return "redirect:/home";
	}

}
