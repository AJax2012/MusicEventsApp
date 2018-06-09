package com.ajax2012.musicevents.service;


import com.ajax2012.musicevents.entity.Venue;

public interface VenueService {
	
	public void saveVenue(Venue theVenue);
	
	public Venue getVenue(int theId);
	
	public void deleteVenue(int theId);
	
}
