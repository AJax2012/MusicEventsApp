package com.ajax2012.musicevents.event;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ajax2012.musicevents.groups.Artist;

@Entity
@Table(name="events")
public class Event {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
						 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="venue_id")
	private Venue venue;

	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE,
						 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="artist_id")
	private Artist artist;
	
	@Column(name="event_date")
	private Date date;
	
	@Column(name="ticket_price")
	private int ticketPrice;
	
	@Column(name="event_description")
	private String eventDescription;
	
	public Event() {}

	public Event(int id, Artist artist, Venue venue, Date date, int ticketPrice, String eventDescription) {
		this.id = id;
		this.artist = artist;
		this.venue = venue;
		this.date = date;
		this.ticketPrice = ticketPrice;
		this.eventDescription = eventDescription;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", venue=" + venue + ", bandName=" + artist + ", date=" + date + ", ticketPrice="
				+ ticketPrice + ", eventDescription=" + eventDescription + "]";
	}	
	
}
