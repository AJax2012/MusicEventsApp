package com.ajax2012.musicevents.service;


import java.util.List;

import com.ajax2012.musicevents.entity.Venue;

public interface VenueService {
	
	public List<Venue> getVenues();
	public void saveVenue(Venue theVenue);
	
	public Venue getVenue(int theId);
	
	public void deleteVenue(int theId);
	
}
