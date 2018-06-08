package com.ajax2012.musicevents.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ajax2012.musicevents.dao.EventDAO;
import com.ajax2012.musicevents.event.Event;

@Controller
@RequestMapping("/event")
public class EventController {

	// inject dao to controller
	@Autowired
	private EventDAO eventDAO;
	
	@RequestMapping("/list")
	public String listEvents(Model theModel) {
		
		List<Event> theEvents = eventDAO.getEvents();
		theModel.addAttribute("events", theEvents);
		
		return "list-events";
	}
}
