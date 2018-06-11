package com.ajax2012.musicevents.dao;


import java.util.List;

import com.ajax2012.musicevents.entity.Venue;

public interface VenueDAO {

	public List<Venue> getVenues();
	
	public void saveVenue(Venue theVenue);
	
	public Venue getVenue(int theId);
	
	public void deleteVenue(int theId);
}
