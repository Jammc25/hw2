# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

#done - generated and migrated

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Adding the studio
studios = Studio.new
studios.name = "Warner Bros."
studios.save

#Adding the movies

    #creating dynamic ids for the studio
    warner_bros =Studio.find_by({"name" => "Warner Bros."})

movies = Movie.new
movies.title = "Batman Begins"
movies.year_released = "2005"
movies.rated = "PG-13"
movies.studio_id = warner_bros["id"]
movies.save

movies = Movie.new
movies.title = "The Dark Knight"
movies.year_released = "2008"
movies.rated = "PG-13"
movies.studio_id = warner_bros["id"]
movies.save

movies = Movie.new
movies.title = "The Dark Knight Rises"
movies.year_released = "2012"
movies.rated = "PG-13"
movies.studio_id = warner_bros["id"]
movies.save

#Adding the actors
actors = Actor.new
actors.name = "Christian Bale"
actors.save

actors = Actor.new
actors.name = "Michael Caine"
actors.save

actors = Actor.new
actors.name = "Liam Neeson"
actors.save

actors = Actor.new
actors.name = "Katie Holmes"
actors.save

actors = Actor.new
actors.name = "Gary Oldman"
actors.save

actors = Actor.new
actors.name = "Heath Ledger"
actors.save

actors = Actor.new
actors.name = "Aaron Eckhart"
actors.save

actors = Actor.new
actors.name = "Maggie Gyllenhaal"
actors.save

actors = Actor.new
actors.name = "Tom Hardy"
actors.save

actors = Actor.new
actors.name = "Joseph Gordon-Levitt"
actors.save

actors = Actor.new
actors.name = "Anne Hathaway"
actors.save


#Adding the cast

    #creating dynamic ids for the movies

    batman_begins = Movie.find_by({"title" => "Batman Begins"})

    dark_knight = Movie.find_by({"title" => "The Dark Knight"})

    dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

    #creating dynamic ids for the actors

    bale = Actor.find_by({"name" => "Christian Bale"})

    caine = Actor.find_by({"name" => "Michael Caine"})

    neeson = Actor.find_by({"name" => "Liam Neeson"})

    holmes = Actor.find_by({"name" => "Katie Holmes"})

    oldman = Actor.find_by({"name" => "Gary Oldman"})

    ledger = Actor.find_by({"name" => "Heath Ledger"})

    eckhart = Actor.find_by({"name" => "Aaron Eckhart"})

    gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})

    hardy = Actor.find_by({"name" => "Tom Hardy"})

    levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})

    hathaway = Actor.find_by({"name" => "Anne Hathaway"})

#Batman Begins roles
roles = Role.new
roles.movie_id = batman_begins["id"]
roles.actor_id = bale["id"]
roles.character_name = "Bruce Wayne"
roles.save

roles = Role.new
roles.movie_id = batman_begins["id"]
roles.actor_id = caine["id"]
roles.character_name = "Alfred"
roles.save

roles = Role.new
roles.movie_id = batman_begins["id"]
roles.actor_id = neeson["id"]
roles.character_name = "Ra's Al Ghul"
roles.save

roles = Role.new
roles.movie_id = batman_begins["id"]
roles.actor_id = holmes["id"]
roles.character_name = "Rachel Dawes"
roles.save

roles = Role.new
roles.movie_id = batman_begins["id"]
roles.actor_id = oldman["id"]
roles.character_name = "Comissioner Gordon"
roles.save

#The Dark Knight roles
roles = Role.new
roles.movie_id = dark_knight["id"]
roles.actor_id = bale["id"]
roles.character_name = "Bruce Wayne"
roles.save

roles = Role.new
roles.movie_id = dark_knight["id"]
roles.actor_id = ledger["id"]
roles.character_name = "Joker"
roles.save

roles = Role.new
roles.movie_id = dark_knight["id"]
roles.actor_id = eckhart["id"]
roles.character_name = "Harvey Dent"
roles.save

roles = Role.new
roles.movie_id = dark_knight["id"]
roles.actor_id = caine["id"]
roles.character_name = "Alfred"
roles.save

roles = Role.new
roles.movie_id = dark_knight["id"]
roles.actor_id = gyllenhaal["id"]
roles.character_name = "Rachel Dawes"
roles.save

#The Dark Knight Rises roles
roles = Role.new
roles.movie_id = dark_knight_rises["id"]
roles.actor_id = bale["id"]
roles.character_name = "Bruce Wayne"
roles.save

roles = Role.new
roles.movie_id = dark_knight_rises["id"]
roles.actor_id = oldman["id"]
roles.character_name = "Comissioner Gordon"
roles.save

roles = Role.new
roles.movie_id = dark_knight_rises["id"]
roles.actor_id = hardy["id"]
roles.character_name = "Bane"
roles.save

roles = Role.new
roles.movie_id = dark_knight_rises["id"]
roles.actor_id = levitt["id"]
roles.character_name = "John Blake"
roles.save

roles = Role.new
roles.movie_id = dark_knight_rises["id"]
roles.actor_id = hathaway["id"]
roles.character_name = "Selina Kyle"
roles.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all

for film in movies
    puts "#{film["title"]} #{film["year_released"]} #{film["rated"]} #{film["studio_id"]}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles = Role.all

for line in roles
    puts "#{line["movie_id"]} #{line["actor_id"]} #{line["character_name"]}"
end