use albums_db;

describe albums;

-- How  many rows are in the albums table?
    -- 31

-- How many unique artist names are in the albums table?
select count( distinct artist) from albums;
    -- 23

-- What is the primary key for the albums table?
    -- id

-- What is the oldest release date for any album in the albums table? What is the most recent release date?
    select min(release_date) from albums;
    -- Oldest: 1967
    select max(release_date) from albums;
    -- Most Recent: 2011
    

-- Write queries to find the following information:
-- a. The name of all albums by Pink Floyd
select name from albums
where artist = 'Pink Floyd';
    -- 'The Dark Side of the Moon'
    -- 'The Wall'
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";
    -- 1967
-- c. The genre for the album Nevermind
select genre from albums 
where name = 'Nevermind';
    -- Grunge, Alternative rock
-- d. Which albums were released in the 1990s
select name from albums 
where release_date between 1990 and 1999;
    /* The Bodyguard
    Jagged Little Pill
    Come On Over
    Falling into You
    Let's Talk About Love
    Dangerous
    The Immaculate Collection
    Titanic: Music from the Motion Picture
    Metallica
    Nevermind
    Supernatural
    */
-- e. Which albums had less than 20 million certified sales
select name from albums
where sales < 20;
    /*
    Grease: The Original Soundtrack from the Motion Picture
    Bad
    Sgt. Pepper's Lonely Hearts Club Band
    Dirty Dancing
    Let's Talk About Love
    Dangerous
    The Immaculate Collection
    Abbey Road
    Born in the U.S.A.
    Brothers in Arms
    Titanic: Music from the Motion Picture
    Nevermind
    The Wall
    */
-- f. All the albums with a genre of 'Rock'. Why do these query results not include albums with a genre of 'Hard rock' or 'Progressive rock'?
    /*
    Sgt. Pepper's Lonely Hearts Club Band
    1
    Abbey Road
    Born in the U.S.A.
    Supernatural
    */
    	-- Because SQL is looking for specifically what we tell it toy