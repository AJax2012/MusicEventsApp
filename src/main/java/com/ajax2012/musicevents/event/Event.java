package com.ajax2012.musicevents.event;

import java.util.Date;

import javax.persistence.Id;

public class Event {
	
	@Id
	private int id;
	private String bandName;
	private Venue venue;
	private Date date;
	private int ticketPrice;
	
	public Event() {}

	public Event(int id, String bandName, Venue venue, Date date, int ticketPrice) {
		this.id = id;
		this.bandName = bandName;
		this.venue = venue;
		this.date = date;
		this.ticketPrice = ticketPrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBandName() {
		return bandName;
	}

	public void setBandName(String bandName) {
		this.bandName = bandName;
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
	
	
}
