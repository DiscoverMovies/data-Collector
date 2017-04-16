
#Creating the schema if it does not exist already
CREATE DATABASE IF NOT EXISTS discoverMovie;
USE discoverMovie;


# table 1 : movie
CREATE TABLE IF NOT EXISTS movie(
  id INT PRIMARY KEY ,
  imdbid CHAR(9) NOT NULL UNIQUE ,
  title TEXT NOT NULL ,
  original_title varchar(100) NOT NULL ,
  collection_id INT DEFAULT NULL ,
  language VARCHAR(100) NOT NULL ,
  overview MEDIUMTEXT,
  popularity DECIMAL(3,1),
  poster_url TEXT,
  release_date DATE NOT NULL ,
  runtime INT,
  vote_avg DECIMAL(3,1) ,
  vote_count INT ,
  tagline TEXT);

#table 2: Genre
CREATE TABLE IF NOT EXISTS genre (
  id INT PRIMARY KEY,
  name CHAR(15) NOT NULL
);

#table 3: Collections
CREATE TABLE IF NOT EXISTS collections(
  id INT PRIMARY KEY ,
  name varchar(100) NOT NULL UNIQUE,
  poster_url varchar(100)
);

#table 4: ProductionCompanies
CREATE TABLE IF NOT EXISTS production_companies(
  id INT PRIMARY KEY,
  name varchar(100) NOT NULL
);

#table 5: department
CREATE TABLE IF NOT EXISTS department(
  id INT PRIMARY KEY ,
  name varchar(100) NOT NULL
);

#table 6: Crew
CREATE TABLE IF NOT EXISTS crew(
  id INT PRIMARY KEY ,
  name varchar(100) NOT NULL,
  dept VARCHAR(100) NOT NULL,
  UNIQUE (name,dept)
);

#table 7: Actors
CREATE TABLE IF NOT EXISTS actors(
  id INT PRIMARY KEY,
  name varchar(100) NOT NULL
);




####################################
##### Following are Relations ######
####################################

# relation 1: MovieGenre
CREATE TABLE IF NOT EXISTS movie_genre(
  mid INT,
  gid INT,
  PRIMARY KEY (mid,gid),

  FOREIGN KEY (mid)
  REFERENCES movie(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  FOREIGN KEY (gid)
  REFERENCES genre(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

# relation 2: Produced_by
CREATE TABLE IF NOT EXISTS produced_by(
  mid INT,
  pid INT,
  PRIMARY KEY (mid,pid),

  FOREIGN KEY (mid)
  REFERENCES movie(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  FOREIGN KEY (pid)
  REFERENCES production_companies(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

#relation 3: cast
CREATE TABLE IF NOT EXISTS appears_on(
  mid INT,
  aid INT,
  character_name TEXT,

  PRIMARY KEY (mid,aid),

  FOREIGN KEY (mid)
  REFERENCES movie(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  FOREIGN KEY (aid)
  REFERENCES actors(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

#relation 4: worked_on
CREATE TABLE IF NOT EXISTS worked_on(
  mid INT,
  cid INT,
  PRIMARY KEY (mid,cid),

  FOREIGN KEY (mid)
  REFERENCES movie(id)
    ON DELETE CASCADE ON UPDATE CASCADE,

  FOREIGN KEY (cid)
  REFERENCES crew(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);