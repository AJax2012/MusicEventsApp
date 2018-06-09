package com.ajax2012.musicevents.service;

import com.ajax2012.musicevents.entity.Artist;

public interface ArtistService {

	public void saveArtist(Artist theArtist);
	
	public Artist getArtist(int theId);
	
	public void deleteArtist(int theId);
}
