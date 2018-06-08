DROP SCHEMA IF exists `music_events`;

CREATE SCHEMA IF NOT EXISTS `music_events`;

USE `music_events`;

DROP TABLE IF EXISTS `event-address`;

CREATE TABLE `venues` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `venu-name` varchar(45) DEFAULT NULL,
    `street-address` varchar(45) DEFAULT NULL,
    `city` varchar(45) DEFAULT NULL,
    `state` varchar (2) DEFAULT NULL,
    `zip` int(5) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `venues` VALUES
	(1, 'Red Rocks','18300 W Alameda Pkwy', 'Morrison', 'CO', 80465),
    (2, 'Fiddlers Green Ampetheter','6350 Greenwood Plaza Blvd', 'Greenwood Village', 'CO', 80111),
    (3, 'Pepsi Center','1000 Chopper Cir', 'Denver', 'CO', 80204),
    (4, 'Fox Theater','2211 Woodward Ave', 'Detroit', 'MI', 48201),
    (5, 'Stagecrafters Baldwin Theater','415 S Lafayette Ave', 'Royal Oak', 'MI', 48067);

DROP TABLE IF EXISTS `artists`;

CREATE TABLE `artists` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `group-name` varchar(45) DEFAULT NULL,
    `genre` varchar(45) DEFAULT NULL,
    `description` varchar(1000) DEFAULT NULL,
    `tour-name` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `artists` VALUES
	(1, 'Yo-Yo Ma', 'Classical (Solo Cello)', 
		'Born on October 7, 1955, in Paris, France, Yo-Yo Ma is a cellist and songwriter of Chinese descent. The child prodigy attended the Juilliard School and continued to excel throughout his adult life, producing more than 75 albums and winning 18 Grammy Awards. The acclaimed musician also served as artistic director of the Silk Road Project, an organization dedicated to promoting the various traditions along the ancient Silk Road trade route. In 2001, Ma was awarded the National Medal of Arts. In 2010, he was named a recipient of the Presidential Medal of Freedom.', 
        'Silk-Road Project'),
    (2, 'Imagine Dragons', 'Pop Rock', 
		'Imagine Dragons is an alternative-rock band from Las Vegas, Nevada. Band members include frontman Dan Reynolds, bassist Ben McKee, guitarist Wayne Sermon, and drummer Daniel Platzman. As of 2015, they have released two studio albums. Their first, "Night Visions", was released in September of 2012 and their sophomore studio album "Smoke + Mirrors" was released in February of 2015.', 
		'Evolve'),
    (3, 'New York Philharmonic', 'Classical (Orchestra)', 
		'The New York Philharmonic, officially the Philharmonic-Symphony Society of New York, Inc., globally known as New York Philharmonic Orchestra (NYPO) or New York Philharmonic-Symphony Orchestra, is a symphony orchestra based in New York City in the United States. It is one of the leading American orchestras popularly referred to as the "Big Five". The Philharmonic\'s home is David Geffen Hall, located in New York\'s Lincoln Center for the Performing Arts. Founded in 1842, the orchestra is one of the oldest musical institutions in the United States and the oldest of the "Big Five" orchestras. Its record-setting 14,000th concert was given in December 2004.', 
		'Tour Amricana'),
    (4, 'Kelly Clarkson', 'Pop/Pop Rock', 
		'Kelly Brianne Clarkson (born April 24, 1982) is an American singer and songwriter. She rose to fame in 2002 after winning the inaugural season of the television series American Idol, which earned her a record deal with RCA Records. Clarkson\'s debut single, "A Moment Like This", topped the US Billboard Hot 100 chart and became the country\'s best-selling single of 2002. It was followed by the release of her debut studio album, Thankful (2003), which debuted atop the US Billboard 200. Trying to reinvent her image, Clarkson decided to part ways with Idol management and her second album, Breakaway (2004), featured a pop rock sound. It sold over 12 million copies worldwide and earned Clarkson two Grammy Awards.', 
		'Meaning of Life'),
    (5, 'Ben Sollee', 'Folk', 
		'Ben Sollee (born November 28, 1983) is an American cellist, singer-songwriter, and composer known for his political activism. His music incorporates banjo, guitar, and mandolin along with percussion and unusual cello techniques. His songs exhibit a mix of folk, bluegrass, jazz, and R&B elements. Sollee has also composed longer instrumental pieces for dance ensembles and for film.', 
		'Learning to Bend');

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `venue-name` varchar(45) DEFAULT NULL,
    `artist` varchar(45) DEFAULT NULL,
    `event-date` datetime DEFAULT NULL,
    `ticket-price` decimal(6, 2) DEFAULT NULL,
    `event-description` varchar(1000) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `events` VALUES
	(1, 'Red Rocks', 'Yo-Yo Ma', '2018-07-01 19:30:00', 100.00,
		'Bach Cello Suites, Dvorak Cello Concerto and much more!'),
        
	(2, 'Pepsi Center', 'Imagine Dragons', '2018-07-10 20:00:00', 75.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(3, 'Fox Theater', 'Yo-Yo Ma', '2018-07-11 19:30:00', 100.00,
		'Bach Cello Suites, Dvorak Cello Concerto and much more!'),
        
	(4, 'Red Rocks', 'Imagine Dragons', '2018-07-20 20:30:00', 80.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(5, 'Fox Theater', 'New York Philharmonic', '2018-08-01 18:30:00', 30.00,
		'Come listen to the New York Phil play some of America\s favorite compositions, such as Dvorak\'s American Symphony (no. 8).'),
        
	(6, 'Stagecrafters Baldwin Theater', 'Ben Sollee', '2018-08-03 19:00:00', 15.00,
		'Ben plays his own unique blend of Folk, Bluegrass, Jazz, and more on his cello in the uniquiely intimate environment of Stagecrafters Theater. Accompanied by hitbox.'),
        
	(7, 'Fiddlers Green', 'Kelly Clarkson', '2018-08-09 19:30:00', 90.00,
		'Come hear her new hit single, "Piece by Piece", as well as old favorites, such as "Because of You", "Stronger", "Heartbeat Song", and more!'),
        
	(8, 'Fox Theater', 'Imagine Dragons', '2018-08-15 20:00:00', 75.00,
		'All of the songs on their new hit album, Evolve! Plus, everyone\'s favorites, such as "Breathing in the Chemicals", "Demons", "Believer", and more!'),
        
	(9, 'Fiddlers Green', 'Ben Sollee', '2018-08-20 19:00:00', 10.00,
		'Ben plays his own unique blend of Folk, Bluegrass, Jazz, and more on his cello in a fun, outdoor setting. Accompanied by hitbox.'),
        
	(10, 'Red Rocks', 'Kelly Clarkson', '2018-08-23 19:30:00',  90.00,
		'Come hear her new hit single, "Piece by Piece", as well as old favorites, such as "Because of You", "Stronger", "Heartbeat Song", and more!');
        
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(45) DEFAULT NULL,
    `password` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES
	(1, 'admin', 'admin'),
    (2, 'user', 'user');

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(45) DEFAULT NULL,
    `authority` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES
	(1, 'admin', 'ROLE_USER'),
    (2, 'admin', 'ROLE_ADMIN'),
    (3, 'user', 'ROLE_USER');