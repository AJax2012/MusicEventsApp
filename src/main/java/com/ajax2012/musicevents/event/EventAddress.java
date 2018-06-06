package com.ajax2012.musicevents.event;

import javax.persistence.Entity;

@Entity
public class EventAddress {

	private String streetAddress;
	private String city;
	
	public EventAddress() {}
	
	public EventAddress(String streetAddress, String city) {
		this.streetAddress = streetAddress;
		this.city = city;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
		
}
