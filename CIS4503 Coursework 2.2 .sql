CREATE TABLE Attendee (
	AttendeeID int(10) primary key auto_increment,
    Forename varchar(50) not null,
    Surname varchar(50) not null,
    DateOfBirth date not null,
    EmailAddress varchar(100) null,
    PhoneNumber bigint(15) not null
);

CREATE TABLE Camping_Spot (
	CampingSpotID int(10) primary key auto_increment,
	CampingType enum('basic', 'premium') not null default 'basic'
);

CREATE TABLE Ticket_Type (
	TicketTypeID int(10) primary key auto_increment,
    EntryDays enum('Friday', 'Saturday', 'Sunday', 'Friday & Saturday', 'Saturday & Sunday', 'Friday, Saturday & Sunday') not null,
    VIP enum('Day', 'Weekend') null
);

CREATE TABLE Ticket (
	TicketID int(10) primary key auto_increment,
    Price decimal(6, 2) not null,
    ValidFrom date not null,
    ValidTill date not null,
    AttendeeID int(10) not null,
    TicketTypeID int(10) not null,
    CampingSpotID int(10) null,
    foreign key (AttendeeID) references Attendee(AttendeeID)
		on delete cascade
        on update cascade,
    foreign key (TicketTypeID) references Ticket_Type(TicketTypeID)
		on delete cascade
        on update cascade,
    foreign key (CampingSpotID) references Camping_Spot(CampingSpotID)
		on delete set null
        on update cascade
);

CREATE TABLE Non_Musical_Event (
	NMEventID int(10) primary key auto_increment,
    EventName tinytext not null,
    EventType varchar(30) not null
);

CREATE TABLE Event_Agenda (
	EventAgendaID int(10) primary key auto_increment,
    EventAgendaName varchar(50) not null,
    EventAgendaType varchar(75) not null,
    EventAgendaDay enum('Friday', 'Saturday', 'Sunday', 'Everyday') not null,
    EventAgendaTime time not null,
    NMEventID int(10) not null,
    foreign key (NMEventID) references Non_Musical_Event(NMEventID)
		on delete cascade
        on update cascade
);

CREATE TABLE Artist (
	ArtistID int(10) primary key auto_increment,
    ArtistName varchar(50) not null,
    MusicGenre varchar(50) not null
);

CREATE TABLE Stage (
	StageID int(10) primary key auto_increment,
    StageName tinytext not null,
    StageType tinytext not null
);

CREATE TABLE Performance (
	PerformanceID int(10) primary key auto_increment,
    PerformanceDay enum('Friday', 'Saturday', 'Sunday') not null,
    PerformanceTime time not null,
    ArtistID int(10) not null,
    StageID int(10) not null,
    foreign key (ArtistID) references Artist(ArtistID)
		on delete cascade
        on update cascade,
    foreign key (StageID) references Stage(StageID)
		on delete cascade
        on update cascade
);

CREATE TABLE Schedule (
	ScheduleID int(10) primary key auto_increment,
    Reminder bool not null,
    AttendeeID int(10) not null,
    PerformanceID int(10) not null,
    EventAgendaID int(10) null,
    foreign key (AttendeeID) references Attendee(AttendeeID)
		on delete cascade
        on update cascade,
    foreign key (PerformanceID) references Performance(PerformanceID)
		on delete cascade
        on update cascade,
    foreign key (EventAgendaID) references Event_Agenda(EventAgendaID)
		on delete set null
        on update cascade
);

INSERT INTO Non_Musical_Event (NMEventID, EventName, EventType)
VALUES
    (1, 'Comedy Tent', 'Stand-up acts'),
    (2, 'Cinema Dome', 'Films showcased'),
    (3, 'Art Gallery', 'Art with modern intallations'),
    (4, 'Craft Market', 'Handmade goods'),
    (5, 'Food and Brew Street', 'International cusines'),
    (6, 'Wellness Pavilion', 'Health & relaxation activities'),
    (7, 'Gaming Arcade', 'Arcade games for entertainment');

INSERT INTO Stage (StageID, StageName, StageType)
VALUES
    (1, 'Main Stage', 'Headline performances on the biggest stage'),
    (2, 'Groove Grounds', 'Electronic and dance music'),
    (3, 'Acoustic Corner', 'Intimate sets for folk and acoustic genres'),
    (4, 'Rock Riff Ridge', 'Rock and heavy metal bands'),
    (5, 'Chillout Lounge', 'Smaller venue for ambient and relaxing music sets');

INSERT INTO Artist (ArtistID, ArtistName, MusicGenre)
VALUES
    (1, 'The Rolling Scones', 'Classic rock'),
    (2, 'Arctic Marmosets', 'Cryptic indie rock'),
    (3, 'Flu Fighters', 'Dynamic rock'),
    (4, 'Lady Baba', 'Dramatic pop'),
    (5, 'Red Hot Chilli Poppers', 'Funk rock'),
    (6, 'Imagine Drag-ons', 'Fantasy'),
    (7, 'Bleetwood Mac', 'Electronic synth-pop'),
    (8, 'Metallicalica', 'Heavy metal'),
    (9, 'Adele-droid', 'Futuristic pop'),
    (10, 'Snoop Corgi', 'Animal-themed rap'),
    (11, 'Muse-ical', 'Dramatic orchestral rock'),
    (12, 'Nine Inch Snails', 'Industrial rock'),
    (13, 'Queen Elizabeth', 'Regal rock'),
    (14, 'Gorill-az', 'Augmented reality'),
    (15, 'The Beetles', 'Eco-friendly activism'),
    (16, 'Katy Ferry', 'Nautical-themed pop'),
    (17, 'J-Zeebra', 'Sharp hip-hop'),
    (18, 'Post Malogne', 'Folk, rap, and electronic'),
    (19, 'The Weekend Update', 'News-themed'),
    (20, 'Rage Against the Espresso Machine', 'Coffee-themed energetic'),
    (21, 'Marshmell-oh', 'Electronic dance'),
    (22, 'The Stalking Heads', 'Punk rock poetry'),
    (23, 'Pink-Flyod', 'Experimental'),
    (24, 'Kings of Lions Den', 'Biblical rock'),
    (25, 'The Kill-Joy Division', 'Upbeat post-punk'),
    (26, 'Chain Smokers Anonymous', 'Health-themed electronic'),
    (27, 'Echoes of Nowhere', 'Ethereal pop'),
    (28, 'Silver Strings', 'Modern bluegrass'),
    (29, 'Night Howls', 'Garage rock'),
    (30, 'Oceanic Drift', 'Ocean-themed ambience'),
    (31, 'Skylight Serenade', 'Symphonic and electronic'),
    (32, 'Polar Groove', 'Ice-themed visual arts and chillstep'),
    (33, 'Velvet Vortex', 'Alternative, smooth soul'),
    (34, 'Cyber Symphony', 'Techno-classical'),
    (35, 'Lunar Tides', 'Celestial-themed indie pop'),
    (36, 'Desert Winds', 'Middle Eastern modern jazz'),
    (37, 'Thunder Echoes', 'Anthemic hard rock'),
    (38, 'Neon Grooves', 'Disco revival'),
    (39, 'Twilight Serenaders', 'Acoustic folk'),
    (40, 'Digital Dreams', 'Futuristic electronic dance'),
    (41, 'Harmonic Dusk', 'Smooth jazz'),
    (42, 'Retro Spectrum', 'Modern 80s pop rock');

INSERT INTO Performance (PerformanceID, PerformanceDay, PerformanceTime, ArtistID, StageID)
VALUES
    (1, 'Friday', '12:00:00', 1, 1),
    (2, 'Friday', '12:30:00', 3, 4),
    (3, 'Friday', '13:00:00', 21, 2),
    (4, 'Friday', '14:00:00', 16, 3),
    (5, 'Friday', '15:00:00', 4, 1),
    (6, 'Friday', '15:00:00', 30, 5),
    (7, 'Friday', '16:00:00', 11, 2),
    (8, 'Friday', '16:30:00', 5, 4),
    (9, 'Friday', '17:00:00', 31, 3),
    (10, 'Friday', '18:00:00', 8, 1),
    (11, 'Friday', '18:00:00', 27, 5),
    (12, 'Friday', '19:00:00', 34, 2),
    (13, 'Friday', '19:30:00', 37, 4),
    (14, 'Friday', '20:00:00', 39, 3),
    (15, 'Friday', '21:00:00', 38, 1),
    (16, 'Friday', '21:00:00', 41, 5),
    (17, 'Friday', '22:00:00', 40, 2),
    (18, 'Saturday', '12:00:00', 14, 1),
    (19, 'Saturday', '12:30:00', 31, 5),
    (20, 'Saturday', '13:00:00', 17, 2),
    (21, 'Saturday', '13:30:00', 8, 4),
    (22, 'Saturday', '14:00:00', 28, 3),
    (23, 'Saturday', '15:00:00', 9, 1),
    (24, 'Saturday', '16:00:00', 7, 2),
    (25, 'Saturday', '16:30:00', 29, 5),
    (26, 'Saturday', '17:00:00', 13, 3),
    (27, 'Saturday', '17:30:00', 22, 4),
    (28, 'Saturday', '18:00:00', 6, 1),
    (29, 'Saturday', '19:00:00', 26, 2),
    (30, 'Saturday', '19:30:00', 23, 5),
    (31, 'Saturday', '20:00:00', 36, 3),
    (32, 'Saturday', '20:30:00', 42, 4),
    (33, 'Saturday', '21:00:00', 33, 1),
    (34, 'Saturday', '22:00:00', 35, 2),
    (35, 'Sunday', '12:00:00', 19, 1),
    (36, 'Sunday', '12:30:00', 41, 5),
    (37, 'Sunday', '13:00:00', 4, 2),
    (38, 'Sunday', '13:30:00', 3, 4),
    (39, 'Sunday', '14:00:00', 24, 3),
    (40, 'Sunday', '15:00:00', 10, 1),
    (41, 'Sunday', '15:30:00', 2, 5),
    (42, 'Sunday', '16:00:00', 15, 2),
    (43, 'Sunday', '16:30:00', 37, 4),
    (44, 'Sunday', '17:00:00', 27, 3),
    (45, 'Sunday', '18:00:00', 1, 1),
    (46, 'Sunday', '18:30:00', 38, 5),
    (47, 'Sunday', '19:00:00', 20, 2),
    (48, 'Sunday', '19:30:00', 30, 4),
    (49, 'Sunday', '20:00:00', 39, 3),
    (50, 'Sunday', '21:00:00', 42, 1),
    (51, 'Sunday', '22:00:00', 40, 2);

INSERT INTO Ticket_Type (TicketTypeID, EntryDays, VIP)
VALUES
    (1, 'Friday', null),
    (2, 'Friday', 'Day'),
    (3, 'Saturday', null),
    (4, 'Saturday', 'Day'),
    (5, 'Sunday', null),
    (6, 'Sunday', 'Day'),
    (7, 'Friday & Saturday', null),
    (8, 'Friday & Saturday', 'Day'),
    (9, 'Saturday & Sunday', null),
    (10, 'Saturday & Sunday', 'Day'),
    (11, 'Friday, Saturday & Sunday', null),
    (12, 'Friday, Saturday & Sunday', 'Day'),
    (13, 'Friday, Saturday & Sunday', 'Weekend');

INSERT INTO Camping_Spot (CampingSpotID, CampingType) VALUES 
(1, 'basic'),
(2, 'premium');

INSERT INTO Attendee (AttendeeID, Forename, Surname, DateOfBirth, EmailAddress, PhoneNumber)
VALUES
    (1, 'Amelia', 'Carter', '1998-02-14', 'amelia.carter98@gmail.com', 07456812943),
    (2, 'Joshua-Phillip', 'Bennett', '1985-07-23', 'jp.bennett85@yahoo.com', 07921443876),
    (3, 'Sophia', 'Clarke-Jones', '2001-11-09', null, 07834229510),
    (4, 'Ethan', 'Hughes', '1992-05-30', 'ethan.h92@hotmail.com', 07765903421),
    (5, 'Olivia', 'Patel', '1999-12-18', 'olivia.patel99@gmail.com', 07988134562),
    (6, 'Daniel', 'OConnor', '1983-04-02', null, 07812765430),
    (7, 'Grace', 'Thompson-Wells', '1995-08-27', 'grace.tw95@icloud.com', 07432118907),
    (8, 'Lucas', 'Morgan', '2000-01-11', 'lucas.morgan00@btinternet.com', 07954882310),
    (9, 'Isabella-Scarlett', 'Wright', '1987-10-05', null, 07890334521),
    (10, 'Henry', 'Foster', '1994-06-21', 'henry.f94@outlook.com', 0772155684),
    (11, 'Chloe', 'Richardson', '2002-03-16', 'chloe.rich02@gmail.com', 07967441208),
    (12, 'Samuel', 'Greenfield', '1989-09-08', null, 07489223765),
    (13, 'Ava-Mae', 'Mitchell-Brown', '1997-05-29', 'avamae.mb97@outlook.com', 07843556210),
    (14, 'Benjamin', 'Taylor', '1981-12-12', 'ben.taylor81@yahoo.com', 07912674830),
    (15, 'Lily', 'Anderson', '1996-07-03', null, 07876552109),
    (16, 'Noah', 'Edwards', '2003-01-25', 'noah.edwards03@gmail.com', 07743118920),
    (17, 'Emily', 'Harrison-Smith', '1990-10-07', 'emily.hs90@outlook.com', 07965443812),
    (18, 'Jack', 'Robinson', '1984-04-19', null, 07821990543),
    (19, 'Mia', 'Davies', '2005-02-01', 'mia.davies@hotmail.com', 07897112430),
    (20, 'Thomas', 'Gallagher', '1991-08-22', 'thomas.g91@icloud.com', 07789334210),
    (21, 'Harper', 'Lewis-James', '1998-11-15', null, 07854229876),
    (22, 'George-Isaac', 'Williams', '1986-06-04', 'gi.williams86@yahoo.com', 07932441765),
    (23, 'Ella', 'Brooks', '1993-09-28', 'ella.brooks93@gmail.com', 07865118932),
    (24, 'Matthew', 'Kennedy', '1982-12-10', null, 07712556908),
    (25, 'Freya', 'Coleman', '2004-02-26', 'freya.c04@yahoo.com', 07932118765),
    (26, 'Alexander', 'Reed', '1989-01-18', 'alex.reed89@outlook.com', 07865443210),
    (27, 'Charlie', 'Evans', '2000-10-13', null, 07765118943),
    (28, 'Lily-Mae', 'Carter-Jones', '1998-04-12', 'lilymae.carterjones@example.com', 07712845392),
    (29, 'John-Paul', 'McBride', '1987-11-03', 'johnpaul.mcbride@example.com', 07983114520),
    (30, 'Ava-Rose', 'Turner-Reed', '2001-02-19', null, 07864992341),
    (31, 'Lucas', 'Bennett', '1995-09-27', 'lucas.bennett@example.com', 07455673829),
    (32, 'Chloe-Anne', 'Harrington', '1999-06-08', 'chloeanne.harrington@example.com', 07591447203),
    (33, 'Oliver', 'Shaw-Miller', '1985-12-30', null, 07821330945),
    (34, 'Mia-Louise', 'Patel', '2002-08-14', 'mialouise.patel@example.com', 07902118734),
    (35, 'Ethan', 'O’Connell', '1993-03-22', 'ethan.oconnell@example.com', 07788540129),
    (36, 'Grace-Elise', 'Whitfield', '1990-01-05', null, 07366904512),
    (37, 'Isaac', 'Thompson-Gray', '1997-10-11', 'isaac.thompsongray@example.com', 07895221407),
    (38, 'Ruby-Jean', 'Sinclair', '2000-07-29', 'rubyjean.sinclair@example.com', 07504667981),
    (39, 'Harvey', 'Douglas', '1988-05-16', null, 07971503842),
    (40, 'Ella-Rae', 'Fraser-King', '1996-09-02', 'ellarae.fraserking@example.com', 07492118650);

INSERT INTO Ticket (TicketID, Price, ValidFrom, ValidTill, AttendeeID, TicketTypeID, CampingSpotID)
VALUES
    (1, 100.00, '2026-08-28', '2026-08-28', 1, 1, null),
    (2, 124.50, '2026-08-28', '2026-08-28', 2, 2, null),
    (3, 100.00, '2026-08-29', '2026-08-29', 3, 3, null),
    (4, 124.50, '2026-08-29', '2026-08-29', 4, 4, null),
    (5, 100.00, '2026-08-30', '2026-08-30', 5, 5, null),
    (6, 124.50, '2026-08-30', '2026-08-30', 6, 6, null),
    (7, 175.00, '2026-08-28', '2026-08-29', 7, 7, null),
    (8, 225.00, '2026-08-28', '2026-08-29', 8, 7, 1),
    (9, 271.50, '2026-08-28', '2026-08-29', 9, 7, 2),
    (10, 199.50, '2026-08-28', '2026-08-29', 10, 8, null),
    (11, 249.50, '2026-08-28', '2026-08-29', 11, 8, 1),
    (12, 296.00, '2026-08-28', '2026-08-29', 12, 8, 2),
    (13, 175.00, '2026-08-29', '2026-08-30', 13, 9, null),
    (14, 225.00, '2026-08-29', '2026-08-30', 14, 9, 1),
    (15, 271.50, '2026-08-29', '2026-08-30', 15, 9, 2),
    (16, 199.50, '2026-08-29', '2026-08-30', 16, 10, null),
    (17, 249.50, '2026-08-29', '2026-08-30', 17, 10, 1),
    (18, 296.00, '2026-08-29', '2026-08-30', 18, 10, 2),
    (19, 287.50, '2026-08-28', '2026-08-30', 19, 11, null),
    (20, 387.50, '2026-08-28', '2026-08-30', 20, 11, 1),
    (21, 480.50, '2026-08-28', '2026-08-30', 21, 11, 2),
    (22, 312.00, '2026-08-28', '2026-08-30', 22, 12, null),
    (23, 412.00, '2026-08-28', '2026-08-30', 23, 12, 1),
    (24, 505.00, '2026-08-28', '2026-08-30', 24, 12, 2),
    (25, 360.00, '2026-08-28', '2026-08-30', 25, 13, null),
    (26, 460.00, '2026-08-28', '2026-08-30', 26, 13, 1),
    (27, 553.00, '2026-08-28', '2026-08-30', 27, 13, 2),
    (28, 460.00, '2026-08-28', '2026-08-30', 28, 13, 1),
    (29, 505.00, '2026-08-28', '2026-08-30', 29, 12, 2),
    (30, 312.00, '2026-08-28', '2026-08-30', 30, 12, null),
    (31, 387.50, '2026-08-28', '2026-08-30', 31, 11, 1),
    (32, 296.00, '2026-08-29', '2026-08-30', 32, 10, 2),
    (33, 199.50, '2026-08-29', '2026-08-30', 33, 10, null),
    (34, 225.00, '2026-08-29', '2026-08-30', 34, 9, 1),
    (35, 296.00, '2026-08-28', '2026-08-29', 35, 8, 2),
    (36, 199.50, '2026-08-28', '2026-08-29', 36, 8, null),
    (37, 225.00, '2026-08-28', '2026-08-29', 37, 7, 1),
    (38, 124.50, '2026-08-30', '2026-08-30', 38, 6, null),
    (39, 124.50, '2026-08-29', '2026-08-29', 39, 4, null),
    (40, 124.50, '2026-08-28', '2026-08-28', 40, 2, null);

INSERT INTO Event_Agenda (EventAgendaID, EventAgendaName, EventAgendaType, EventAgendaDay, EventAgendaTime, NMEventID)
VALUES
    (1, 'The Coffee Caravan', 'Coffees, cold brews, and special lattes', 'Everyday', '09:00:00', 5),
    (2, 'Sunrise Bites', 'Croissants, fruit, and breakfast wraps', 'Everyday', '09:30:00', 5),
    (3, 'Willow & Thread', 'Handwoven textiles and eco-firendly fabric accessories', 'Everyday', '09:30:00', 4),
    (4, 'Clay & Kiln Creations', 'Artisan pottery with ceramic art pieces', 'Everyday', '09:30:00', 4),
    (5, 'Juice Junction', 'Fresh juices, smoothies, and detox blends', 'Everyday', '10:00:00', 5),
    (6, 'Taste of Morocco', 'Tangines, couscous, and sweet pastries', 'Everyday', '10:30:00', 5),
    (7, 'Mediterranean Mezze', 'Greek gyros, falafel wraps and hummus platters', 'Everyday', '11:00:00', 5),
    (8, 'Tokyo Street Eats', 'Sushi rolls, takoyaki, and ramen bowls', 'Everyday', '12:00:00', 5),
    (9, 'Napoli Pizza Oven', 'Wood-fired pizzas with classic italian toppings', 'Everyday', '12:00:00', 5),
    (10, 'Caribbean Flavours', 'Jerk chicken, fritters, and coconut rice', 'Everyday', '12:00:00', 5),
    (11, 'The Wooden Whittle', 'Hand-carved wooden toys and utensils', 'Everyday', '12:30:00', 4),
    (12, 'Gemstone Glow', 'Unique jewelry with semi-precious stones and crystals', 'Everyday', '12:30:00', 4),
    (13, 'Paper Petals Studio', 'Origami art, greeting cards, and floral decorations', 'Everyday', '12:30:00', 4),
    (14, 'Craft Brews & Ciders', 'Beers, lagers, and ciders', 'Everyday', '13:30:00', 5),
    (15, 'Retro Corner', 'Classic arcade games', 'Everyday', '14:00:00', 7),
    (16, 'Sports & Skill Zone', 'Basketball hoops and air hockey tables', 'Everyday', '14:00:00', 7),
    (17, 'Family Games Area', 'Giant Jenga, Connect Four, and trivia', 'Everyday', '14:00:00', 7),
    (18, 'La Taqueria Mexicana', 'Tacos, burritos, and nachos', 'Everyday', '14:30:00', 5),
    (19, 'Solo Set', 'Free range of available gym equipment', 'Everyday', '15:00:00', 6),
    (20, 'Bombay Spice Kitchen', 'Curries, samosas, and naan breads', 'Everyday', '16:00:00', 5),
    (21, 'Seoul BBQ Shack', 'Bulgogi beef, kimchi pancakes, and spicy fried chicken', 'Everyday', '14:30:00', 5),
    (22, 'Morning Yoga Flow', 'Gentle, guided yoga session', 'Friday', '11:00:00', 6),
    (23, 'The Contemporary Canvas', 'Modern and experimental artworks', 'Friday', '11:30:00', 3),
    (24, 'Echoes in the Fog', 'Mystery/Thriller about an old shipwreck', 'Friday', '12:00:00', 2),
    (25, 'Punchline Pilots', 'Duo who fly through jokes', 'Friday', '13:00:00', 1),
    (26, 'Tai Chi', 'Slow, flowing martial arts movements', 'Friday', '13:30:00', 6),
    (27, 'Neon Reverie', 'Sci-Fi where dreams are broadcast', 'Friday', '14:00:00', 2),
    (28, 'Giggle Mechanics', 'Group that fixes bad moods', 'Friday', '15:00:00', 1),
    (29, 'The Last Laugh Cafe', 'Comedy/Drama where a diner becomes a stand-up hub', 'Friday', '16:00:00', 2),
    (30, 'The Awkward Pause', 'Solo act thriving on cringe humour and silences', 'Friday', '17:00:00', 1),
    (31, 'Ashes of Tomorrow', 'Post-Apocalyptic Action about a nuclear winter', 'Friday', '18:00:00', 2),
    (32, 'Banana Peel Society', 'Troupe dedicated to physical comedy', 'Friday', '19:00:00', 1),
    (33, 'Paper Hearts', 'Romance about two rival origami artists', 'Friday', '20:00:00', 2),
    (34, 'Laugh Track Rebels', 'Parody act mocking sitcoms', 'Friday', '21:00:00', 1),
    (35, 'Mindfulness Meditation Circle', 'Focused on breathing techniques and mental clarity', 'Saturday', '11:00:00', 6),
    (36, 'Cultural Heritage', 'Traditional crafts and folk art', 'Saturday', '11:30:00', 3),
    (37, 'The Clockmakers Apprentice', 'Fantasy where a clock can manipulate time', 'Saturday', '12:00:00', 2),
    (38, 'Snicker Snackers', 'Improv team devouring everyday situations', 'Saturday', '13:00:00', 1),
    (39, 'Zooming Zumba', 'High energy dance fitness session', 'Saturday', '13:30:00', 6),
    (40, 'Silent Strings', 'Musical/Drama about a deaf violinist', 'Saturday', '14:00:00', 2),
    (41, 'Oops! All Jokes', 'Sketch group where everything goes wrong', 'Saturday', '15:00:00', 1),
    (42, 'Beneath the iron Sky', 'Historical War Drama about soldiers in WW2', 'Saturday', '16:00:00', 2),
    (43, 'The Sarcasm Club', 'Collective with dry wit', 'Saturday', '17:00:00', 1),
    (44, 'Pixel Ghosts', 'Horror about a haunted video game', 'Saturday', '18:00:00', 2),
    (45, 'Tickle Me Tuesdays', 'Solo act with silly humour', 'Saturday', '19:00:00', 1),
    (46, 'The Greenhouse Effect', 'Eco-Thriller about a plan to weaponize climate change', 'Saturday', '20:00:00', 2),
    (47, 'Mic Drop Misfits', 'Group who end with classic one-liners', 'Saturday', '21:00:00', 1),
    (48, 'Sound Bath Therapy', 'Immersive relaxation using gongs and chimes', 'Sunday', '11:00:00', 6),
    (49, 'Nature & Wellness', 'Inspired by the natural world', 'Sunday', '11:30:00', 3),
    (50, 'Midnight Carousel', 'Psychological Thriller where a carnival ride traps its riders', 'Sunday', '12:00:00', 2),
    (51, 'The Chuckle Factory', 'Ensemble using well-crafted sketches', 'Sunday', '13:00:00', 1),
    (52, 'Cardio Kickboxing', 'Martial arts-inspired moves with aerobic conditioning', 'Sunday', '13:30:00', 6),
    (53, 'Golden Horizon', 'Adventure about a hunt for a mythical city', 'Sunday', '14:00:00', 2),
    (54, 'Irony & Onions', 'Solo act layering absurdity with humour', 'Sunday', '15:00:00', 1),
    (55, 'Threads of Fate', 'Fantasy Romance where two souls are connected by thread', 'Sunday', '16:00:00', 2),
    (56, 'Stage Fright Delight', 'Solo act thriving on nervousness', 'Sunday', '17:00:00', 1),
    (57, 'The Algorithm', 'Tech Drama where AI predicts human behaviour', 'Sunday', '18:00:00', 2),
    (58, 'The Belly Laugh Brigade', 'Troupe with boisterous humour', 'Sunday', '19:00:00', 1),
    (59, 'Cider & Smoke', 'Indie Slice-of-Life about a small-town pub', 'Sunday', '20:00:00', 2),
    (60, 'Oops, Wrong Punchline!', 'Duo that deliberatly derail the joke', 'Sunday', '21:00:00', 1);

INSERT INTO Schedule (ScheduleID, Reminder, AttendeeID, PerformanceID, EventAgendaID)
VALUES
    (1, 0, 11, 4, 22),
    (2, 0, 11, 15, null),
    (3, 0, 11, 19, null),
    (4, 0, 11, 27, 46),
    (5, 1, 4, 5, 32),
    (6, 1, 4, 17, null),
    (7, 1, 27, 3, 24),
    (8, 1, 27, 13, null),
    (9, 1, 27, 29, null),
    (10, 1, 27, 32, null),
    (11, 1, 27, 41, 52),
    (12, 1, 27, 47, 60),
    (13, 0, 38, 39, 48),
    (14, 0, 38, 51, 57),
    (15, 0, 8, 21, 40),
    (16, 0, 8, 34, null),
    (17, 0, 8, 44, null),
    (18, 0, 8, 49, null),
    (19, 1, 15, 18, 39),
    (20, 1, 15, 26, 45),
    (21, 1, 15, 37, null),
    (22, 1, 15, 46, null),
    (23, 1, 30, 1, 26),
    (24, 1, 30, 10, 33),
    (25, 1, 30, 22, 36),
    (26, 1, 30, 33, null),
    (27, 1, 30, 42, 50),
    (28, 1, 30, 48, 56),
    (29, 0, 40, 1, null),
    (30, 0, 40, 11, null);

DELETE FROM Artist -- delete from Performance and Schedule also
WHERE ArtistID = 42; -- Retro Spectrum, PerformanceID = 32, 50, ScheduleID = 10

DELETE FROM Non_Musical_Event -- delete from Event Agenda and Schedule also
WHERE NMEventID = 3; -- Art Gallery, EventAgendaID = 23, 36, 49, ScheduleID = 25

DELETE FROM Attendee -- delete from Ticket and Schedule also
WHERE AttendeeID = 4; -- Ethan Hughes, TicketID = 4, ScheduleID = 5, 6

UPDATE Performance -- for missing artist
SET ArtistID = 18, -- Twilight Serenaders to Post Malogne
	StageID = 1, -- Main Stage, new headliner
    PerformanceTime = '20:30:00' -- fill in gap
WHERE PerformanceID = 49; -- originally Sunday 20:00

UPDATE Artist -- update Stage also
JOIN Performance ON Performance.ArtistID = Artist.ArtistID
JOIN Stage ON Stage.StageID = Performance.StageID -- PerformanceID association
SET Artist.MusicGenre = 'Folk and lo-fi hip-hop', -- Post Malogne, ArtistID = 18
	Stage.StageName = 'The Horizon' -- Main Stage, StageID = 1
WHERE Performance.PerformanceID = 49; -- Sunday 20:30

UPDATE Performance -- for missing artist
SET ArtistID = 25, -- Digital Dreams to The Kill-Joy Division
	PerformanceTime = '21:30:00' -- fill in gap on Sunday
WHERE PerformanceID = 51; -- Groove Grounds, StageID = 2

UPDATE Performance -- for missing artist
SET ArtistID = 12 -- Thunder Echoes to Nine-Inch Snails
WHERE PerformanceID = 43; -- Sunday 16:30, Rock Riff Ridge, StageID = 4

UPDATE Performance -- for missing artist
SET ArtistID = 32 -- Harmonic Dusk to Polar Groove
WHERE PerformanceID = 36; -- Sunday 12:30, Chillout Lounge, StageID = 5

UPDATE Performance -- for time clash
SET PerformanceTime = '15:30:00' -- Lady Baba at 15:00
WHERE PerformanceID = 6; -- Friday, Oceanic Drift, Chillout Lounge

UPDATE Performance -- for time clash
SET PerformanceTime = '18:30:00' -- Metalicalica at 18:00
WHERE PerformanceID = 11; -- Friday, Echoes of Nowhere, Chillout Lounge

UPDATE Performance -- for time clash
SET PerformanceTime = '21:30:00' -- Neon Grooves at 21:00
WHERE PerformanceID = 16; -- Friday, Harmonic Dusk, Chillout Lounge

SELECT Event_Agenda.EventAgendaID, 
	   Event_Agenda.EventAgendaName,
       Event_Agenda.EventAgendaType,
       Event_Agenda.EventAgendaDay,
       Event_Agenda.EventAgendaTime, -- retrieve Event Agenda informantion
       Non_Musical_Event.EventName AS EventLocation -- with corresponding Non-Musical Event
FROM Event_Agenda
JOIN Non_Musical_Event -- view Non-Musical Event info for whole weekend
	ON Event_Agenda.NMEventID = Non_Musical_Event.NMEventID
ORDER BY Event_Agenda.EventAgendaID; -- events shown in chronological order

SELECT Schedule.ScheduleID,
	   Attendee.Forename,
       Attendee.Surname, -- retrieve Attendee's name
       Event_Agenda.EventAgendaName,
       Event_Agenda.EventAgendaDay,
       Event_Agenda.EventAgendaTime, -- with scheduled Non-Musical Events
       Non_Musical_Event.EventName AS EventLocation
FROM Attendee
JOIN Schedule -- view personal schedule of events
	ON Attendee.AttendeeID = Schedule.AttendeeID
JOIN Event_Agenda
	ON Schedule.EventAgendaID = Event_Agenda.EventAgendaID
JOIN Non_Musical_Event
	ON Event_Agenda.NMEventID = Non_Musical_Event.NMEventID
WHERE Attendee.AttendeeID = 11; -- specific personal schedule

SELECT Performance.PerformanceID,
	   Performance.PerformanceDay,
       Performance.PerformanceTime, -- retrieve Performance information
       Artist.ArtistName,
       Artist.MusicGenre, -- with Artist Name and Music
       Stage.StageName AS PerformanceLocation -- with designated Stage
FROM Performance -- view Performance line-up for whole weekend
JOIN Artist 
	ON Performance.ArtistID = Artist.ArtistID
JOIN Stage
	ON Performance.StageID = Stage.StageID
ORDER BY Performance.PerformanceID; -- performances shown in chronological order

SELECT Schedule.ScheduleID,
	   Attendee.Forename,
       Attendee.Surname, -- retrieve Attendee's name
       Performance.PerformanceDay,
       Performance.PerformanceTime, -- with scheduled Performances
       Artist.ArtistName, -- who is performing
       Stage.StageName AS PerformanceLocation
FROM Schedule -- view personal schedule of performances
JOIN Attendee
	ON Schedule.AttendeeID = Attendee.AttendeeID
JOIN Performance
	ON Schedule.PerformanceID = Performance.PerformanceID
JOIN Artist
	ON Performance.ArtistID = Artist.ArtistID
JOIN Stage
	ON Performance.StageID = Stage.StageID
WHERE Attendee.AttendeeID = 27 -- specific personal schedule
ORDER BY Schedule.ScheduleID; -- in order of when scheduled

SELECT Attendee.Surname,
       Attendee.Forename, -- retrieve attendee's name
	   Ticket.TicketID,
       Ticket.ValidFrom,
       Ticket.ValidTill, -- with ticket details
       Ticket_Type.VIP, -- VIP status
       Camping_Spot.CampingType, -- camping choice
       Ticket.Price
FROM Ticket
JOIN Attendee
	ON Ticket.AttendeeID = Attendee.AttendeeID
LEFT JOIN Ticket_Type -- keeps tickets with no VIP
	ON Ticket.TicketTypeID = Ticket_Type.TicketTypeID
LEFT JOIN Camping_Spot -- keeps tickets with no camping
	ON Ticket.CampingSpotID = Camping_Spot.CampingSpotID
ORDER BY Attendee.Surname, Attendee.Forename; -- alphabetical order

SELECT Camping_Spot.CampingType,
	   Ticket_Type.EntryDays,
       Ticket_Type.VIP,
       COUNT(Ticket.TicketID) AS TicketsSold, -- total tickets sold per Camping Type and Ticket Type
       SUM(Ticket.Price) AS TotalRevenue -- total revenue for each camping and ticket combination
FROM Ticket
JOIN Ticket_Type
	ON Ticket.TicketTypeID = Ticket_Type.TicketTypeID
LEFT JOIN Camping_Spot -- keeps tickets with no camping
	ON Ticket.CampingSpotID = Camping_Spot.CampingSpotID
GROUP BY Camping_Spot.CampingType,
	     Ticket_Type.EntryDays,
         Ticket_Type.VIP -- groups results by Camping Type, Entry Days, and VIP status
ORDER BY TicketsSold DESC, TotalRevenue DESC; -- most to least sold, then highest to lowest revenue

SELECT Attendee.Forename,
	   Attendee.Surname,
       COUNT(DISTINCT Attendee.AttendeeID) AS TotalAttendees,
       CASE
			WHEN Ticket.CampingSpotID IS NOT NULL THEN 'No'
            ELSE 'Yes'
	   END AS HasCamping
FROM Ticket
JOIN Attendee
	ON Ticket.AttendeeID = Attendee.AttendeeID
WHERE '2026-08-28' BETWEEN Ticket.ValidFrom AND Ticket.ValidTill
GROUP BY Attendee.Forename,
		 Attendee.Surname;
         
SELECT 
    d.FestivalDate, -- specific date being checked
    CASE
			WHEN Ticket.CampingSpotID IS NOT NULL THEN 'No'
            ELSE 'Yes'
	   END AS HasCamping, -- determines whether Attendee has Camping Spot
    COUNT(DISTINCT Attendee.AttendeeID) AS TotalAttendees,
    GROUP_CONCAT(DISTINCT CONCAT(Attendee.Forename, ' ', Attendee.Surname)
                 ORDER BY Attendee.Surname, Attendee.Forename
                 SEPARATOR ', ') AS AttendeeNames -- lists names of all attendees valid on this date
FROM (
    SELECT '2026-08-28' AS FestivalDate
    UNION ALL SELECT '2026-08-29'
    UNION ALL SELECT '2026-08-30'
) AS d -- creates temporary list defining festival dates
JOIN Ticket -- match valid Ticket
    ON d.FestivalDate BETWEEN Ticket.ValidFrom AND Ticket.ValidTill
JOIN Attendee -- join Attendee details
    ON Attendee.AttendeeID = Ticket.AttendeeID
GROUP BY d.FestivalDate, HasCamping -- group results by date and camping status
ORDER BY d.FestivalDate; -- in order of date
