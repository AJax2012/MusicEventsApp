DROP SCHEMA IF exists `music_events`;

CREATE SCHEMA IF NOT EXISTS `music_events`;

USE `music_events`;

DROP TABLE IF EXISTS `event_address`;

CREATE TABLE `venues` (
	`id`             int(11)      NOT NULL AUTO_INCREMENT,
    `venue_name`     varchar(128) DEFAULT NULL,
    `street_address` varchar(128) DEFAULT NULL,
    `city`           varchar(128) DEFAULT NULL,
    `state`          varchar (2)  DEFAULT NULL,
    `zip`            int(5)       DEFAULT NULL,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `VENUE_NAME_UNIQUE` (`venue_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `venues` VALUES
	(1, 'Red Rocks','18300 W Alameda Pkwy', 'Morrison', 'CO', 80465),
    (2, 'Fiddlers Green Ampetheter','6350 Greenwood Plaza Blvd', 'Greenwood Village', 'CO', 80111),
    (3 ,'Pepsi Center','1000 Chopper Cir', 'Denver', 'CO', 80204),
    (4, 'Fox Theater','2211 Woodward Ave', 'Detroit', 'MI', 48201),
    (5, 'Stagecrafters Baldwin Theater','415 S Lafayette Ave', 'Royal Oak', 'MI', 48067);

DROP TABLE IF EXISTS `artists`;

CREATE TABLE `artists` (
	`id`          int(11)       NOT NULL AUTO_INCREMENT,
    `artist_name` varchar(128)  DEFAULT NULL,
    `genre`       varchar(128)  DEFAULT NULL,
    `tour_name`   varchar(128)  DEFAULT NULL,
    `description` varchar(1000) DEFAULT NULL,
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `ARTIST_NAME_UNIQUE` (`artist_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `artists` VALUES
	(1, 'Yo-Yo Ma', 'Classical (Solo Cello)', 'Silk-Road Project',
		'Born on October 7, 1955, in Paris, France, Yo-Yo Ma is a cellist and songwriter of Chinese descent. The child prodigy attended the Juilliard School and continued to excel throughout his adult life, producing more than 75 albums and winning 18 Grammy Awards. The acclaimed musician also served as artistic director of the Silk Road Project, an organization dedicated to promoting the various traditions along the ancient Silk Road trade route. In 2001, Ma was awarded the National Medal of Arts. In 2010, he was named a recipient of the Presidential Medal of Freedom.'),
    (2, 'Imagine Dragons', 'Pop Rock', 'Evolve',
		'Imagine Dragons is an alternative_rock band from Las Vegas, Nevada. Band members include frontman Dan Reynolds, bassist Ben McKee, guitarist Wayne Sermon, and drummer Daniel Platzman. As of 2015, they have released two studio albums. Their first, "Night Visions", was released in September of 2012 and their sophomore studio album "Smoke + Mirrors" was released in February of 2015.'),
    (3, 'New York Philharmonic', 'Classical (Orchestra)', 'Tour Amricana',
		'The New York Philharmonic, officially the Philharmonic-Symphony Society of New York, Inc., globally known as New York Philharmonic Orchestra (NYPO) or New York Philharmonic_Symphony Orchestra, is a symphony orchestra based in New York City in the United States. It is one of the leading American orchestras popularly referred to as the "Big Five". The Philharmonic\'s home is David Geffen Hall, located in New York\'s Lincoln Center for the Performing Arts. Founded in 1842, the orchestra is one of the oldest musical institutions in the United States and the oldest of the "Big Five" orchestras. Its record_setting 14,000th concert was given in December 2004.'),
    (4 ,'Kelly Clarkson', 'Pop/Pop Rock', 'Meaning of Life',
		'Kelly Brianne Clarkson (born April 24, 1982) is an American singer and songwriter. She rose to fame in 2002 after winning the inaugural season of the television series American Idol, which earned her a record deal with RCA Records. Clarkson\'s debut single, "A Moment Like This", topped the US Billboard Hot 100 chart and became the country\'s best_selling single of 2002. It was followed by the release of her debut studio album, Thankful (2003), which debuted atop the US Billboard 200. Trying to reinvent her image, Clarkson decided to part ways with Idol management and her second album, Breakaway (2004), featured a pop rock sound. It sold over 12 million copies worldwide and earned Clarkson two Grammy Awards.'),
    (5, 'Ben Sollee', 'Folk', 'Learning to Bend',
		'Ben Sollee (born November 28, 1983) is an American cellist, singer-songwriter, and composer known for his political activism. His music incorporates banjo, guitar, and mandolin along with percussion and unusual cello techniques. His songs exhibit a mix of folk, bluegrass, jazz, and R&B elements. Sollee has also composed longer instrumental pieces for dance ensembles and for film.');

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
	`id`                int(11)       NOT NULL AUTO_INCREMENT,
    `venue_name`        varchar(128)  DEFAULT NULL,
    `venue_id`          int(11)       DEFAULT NULL,
    `artist`            varchar(128)  DEFAULT NULL,
    `artist_id`         int(11)       DEFAULT NULL,
    `event_date`        datetime      DEFAULT NULL,
    `ticket_price`      decimal(6, 2) DEFAULT NULL,
    `event_description` varchar(1000) DEFAULT NULL,
    
    PRIMARY KEY (`id`),
        
    KEY `FK_VENUE_idx` (`venue_id`),
    
    CONSTRAINT `FK_VENUE`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venues` (`id`)
    
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    
    KEY `FK_ARTIST_idx` (`artist_id`),
    
    CONSTRAINT `FK_ARTIST`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`id`)
    
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `events` VALUES
	(1, 'Red Rocks', 1, 'Yo-Yo Ma', 1,'2018_07_01 19:30:00', 100.00,
		'Bach Cello Suites, Dvorak Cello Concerto and much more!'),
        
	(2, 'Pepsi Center', 3, 'Imagine Dragons', 2, '2018_07_10 20:00:00', 75.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(3, 'Fox Theater', 4, 'Yo-Yo Ma', 1, '2018_07_11 19:30:00', 100.00,
		'Bach Cello Suites, Dvorak Cello Concerto and much more!'),
        
	(4, 'Red Rocks', 1, 'Imagine Dragons', 2, '2018_07_20 20:30:00', 80.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(5, 'Fox Theater', 4, 'New York Philharmonic', 3, '2018_08_01 18:30:00', 30.00,
		'Come listen to the New York Phil play some of America\s favorite compositions, such as Dvorak\'s American Symphony (no. 8).'),
        
	(6, 'Stagecrafters Baldwin Theater', 5, 'Ben Sollee', 5, '2018_08_03 19:00:00', 15.00,
		'Ben plays his own unique blend of Folk, Bluegrass, Jazz, and more on his cello in the uniquiely intimate environment of Stagecrafters Theater. Accompanied by hitbox.'),
        
	(7, 'Fiddlers Green', 2, 'Kelly Clarkson', 4, '2018_08_09 19:30:00', 90.00,
		'Come hear her new hit single, "Piece by Piece", as well as old favorites, such as "Because of You", "Stronger", "Heartbeat Song", and more!'),
        
	(8, 'Fox Theater', 4, 'Imagine Dragons', 2, '2018_08_15 20:00:00', 75.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(9, 'Fiddlers Green', 2, 'Ben Sollee', 5, '2018_08_20 19:00:00', 10.00,
		'Ben plays his own unique blend of Folk, Bluegrass, Jazz, and more on his cello in a fun, outdoor setting. Accompanied by hitbox.'),
        
	(10, 'Red Rocks', 1, 'Kelly Clarkson', 4, '2018_08_23 19:30:00',  90.00,
		'Come hear her new hit single, "Piece by Piece", as well as old favorites, such as "Because of You", "Stronger", "Heartbeat Song", and more!');
        
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`id`       int(11)     NOT NULL AUTO_INCREMENT,
    `username` varchar(45) DEFAULT NULL,
    `password` varchar(45) DEFAULT NULL,
    
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES
	(1, 'admin', 'admin'),
    (2, 'user', 'user');

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
	`id`        int(11)     NOT NULL AUTO_INCREMENT,
    `username`  varchar(45) DEFAULT NULL,
    `user_id`   int(11)     DEFAULT NULL,
    `authority` varchar(45) DEFAULT NULL,
    
    PRIMARY KEY (`id`),
    
    KEY `FK_USER_idx` (`user_id`),
    
    CONSTRAINT `FK_USER`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES
	(1, 'admin', 1, 'ROLE_USER'),
    (2, 'admin', 1, 'ROLE_ADMIN'),
    (3, 'user', 2, 'ROLE_USER');