package com.ajax2012.musicevents.dao;

import java.util.List;

import com.ajax2012.musicevents.entity.Event;

public interface EventDAO {

	public List<Event> getEvents();
	
	public void saveEvent(Event theEvent);
	
	public Event getEvent(int theId);
	
	public void deleteEvent(int theId);
	
	public List<Event> searchEvents(String theEvents);
}
