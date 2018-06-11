package com.ajax2012.musicevents.dao;

import java.util.List;

import com.ajax2012.musicevents.entity.Artist;

public interface ArtistDAO {

	public List<Artist> getArtists();
	
	public void saveArtist(Artist theArtist);
	
	public Artist getArtist(int theId);
	
	public void deleteArtist(int theId);
}
