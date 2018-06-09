package com.ajax2012.musicevents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ajax2012.musicevents.dao.EventDAO;
import com.ajax2012.musicevents.entity.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	@Transactional
	public List<Event> getEvents() {
		return eventDAO.getEvents();
	}

	@Override
	@Transactional
	public void saveEvent(Event theEvent) {
		eventDAO.saveEvent(theEvent);
	}

	@Override
	@Transactional
	public Event getEvent(int theId) {
		return eventDAO.getEvent(theId);
	}

	@Override
	@Transactional
	public void deleteEvent(int theId) {
		eventDAO.deleteEvent(theId);
	}

	@Override
	@Transactional
	public List<Event> searchEvent(String theSearchEvents) {
		return eventDAO.searchEvents(theSearchEvents);
	}

}
