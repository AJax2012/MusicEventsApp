package com.ajax2012.musicevents.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajax2012.musicevents.entity.Venue;

@Repository
public class VenueDAOImpl implements VenueDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveVenue(Venue theVenue) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/update the venue
		currentSession.saveOrUpdate(theVenue);
	}

	@Override
	public Venue getVenue(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// read from db using the primary key
		Venue theVenue = currentSession.get(Venue.class, theId);

		return theVenue;
	}

	@Override
	public void deleteVenue(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete the object with primary key
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Venue where id=:venueId");
		theQuery.setParameter("venueId", theId);

		theQuery.executeUpdate();
	}

}
