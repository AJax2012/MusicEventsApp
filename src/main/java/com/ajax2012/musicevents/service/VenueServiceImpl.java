package com.ajax2012.musicevents.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ajax2012.musicevents.dao.VenueDAO;
import com.ajax2012.musicevents.entity.Venue;

@Service
public class VenueServiceImpl implements VenueService {

	@Autowired
	private VenueDAO venueDAO;
	
	@Override
	@Transactional
	public void saveVenue(Venue theVenue) {
		venueDAO.saveVenue(theVenue);
	}

	@Override
	@Transactional
	public Venue getVenue(int theId) {
		return venueDAO.getVenue(theId);
	}

	@Override
	@Transactional
	public void deleteVenue(int theId) {
		venueDAO.deleteVenue(theId);
	}

}
