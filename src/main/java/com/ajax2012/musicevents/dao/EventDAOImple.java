package com.ajax2012.musicevents.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ajax2012.musicevents.event.Event;

@Repository
public class EventDAOImple implements EventDAO {

	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Event> getEvents() {
		
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// query events
		Query<Event> theQuery = 
				currentSession.createQuery("from events", Event.class);
		
		List<Event> events = theQuery.getResultList();
				
		// return list of events
		return events;
	}

}
