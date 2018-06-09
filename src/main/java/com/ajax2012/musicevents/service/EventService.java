package com.ajax2012.musicevents.service;

import java.util.List;

import com.ajax2012.musicevents.entity.Event;

public interface EventService {
	
	public List<Event> getEvents();

	public void saveEvent(Event theEvent);

	public Event getEvent(int theId);

	public void deleteEvent(int theId);

	public List<Event> searchEvent(String theSearchEvent);
}
