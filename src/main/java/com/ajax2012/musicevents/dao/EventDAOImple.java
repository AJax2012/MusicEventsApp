package com.ajax2012.musicevents.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajax2012.musicevents.entity.Event;

@Repository
public class EventDAOImple implements EventDAO {

	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Event> getEvents() {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// query events -> sort by date
		Query<Event> theQuery = currentSession.createQuery("from Event order by date", Event.class);

		List<Event> events = theQuery.getResultList();

		// return list of events
		return events;
	}

	@Override
	public void saveEvent(Event theEvent) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/update the event
		currentSession.saveOrUpdate(theEvent);
	}

	@Override
	public Event getEvent(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// read from db using the primary key
		Event theEvent = currentSession.get(Event.class, theId);

		return theEvent;
	}

	@Override
	public void deleteEvent(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete the object with primary key
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Event where id=:eventId");
		theQuery.setParameter("eventId", theId);

		theQuery.executeUpdate();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Event> searchEvents(String theSearchEvents) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		Query theQuery = null;
		
		/*
		 * only search by name if theSearch is not empty
		 */
		
		if (theSearchEvents != null && theSearchEvents.trim().length() > 0) {
			theQuery = currentSession.createQuery("from Event where lower(artist.artistName) like :theSearchEvent or lower(venue.venueName) like :theSearchEvent or lower(venue.city) like :theSearchEvent or lower(venue.state) like :theSearchEvent", Event.class);
            theQuery.setParameter("theSearchEvent", "%" + theSearchEvents.toLowerCase() + "%");
		} else {
			
			// theSearchName is empty ... so just get all customers
            theQuery =currentSession.createQuery("from Event", Event.class);
		}
		
		// execute query and get result list
		List<Event> events = theQuery.getResultList();
		
		return events;
	}
	
//	@SuppressWarnings("unchecked")
//	public List<Event> resetSearchEvents(String theSearchEvents) {
//
//		// get current hibernate session
//		Session currentSession = sessionFactory.getCurrentSession();
//
//		Query theQuery = null;
//		
//		/*
//		 * only search by name if theSearch is not empty
//		 */
//		
//		if (theSearchEvents != null && theSearchEvents.trim().length() > 0) {
//			theQuery = currentSession.createQuery("from Event", Event.class);
//            theQuery.setParameter("theSearchEvent", "%" + theSearchEvents.toLowerCase() + "%");
//		} else {
//			
//			// theSearchName is empty ... so just get all customers
//            theQuery =currentSession.createQuery("from Event", Event.class);
//		}
//		
//		// execute query and get result list
//		List<Event> events = theQuery.getResultList();
//		
//		return events;
//	}

}
