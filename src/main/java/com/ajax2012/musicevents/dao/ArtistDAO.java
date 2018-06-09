package com.ajax2012.musicevents.dao;

import com.ajax2012.musicevents.entity.Artist;

public interface ArtistDAO {

	public void saveArtist(Artist theArtist);
	
	public Artist getArtist(int theId);
	
	public void deleteArtist(int theId);
}
