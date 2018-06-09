package com.ajax2012.musicevents.dao;


import com.ajax2012.musicevents.entity.Venue;

public interface VenueDAO {

	public void saveVenue(Venue theVenue);
	
	public Venue getVenue(int theId);
	
	public void deleteVenue(int theId);
}
