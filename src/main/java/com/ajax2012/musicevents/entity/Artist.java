package com.ajax2012.musicevents.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "artists")
public class Artist {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "artist_name")
	private String artistName;

	@Column(name = "genre")
	private String genre;

	@Column(name = "description")
	private String description;

	@Column(name = "tour_name")
	private String tourName;

	@OneToMany(mappedBy = "artist", 
			   cascade = { CascadeType.PERSIST, CascadeType.MERGE, 
					   	   CascadeType.DETACH,	CascadeType.REFRESH })
	private List<Event> events;

	public Artist() {
	}

	public Artist(int id, String artistName, String genre, String description, String tourName) {
		this.id = id;
		this.artistName = artistName;
		this.genre = genre;
		this.description = description;
		this.tourName = tourName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	public void add(Event tempEvent) {
		
		if (events == null) {
			events = new ArrayList<>();
		}
		
		events.add(tempEvent);
		
		tempEvent.setArtist(this);;
	}

}
