package com.ajax2012.musicevents.event;

import javax.persistence.Id;

public class Venue {

	@Id
	private int id;
	private String venueName;
	private EventAddress address;
	
	public Venue() {}

	public Venue(int id, String venueName, EventAddress address) {
		this.id = id;
		this.venueName = venueName;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public EventAddress getAddress() {
		return address;
	}

	public void setAddress(EventAddress address) {
		this.address = address;
	}
	
	
	
}
