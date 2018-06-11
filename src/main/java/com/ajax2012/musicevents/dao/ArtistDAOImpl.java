package com.ajax2012.musicevents.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajax2012.musicevents.entity.Artist;

@Repository
public class ArtistDAOImpl implements ArtistDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Artist> getArtists() {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Artist> theQuery = currentSession.createQuery("from Artist order by artistName", Artist.class);
		
		List<Artist> artists = theQuery.getResultList();
		
		return artists;
	}

	@Override
	public void saveArtist(Artist theArtist) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/update the artist
		currentSession.saveOrUpdate(theArtist);
	}

	@Override
	public Artist getArtist(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// read from db using the primary key
		Artist theArtist = currentSession.get(Artist.class, theId);
		
		return theArtist;
	}

	@Override
	public void deleteArtist(int theId) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete the object with primary key
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Artist where id=:artistId");
		theQuery.setParameter("artistId", theId);
		
		theQuery.executeUpdate();
	}

}
