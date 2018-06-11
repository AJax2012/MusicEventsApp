package com.ajax2012.musicevents.service;

import java.util.List;

import com.ajax2012.musicevents.entity.Artist;

public interface ArtistService {

	public List<Artist> getArtists();
	
	public void saveArtist(Artist theArtist);
	
	public Artist getArtist(int theId);
	
	public void deleteArtist(int theId);
}
