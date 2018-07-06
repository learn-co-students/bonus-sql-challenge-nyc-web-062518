# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "sqlite3"
require 'csv'

db = SQLite3::Database.new "db/my_database.db"

# Create a database
rows = db.execute <<-SQL
  create table users (
    year INTEGER,
    GoogleKnowlege_Occupation TEXT,
    Show DATETIME,
    Group TEXT,
    Raw_Guest_List TEXT
  );
SQL

csv = <<CSV
YEAR,GoogleKnowlege_Occupation,Show,Group,Raw_Guest_List
1999,actor,1/11/99,Acting,Michael J. Fox
1999,Comedian,1/12/99,Comedy,Sandra Bernhard
1999,television actress,1/13/99,Acting,Tracey Ullman
1999,film actress,1/14/99,Acting,Gillian Anderson
1999,actor,1/18/99,Acting,David Alan Grier
1999,actor,1/19/99,Acting,William Baldwin
1999,Singer-lyricist,1/20/99,Musician,Michael Stipe
1999,model,1/21/99,Media,Carmen Electra
1999,actor,1/25/99,Acting,Matthew Lillard
1999,stand-up comedian,1/26/99,Comedy,David Cross
1999,actress,1/27/99,Acting,Yasmine Bleeth
1999,actor,1/28/99,Acting,D. L. Hughley
1999,television actress,10/18/99,Acting,Rebecca Gayheart
1999,Comedian,10/19/99,Comedy,Steven Wright
1999,actress,10/20/99,Acting,Amy Brenneman
1999,actress,10/21/99,Acting,Melissa Gilbert
1999,actress,10/25/99,Acting,Cathy Moriarty
1999,comedian,10/26/99,Comedy,Louie Anderson
1999,actress,10/27/99,Acting,Sarah Michelle Gellar
1999,Singer-songwriter,10/28/99,Musician,Melanie C
1999,actor,10/4/99,Acting,Greg Proops
1999,television personality,10/5/99,Media,Maury Povich
1999,actress,10/6/99,Acting,Brooke Shields
1999,Comic,10/7/99,Comedy,Molly Shannon
1999,actor,11/1/99,Acting,Chris O'Donnell
1999,actress,11/15/99,Acting,Christina Ricci
1999,Singer-songwriter,11/16/99,Musician,Tori Amos
1999,actress,11/17/99,Acting,Yasmine Bleeth
1999,comedian,11/18/99,Comedy,Bill Maher
1999,actress,11/2/99,Acting,Jennifer Love Hewitt
1999,rock band,11/29/99,Musician,Goo Goo Dolls
1999,musician,11/3/99,Musician,Dave Grohl
1999,Film actor,11/30/99,Acting,Stephen Rea
1999,Model,11/4/99,Media,Roshumba Williams
1999,television actress,11/8/99,Acting,Kellie Martin
1999,actress,11/9/99,Acting,Kathy Griffin
1999,actress,12/1/99,Acting,Laura San Giacomo
1999,journalist,12/13/99,Media,Joan Lunden
1999,actress,12/14/99,Acting,Shannen Doherty
1999,NA,12/15/99,NA,Greatest Millennium Special
1999,comedian,12/16/99,Comedy,George Carlin
1999,actor,12/2/99,Acting,Michael Boatman
1999,actor,12/20/99,Acting,David Boreanaz
1999,singer-songwriter,12/21/99,Musician,Jewel
1999,actor,12/6/99,Acting,Paul Rudd
1999,us senator,12/7/99,Politician,"Senator Bob Dole, part 1"
1999,us senator,12/8/99,Politician,"Senator Bob Dole, part 2"
1999,actor,12/9/99,Acting,Rob Schneider
1999,comedian,2/1/99,Comedy,George Carlin
1999,actress,2/10/99,Acting,"Pamela Anderson, Natalie Raitano, Molly Culver"
1999,actress,2/10/99,Acting,"Pamela Anderson, Natalie Raitano, Molly Culver"
1999,actress,2/10/99,Acting,"Pamela Anderson, Natalie Raitano, Molly Culver"
1999,film actor,2/11/99,Acting,Daniel Stern
1999,actress,2/16/99,Acting,Melina Kanakaredes
1999,comedian,2/17/99,Comedy,Ed McMahon
1999,actor,2/18/99,Acting,Mike Judge
1999,actor,2/2/99,Acting,Dave Foley
1999,television actress,2/3/99,Acting,Kellie Martin
1999,actor,2/4/99,Acting,Jerry O'Connell
1999,actress,2/8/99,Acting,Melissa Gilbert
1999,actor,2/9/99,Acting,Brendan Fraser
1999,pianist,3/1/99,Musician,John Tesh
1999,Vocalist,3/10/99,Musician,Sammy Hagar
1999,rock band,3/11/99,Musician,"Hootie & the Blowfish, Billy Crystal"
1999,actor,3/11/99,Acting,"Hootie & the Blowfish, Billy Crystal"
1999,Film actor,3/15/99,Acting,Peter Krause
1999,musician,3/16/99,Musician,Chris Isaak
1999,writer,3/17/99,Media,"Frank DeCaro's Oscar Special, John Larroquette"
1999,actor,3/17/99,Acting,"Frank DeCaro's Oscar Special, John Larroquette"
1999,actor,3/18/99,Acting,Joseph Gordon-Levitt
1999,actor,3/2/99,Acting,Eric McCormack
1999,actress,3/22/99,Acting,Jennifer Grey
1999,Stand-up comedian,3/23/99,Comedy,Norm Macdonald
1999,actress,3/24/99,Acting,Sandra Bullock
1999,actress,3/25/99,Acting,Janine Turner
1999,Film director,3/29/99,Media,Ron Howard
1999,actress,3/3/99,Acting,Jeri Ryan
1999,actor,3/30/99,Acting,Omar Epps
1999,actress,3/31/99,Acting,Diane Lane
1999,actor,3/4/99,Acting,Ryan Phillippe
1999,actor,3/8/99,Acting,Ian McKellen
1999,actor,3/9/99,Acting,Jon Voight
1999,actor,4/1/99,Acting,Stephen Baldwin
1999,actor,4/12/99,Acting,Ernie Hudson
1999,film actor,4/13/99,Acting,Josh Charles
1999,actor,4/14/99,Acting,Jackie Chan
1999,actress,4/15/99,Acting,Marlee Matlin
1999,actress,4/19/99,Acting,Sharon Lawrence
1999,actor,4/20/99,Acting,Rob Estes
1999,actress,4/21/99,Acting,Angelina Jolie
1999,stand-up comedian,4/22/99,Comedy,David Spade
1999,actor,4/26/99,Acting,Seth Green
1999,actress,4/27/99,Acting,Sheryl Lee Ralph
1999,singer,4/28/99,Musician,Chris Robinson
1999,comedian,4/29/99,Comedy,Joy Behar
1999,actor,5/10/99,Acting,Thomas Gibson
1999,actress,5/11/99,Acting,Paula Cale
1999,actor,5/12/99,Acting,Ted Danson
1999,actor,5/13/99,Acting,Esai Morales
1999,actress,5/17/99,Acting,Jane Seymour
1999,Comedian,5/18/99,Comedy,Robert Schimmel
1999,actress,5/19/99,Acting,Camryn Manheim
1999,actor,5/20/99,Acting,Ray Romano
1999,television actress,5/24/99,Acting,Patricia Richardson
1999,actress,5/25/99,Acting,Suzanne Somers
1999,actress,5/26/99,Acting,Natalie Portman
1999,actor,5/27/99,Acting,Jamie Foxx
1999,actor,6/10/99,Acting,Timothy Hutton
1999,actor,6/14/99,Acting,Mike Myers
1999,actor,6/15/99,Acting,Rob Lowe
1999,actor,6/16/99,Acting,Mike Myers
1999,actress,6/17/99,Acting,Heather Graham
1999,film actress,6/21/99,Acting,Felicity Huffman
1999,television host,6/22/99,Media,Jimmy Kimmel
1999,actor,6/23/99,Acting,Adam Sandler
1999,Stand-up comedian,6/24/99,Comedy,Richard Belzer
1999,Comedian,6/28/99,Comedy,Margaret Cho
1999,actor,6/29/99,Acting,Scott Wolf
1999,actress,6/30/99,Acting,Roseanne Barr
1999,singer,6/7/99,Musician,Harry Connick Jr.
1999,comedian,6/8/99,Comedy,Caroline Rhea
1999,actor,6/9/99,Acting,Damon Wayans
1999,actor,7/1/99,Acting,Rob Schneider
1999,televison actor,7/12/99,Acting,Adam Arkin
1999,muppet,7/13/99,Media,Miss Piggy
1999,actor,7/14/99,Acting,John Leguizamo
1999,Stand-up comedian,7/15/99,Comedy,Robert Klein
1999,actress,7/19/99,Acting,Christa Miller
1999,stand-up comedian,7/20/99,Comedy,David Brenner
1999,NA,7/21/99,NA,Third Anniversary Special
1999,actress,7/22/99,Acting,Joely Fisher
1999,singer,7/26/99,Musician,Donny Osmond
1999,actress,7/27/99,Acting,Wendie Malick
1999,Vocalist,7/28/99,Musician,Vince Neil
1999,film actress,7/29/99,Acting,Janeane Garofalo
1999,comedian,8/10/99,Comedy,Dom Irrera
1999,actor,8/11/99,Acting,Pierce Brosnan
1999,director,8/12/99,Media,Eduardo Sanchez and Daniel Myrick
1999,film director,8/12/99,Media,Eduardo Sanchez and Daniel Myrick
1999,american television personality,8/16/99,Media,Carson Daly
1999,actress,8/17/99,Acting,Molly Ringwald
1999,actress,8/18/99,Acting,Sarah Jessica Parker
1999,actor,8/19/99,Acting,French Stewart
1999,actress,8/2/99,Acting,Bebe Neuwirth
1999,actress,8/23/99,Acting,Cheryl Ladd
1999,rapper,8/24/99,Musician,LL Cool J
1999,singer-songwriter,8/25/99,Musician,Dwight Yoakam
1999,actress,8/26/99,Acting,Nia Long
1999,actor,8/3/99,Acting,Garry Marshall
1999,NA,8/30/99,NA,The Daily Show Summer Spectacular
1999,actor,8/4/99,Acting,Denis Leary
1999,actor,8/5/99,Acting,Jeffrey Tambor
1999,actor,8/9/99,Acting,Dave Foley
1999,comedian,9/13/99,Comedy,Elayne Boosler
1999,actor,9/14/99,Acting,Tom Green
1999,actor,9/15/99,Acting,Jason Priestley
1999,stand-up comedian,9/16/99,Comedy,David Cross
1999,actor,9/20/99,Acting,Andy Richter
1999,singer,9/21/99,Musician,"Donny Osmond Marie Osmond"
1999,comedian,9/22/99,Comedy,Dave Chappelle
1999,actor,9/23/99,Acting,Steve Zahn
1999,Stand-up comedian,9/27/99,Comedy,Norm Macdonald
1999,actress,9/28/99,Acting,Melissa Joan Hart
1999,Comedian,9/29/99,Comedy,Richard Lewis
1999,actor,9/30/99,Acting,Bruce McCulloch and Mark McKinney
1999,comedian,9/30/99,Comedy,Bruce McCulloch and Mark McKinney
2000,football player,1/10/00,Athletics,Joe Montana
2000,actor,1/11/00,Acting,Will Ferrell
2000,rapper,1/12/00,Musician,Ice Cube
2000,Singer-lyricist,1/13/00,Musician,Michael Stipe
2000,actress,1/17/00,Acting,Penelope Ann Miller
2000,actor,1/18/00,Acting,Frankie Muniz
2000,actor,1/19/00,Acting,Freddie Prinze Jr.
2000,former mayor of cincinatti,1/20/00,Politician,Jerry Springer
2000,Film actress,1/24/00,Acting,Selma Blair
2000,Film actor,1/25/00,Acting,Peter Krause
2000,model,1/26/00,Media,Jenny McCarthy
2000,actor,1/27/00,Acting,David Arquette
2000,actress,1/4/00,Acting,Cynthia Nixon
2000,Singer-songwriter,1/5/00,Musician,Robbie Williams
2000,Stand-up comedian,1/6/00,Comedy,Richard Belzer
2000,singer-songwriter,10/16/00,Musician,Alice Cooper
2000,actor,10/17/00,Acting,Christian Slater
2000,actor,10/18/00,Acting,Joshua Jackson
2000,actor,10/19/00,Acting,Brendan Fraser
2000,actor,10/2/00,Acting,Dean Cain
2000,actor,10/23/00,Acting,Kevin James
2000,comedian,10/24/00,Comedy,Jeff Garlin
2000,businesswoman,10/25/00,Business,Posh Spice & Baby Spice
2000,singer,10/25/00,Musician,Posh Spice & Baby Spice
2000,actor,10/26/00,Acting,Steven Weber
2000,actor,10/3/00,Acting,Ashton Kutcher
2000,actress,10/30/00,Acting,Brett Butler
2000,journalist,10/31/00,Media,David Frost
2000,singer-songwriter,10/4/00,Musician,Jewel
2000,activist,10/5/00,Advocacy,Ralph Nader
2000,Media person,11/1/00,Media,Phil Donahue
2000,actor,11/13/00,Acting,Adam Sandler
2000,actress,11/14/00,Acting,Patricia Arquette
2000,actor,11/15/00,Acting,Adam Sandler
2000,actor,11/16/00,Acting,Rhys Ifans
2000,actor,11/2/00,Acting,Michael Richards
2000,NA,11/20/00,NA,"Tales of Survival with Vance DeGeneres"
2000,actor,11/27/00,Acting,John Goodman
2000,actress,11/28/00,Acting,Laura San Giacomo
2000,film actor,11/29/00,Acting,Billy Campbell
2000,actor,11/30/00,Acting,Anthony Clark
2000,former us senator,11/6/00,Politician,Arlen Specter
2000,american politician,11/7/00,Politician,Bob Dole
2000,Stand-up comedian,11/8/00,Comedy,Richard Belzer
2000,Filmmaker,11/9/00,Media,Michael Moore
2000,radio personality,12/11/00,Media,Ira Glass
2000,commentator,12/12/00,Media,Greta Van Susteren
2000,NA,12/13/00,NA,no guest
2000,Journalist,12/14/00,Media,Wolf Blitzer
2000,actress,12/18/00,Acting,Marla Sokoloff
2000,actress,12/19/00,Acting,Marisa Tomei
2000,actress,12/20/00,Acting,Jeri Ryan
2000,film actress,12/21/00,Acting,Gillian Anderson
2000,actor,12/4/00,Acting,Thomas Gibson
2000,actress,12/5/00,Acting,Faith Ford
2000,actor,12/6/00,Acting,Chris O'Donnell
2000,actor,12/7/00,Acting,Marlon Wayans
2000,actor,2/1/00,Acting,Jeff Bridges
2000,actor,2/1/00,Acting,Vin Diesel
2000,Singer-songwriter,2/14/00,Musician,Moby
2000,actor,2/15/00,Acting,Dennis Farina
2000,actor,2/16/00,Acting,Matthew Perry
2000,comedian,2/17/00,Comedy,Ed McMahon
2000,former senator from kansas,2/2/00,Politician,"Focus on New Hampshire Special, special guest Bob Dole"
2000,actor,2/22/00,Acting,Snoop Dogg
2000,actress,2/23/00,Acting,Charlize Theron
2000,actress,2/24/00,Acting,Rachael Leigh Cook
2000,actor,2/28/00,Acting,Forest Whitaker
2000,actor,2/3/00,Acting,Jason Priestly
2000,actor,3/1/00,Acting,Tobey Maguire
2000,stand-up comedian,3/13/00,Comedy,Eddie Izzard
2000,actress,3/14/00,Acting,Kim Delaney
2000,Journalist,3/15/00,Media,Wolf Blitzer
2000,comedian,3/16/00,Comedy,George Wallace
2000,comedian,3/2/00,Comedy,Ellen DeGeneres
2000,actor,3/20/00,Acting,Chris Meloni
2000,actress,3/21/00,Acting,Marla Sokoloff
2000,comedian,3/22/00,Comedy,Eric Idle
2000,film actress,3/23/00,Acting,Leelee Sobieski
2000,singer-songwriter,3/27/00,Musician,John Lydon
2000,actor,3/28/00,Acting,Joshua Jackson
2000,Reporter,3/29/00,Media,Sam Donaldson
2000,actor,3/30/00,Acting,Jimmy Smits
2000,actor,3/6/00,Acting,Neil Patrick Harris
2000,actor,3/7/00,Acting,Kevin Pollak
2000,american politician,3/8/00,Politician,Bob Dole
2000,comedian,3/9/00,Comedy,Garry Shandling
2000,Singer,4/10/00,Musician,Roger Daltrey
2000,writer,4/11/00,Media,Ben Stein
2000,Film actor,4/12/00,Acting,Patrick Stewart
2000,actor,4/13/00,Acting,David Alan Grier
2000,actor,4/17/00,Acting,Stanley Tucci
2000,actress,4/18/00,Acting,Samantha Mathis
2000,professional wrestler,4/19/00,Athletics,Diamond Dallas Page
2000,former us senator,4/20/00,Politician,Arlen Specter
2000,publisher,4/24/00,Media,Hugh Hefner and Bentley twins
2000,model,4/24/00,Media,Hugh Hefner and Bentley twins
2000,actress,4/25/00,Acting,Kirsten Dunst
2000,film actress,4/26/00,Acting,Jeanne Tripplehorn
2000,actor,4/27/00,Acting,Stephen Baldwin
2000,Film actress,5/1/00,Acting,S. Epatha Merkerson
2000,actor,5/10/00,Acting,Andy Richter
2000,actress,5/11/00,Acting,Betty White
2000,television actress,5/15/00,Acting,Tracey Ullman
2000,actor,5/16/00,Acting,Kyle MacLachlan
2000,actress,5/17/00,Acting,Jane Leeves
2000,actor,5/18/00,Acting,Michael Rapaport
2000,actor,5/2/00,Acting,Luke Wilson
2000,actress,5/3/00,Acting,Julie Warner
2000,actress,5/30/00,Acting,Laura Kightlinger
2000,actress,5/31/00,Acting,Thandie Newton
2000,actor,5/4/00,Acting,Eric Close
2000,actress,5/8/00,Acting,Wendie Malick
2000,actor,5/9/00,Acting,Jesse L. Martin
2000,reality show contestant,6/1/00,Media,Sonja Christopher
2000,actor,6/13/00,Acting,Mark Curry
2000,television host,6/14/00,Media,Jimmy Kimmel & Adam Carolla
2000,comedian,6/14/00,Comedy,Jimmy Kimmel & Adam Carolla
2000,actress,6/15/00,Acting,Julie Brown
2000,writer,6/19/00,Media,Heather Donahue
2000,former press secretary,6/20/00,Political Aide,Joe Lockhart
2000,actor,6/21/00,Acting,Freddie Prinze Jr.
2000,actress,6/22/00,Acting,Alicia Silverstone
2000,comic,6/26/00,Comedy,Cheri Oteri
2000,game show host,6/27/00,Media,Jeff Probst
2000,Guitarist,6/28/00,Musician,Richie Sambora
2000,actor,6/29/00,Acting,John C. Reilly
2000,magician,6/5/00,Media,Penn and Teller
2000,actress,6/6/00,Acting,Kelli Williams
2000,Filmmaker,6/7/00,Media,Michael Moore
2000,actress,7/10/00,Acting,Anna Paquin
2000,actor,7/11/00,Acting,J. K. Simmons
2000,actress,7/12/00,Acting,Famke Janssen
2000,actor,7/13/00,Acting,Billy Crudup
2000,actor,7/17/00,Acting,Shawn Wayans & Marlon Wayans
2000,actor,7/17/00,Acting,Shawn Wayans & Marlon Wayans
2000,actress,7/18/00,Acting,Halle Berry
2000,NA,7/19/00,NA,Fourth Anniversary Special
2000,television personality,7/20/00,Media,Al Roker
2000,actor,7/24/00,Acting,Peter Fonda
2000,writer,7/25/00,Media,Joe Eszterhas
2000,actress,7/26/00,Acting,Jennifer Beals
2000,NA,7/31/00,NA,"Campaign Trail to the Road to the White House Mo Rocca, Vance DeGeneres"
2000,american politician,8/1/00,Politician,Bob Dole
2000,former governor of nebraska,8/15/00,Politician,Bob Kerrey
2000,actor,8/16/00,Acting,William Baldwin
2000,american politician,8/18/00,Politician,Bob Dole
2000,Former U.S. Representative,8/2/00,Politician,Mary Bono
2000,actor,8/22/00,Acting,Jeremy Piven
2000,Musician,8/23/00,Musician,Slash
2000,actor,8/24/00,Acting,Vincent D'Onofrio
2000,american politician,8/3/00,Politician,Bob Dole
2000,Former United States Secretary of Labor,8/4/00,Politician,"Robert Reich and Ben Stein"
2000,writer,8/4/00,Media,"Robert Reich and Ben Stein"
2000,actor,9/11/00,Acting,Joe Mantegna
2000,actor,9/12/00,Acting,Eugene Levy
2000,boxer,9/13/00,Athletics,Lennox Lewis
2000,former us senator,9/14/00,Politician,Joe Lieberman
2000,actor,9/18/00,Acting,Ryan Phillippe
2000,actress,9/19/00,Acting,Jamie Lee Curtis
2000,rock band,9/20/00,Musician,Barenaked Ladies
2000,actor,9/21/00,Acting,Jamie Foxx
2000,comedian,9/25/00,Comedy,Jonathan Katz
2000,actor,9/26/00,Acting,Bill Goldberg
2000,actor,9/27/00,Acting,Sylvester Stallone
2000,actor,9/28/00,Acting,Tony Danza
2000,film actor,9/5/00,Acting,Donal Logue
2000,actor,9/6/00,Acting,Greg Kinnear
2000,Band,9/7/00,Musician,Spinal Tap
2001,singer,1/10/01,Musician,Vitamin C
2001,actress,1/11/01,Acting,Julia Stiles
2001,actor,1/15/01,Acting,Willem Dafoe
2001,actor,1/16/01,Acting,Tim Robbins
2001,Reporter,1/17/01,Media,Sam Donaldson
2001,actress,1/18/01,Acting,Lynn Whitfield
2001,television host,1/22/01,Media,Bill O'Reilly
2001,actor,1/23/01,Acting,Matthew McConaughey
2001,American football quarterback,1/24/01,Athletics,Terry Bradshaw
2001,actor,1/25/01,Acting,Topher Grace
2001,actor,1/29/01,Acting,David Boreanaz
2001,film actress,1/30/01,Acting,Dyan Cannon
2001,actor,1/31/01,Acting,James van der Beek
2001,Comedian,1/9/01,Comedy,Richard Lewis
2001,actor,10/1/01,Acting,Kelsey Grammer
2001,actor,10/10/01,Acting,Jeremy Piven
2001,journalist,10/11/01,Media,John Miller
2001,chef,10/15/01,Misc,Emeril Lagasse
2001,actress,10/16/01,Acting,Lorraine Bracco
2001,actor,10/17/01,Acting,Snoop Dogg
2001,journalist,10/18/01,Media,Fareed Zakaria
2001,actor,10/2/01,Acting,James Belushi
2001,Singer,10/22/01,Musician,Lance Bass
2001,journalist,10/23/01,Media,Don Dahler
2001,commentator,10/24/01,Media,Greta Van Susteren
2001,actor,10/25/01,Acting,Jeff Bridges
2001,professor,10/3/01,Academic,Stephen S. Morse
2001,actor,10/30/01,Acting,Rob Morrow
2001,Diplomat,10/31/01,Government,Richard Holbrooke
2001,actress,10/4/01,Acting,Kate Beckinsale
2001,actor,10/9/01,Acting,Owen Wilson
2001,actor,11/1/01,Acting,Kevin Spacey
2001,Journalist,11/12/01,Media,Steve Kroft
2001,television presenter,11/13/01,Media,Anne Robinson
2001,american television personality,11/14/01,Media,Carson Daly
2001,actor,11/15/01,Acting,John Stamos
2001,actor,11/26/01,Acting,Edward Burns
2001,Lawyer,11/27/01,Misc,Star Jones
2001,actress,11/28/01,Acting,Jennifer Garner
2001,journalist,11/29/01,Media,David Halberstam
2001,actor,11/5/01,Acting,Paul Rudd
2001,Political satirist,11/6/01,Media,P. J. O'Rourke
2001,white house sommunications director,11/7/01,Political Aide,George Stephanopoulos
2001,comedian,11/8/01,Comedy,Jennifer Saunders
2001,Comedian,12/10/01,Comedy,Stephen Colbert as Al Sharpton (Sharpton had been the scheduled guest)
2001,comedian,12/11/01,Comedy,Dave Gorman
2001,film actress,12/12/01,Acting,Janeane Garofalo
2001,television actress,12/13/01,Acting,Tracey Ullman
2001,actor,12/17/01,Acting,Elijah Wood
2001,Author,12/18/01,Media,Peggy Noonan
2001,actor,12/19/01,Acting,Gary Sinise
2001,actor,12/20/01,Acting,Jamie Foxx
2001,Professor,12/3/01,Academic,Nadine Strossen
2001,telvision personality,12/4/01,Media,John Edward
2001,actress,12/5/01,Acting,Marg Helgenberger
2001,actor,12/6/01,Acting,Ted Danson
2001,actor,2/1/01,Acting,Tim Blake Nelson
2001,musician,2/12/01,Musician,Dave Grohl
2001,muppet,2/13/01,Media,Kermit the Frog
2001,actress,2/14/01,Acting,Jessica Alba
2001,Comedian,2/15/01,Comedy,Wanda Sykes
2001,actor,2/20/01,Acting,Greg Germann
2001,comedian,2/21/01,Comedy,Chris Rock
2001,actress,2/22/01,Acting,Kelly Ripa
2001,actor,2/26/01,Acting,Ted Danson
2001,actor,2/27/01,Acting,Joe Pantoliano
2001,actress,2/28/01,Acting,Heather Locklear
2001,Former United States Deputy Secretary of State,3/1/01,Government,Warren Christopher
2001,actor,3/19/01,Acting,Chris Meloni
2001,actress,3/20/01,Acting,Mary Stuart Masterson
2001,news anchor,3/21/01,media,Jeff Varner
2001,actor,3/22/01,Acting,Denis Leary
2001,Columnist,3/26/01,Media,Richard Roeper
2001,Comedian,3/27/01,Comedy,Richard Lewis
2001,television actor,3/28/01,Acting,Mark Harmon
2001,actress,3/29/01,Acting,Jennifer Love Hewitt
2001,actor,3/5/01,Acting,Martin Short
2001,actor,3/6/01,Acting,Ed Burns
2001,model,3/7/01,Media,Carmen Electra
2001,actor,3/8/01,Acting,Javier Bardem
2001,sportscaster,4/10/01,Media,Bob Costas
2001,actor,4/11/01,Acting,Damon Wayans
2001,television actress,4/12/01,Acting,Brittany Daniel
2001,journalist,4/2/01,Media,Lisa Ling
2001,television producer,4/23/01,Media,Don Hewitt
2001,actress,4/24/01,Acting,Rachael Leigh Cook
2001,actor,4/25/01,Acting,Tom Green
2001,actor,4/26/01,Acting,Tom Cavanagh
2001,actress,4/3/01,Acting,Amy Sedaris
2001,actor,4/30/01,Acting,Eric McCormack
2001,actor,4/4/01,Acting,D.L. Hughley
2001,actor,4/5/01,Acting,Steven Weber
2001,actor,4/9/01,Acting,Paul Reubens
2001,actor,5/1/01,Acting,Dominic Chianese
2001,television actress,5/10/01,Acting,Patricia Richardson
2001,Film actress,5/14/01,Acting,Maura Tierney
2001,actress,5/15/01,Acting,Denise Quií±ones
2001,actor,5/16/01,Acting,Heath Ledger
2001,former mayor of cincinatti,5/17/01,Politician,Jerry Springer
2001,NA,5/2/01,NA,No guest
2001,actor,5/29/01,Acting,Richard Schiff
2001,actor,5/3/01,Acting,Robert Patrick
2001,film actor,5/30/01,Acting,Bradley Whitford
2001,actress,5/31/01,Acting,Leah Remini
2001,singer,5/7/01,Musician,Chris Robinson
2001,actor,5/8/01,Acting,James Van Der Beek
2001,Guitarist,5/9/01,Musician,Richie Sambora
2001,journalist,6/11/01,Media,Joe Queenan
2001,bass guitarist,6/12/01,Musician,Gene Simmons
2001,actor,6/13/01,Acting,David Duchovny
2001,journalist,6/14/01,Media,Jeff Greenfield
2001,actor,6/18/01,Acting,Martin Short
2001,actor,6/19/01,Acting,Michael Rapaport
2001,actor,6/20/01,Acting,Alec Baldwin
2001,Singer,6/21/01,Musician,Mí_a
2001,actor,6/25/01,Acting,Sam Robards
2001,stunt perfomrer,6/26/01,Acting,Johnny Knoxville
2001,film actor,6/27/01,Acting,Jet Li
2001,actress,6/28/01,Acting,Bridget Fonda
2001,comedian,6/4/01,Comedy,Jake Johannsen
2001,Stand-up comedian,6/5/01,Comedy,Richard Belzer
2001,television personality,6/6/01,Media,Al Roker
2001,stand-up comedian,6/7/01,Comedy,Bernie Mac
2001,Pop group,7/10/01,Musician,Spice Girls
2001,actor,7/11/01,Acting,James Woods
2001,actor,7/12/01,Acting,Vince Vaughn
2001,actor,7/16/01,Acting,Jon Favreau
2001,Journalist,7/17/01,Media,Maria Bartiromo
2001,actor,7/18/01,Acting,Edward Norton
2001,actor,7/19/01,Acting,Hank Azaria
2001,actor,7/23/01,Acting,Larry Miller
2001,actor,7/24/01,Acting,Paul Giamatti
2001,former us senator,7/25/01,Politician,Joe Lieberman
2001,us senator,7/26/01,Politician,John McCain
2001,actress,7/30/01,Acting,Jerri Manthey
2001,Film actor,7/31/01,Acting,Peter Krause
2001,actor,7/9/01,Acting,Sean Hayes
2001,actor,8/1/01,Acting,Jackie Chan
2001,writer,8/13/01,Media,David Rakoff
2001,actor,8/14/01,Acting,John Carpenter
2001,actor,8/15/01,Acting,Seth Green
2001,model,8/16/01,Media,Fabio
2001,film actress,8/2/01,Acting,Janeane Garofalo
2001,actor,8/20/01,Acting,Cuba Gooding Jr.
2001,actor,8/21/01,Acting,Griffin Dunne
2001,actor,8/22/01,Acting,Will Ferrell
2001,Screenwriter,8/23/01,Media,Kevin Smith
2001,actress,8/6/01,Acting,Andie MacDowell
2001,comedian,8/7/01,Comedy,Joe Rogan
2001,Model,8/8/01,Media,Tara Reid
2001,actor,8/9/01,Acting,Jason Biggs
2001,Rock band,9/10/01,Musician,They Might Be Giants
2001,guitarist,9/11/01,Musician,Dave Navarro
2001,essayist,9/24/01,Media,Frank Rich
2001,broadcaster,9/25/01,Media,Aaron Brown
2001,journalist,9/26/01,Media,Jeff Greenfield
2001,Rock duo,9/27/01,Musician,Tenacious D
2002,actor,1/10/02,Acting,Jack Black
2002,journalist,1/14/02,Media,Lesley Stahl
2002,actor,1/15/02,Acting,Ian McKellen
2002,actor,1/16/02,Acting,Colin Hanks
2002,actor,1/17/02,Acting,Jeremy Northam
2002,minister,1/21/02,Clergy,Al Sharpton
2002,actor,1/22/02,Acting,Anthony LaPaglia
2002,actor,1/23/02,Acting,Harold Ramis
2002,Journalist,1/24/02,Media,Sebastian Junger
2002,journalist,1/28/02,Media,Ron Insana
2002,novelist,1/29/02,Media,Elmore Leonard
2002,journalist,1/30/02,Media,John King
2002,actor,1/31/02,Acting,Jason Schwartzman
2002,actress,1/8/02,Acting,Anjelica Huston
2002,actor,1/9/02,Acting,Luke Wilson
2002,actor,10/1/02,Acting,Patrick Dempsey
2002,Host,10/10/02,Media,Oliver North
2002,NA,10/14/02,NA,Road to Washington Special
2002,news anchor,10/15/02,media,Judy Woodruff
2002,Comedian,10/16/02,Comedy,Richard Lewis
2002,actor,10/17/02,Acting,Greg Kinnear
2002,actor,10/2/02,Acting,David Schwimmer
2002,former american senator,10/28/02,Politician,John Edwards
2002,assistant secretary of defense,10/29/02,Government,Victoria Clarke
2002,actress,10/3/02,Acting,Rita Wilson
2002,Former Assistant to the President for Communications,10/30/02,Political Aide,Pat Buchanan
2002,Broadcaster,10/31/02,Media,Ted Koppel
2002,actor,10/7/02,Acting,Jake Gyllenhaal
2002,actress,10/8/02,Acting,Jill Hennessy
2002,Journalist,10/9/02,Media,Peter Jennings
2002,journalist,11/12/02,Media,Alexandra Pelosi
2002,actor,11/13/02,Acting,Kiefer Sutherland
2002,actor,11/14/02,Acting,Tom Arnold
2002,rapper,11/18/02,Musician,Ja Rule
2002,former us representativ,11/19/02,Politician,Harold Ford
2002,journalist,11/20/02,Media,Catherine Crier
2002,actor,11/21/02,Acting,Kevin James
2002,singer-songwriter,11/4/02,Musician,Christina Aguilera
2002,us senator,11/5/02,Politician,John McCain
2002,news anchor,11/6/02,media,Candy Crowley
2002,singer-songwriter,11/7/02,Musician,Jakob Dylan
2002,Journalist,12/10/02,Media,Tom Brokaw
2002,actress,12/11/02,Acting,Sandra Bullock
2002,actress,12/12/02,Acting,Anna Paquin
2002,us senator,12/16/02,Politician,Charles Schumer
2002,basketball player,12/17/02,Athletics,Charles Barkley
2002,actor,12/18/02,Acting,Edward Norton
2002,actor,12/19/02,Acting,John Cusack
2002,actor,12/2/02,Acting,Andy Richter
2002,editor,12/3/02,Media,Katrina vanden Heuvel
2002,stand-up comedian,12/4/02,Comedy,Colin Quinn
2002,actor,12/5/02,Acting,Rob Schneider
2002,former vice president,12/9/02,Politician,Al Gore
2002,actor,2/11/02,Acting,Scott Bakula
2002,television personality,2/12/02,Media,John Stossel
2002,activist,2/13/02,Advocacy,Ralph Nader
2002,actress,2/14/02,Acting,Rebecca Romijn
2002,actress,2/19/02,Acting,Jeri Ryan
2002,editor,2/20/02,Media,Bethany McLean
2002,Filmmaker,2/21/02,Media,Michael Moore
2002,Film director,2/4/02,Media,Ron Howard
2002,commentator,2/5/02,Media,Greta Van Susteren
2002,rapper,2/6/02,Musician,LL Cool J
2002,singer-songwriter,2/7/02,Musician,Barry Manilow
2002,actress,3/11/02,Acting,Bea Arthur
2002,actor,3/12/02,Acting,Denis Leary
2002,journalist,3/13/02,Media,Joe Klein
2002,television host,3/14/02,Media,Bill O'Reilly
2002,actor,3/18/02,Acting,Andy Richter
2002,us senator,3/19/02,Politician,John McCain
2002,actor,3/20/02,Acting,John Leguizamo
2002,actor,3/21/02,Acting,Aidan Quinn
2002,journalist,3/4/02,Media,David Remnick
2002,Comedian,3/5/02,Comedy,Richard Lewis
2002,actress,3/6/02,Acting,Milla Jovovich
2002,actor,3/7/02,Acting,Tom Arnold
2002,Journalist,4/1/02,Media,Paula Zahn
2002,actress,4/10/02,Acting,Patricia Arquette
2002,rock band,4/11/02,Musician,The Goo Goo Dolls
2002,actor,4/15/02,Acting,Samuel L. Jackson
2002,editor,4/16/02,Media,Lisa Beyer
2002,Model,4/17/02,Media,Tara Reid
2002,actor,4/18/02,Acting,Richard Dreyfuss
2002,journalist,4/2/02,Media,David Brock
2002,actor,4/22/02,Acting,Michael Clarke Duncan
2002,actor,4/23/02,Acting,Beau Bridges
2002,singer-songwriter,4/24/02,Musician,Elvis Costello
2002,journalist,4/25/02,Media,H.W. Crocker III
2002,editor,4/29/02,Media,Susan Caskie
2002,actor,4/3/02,Acting,Jon Favreau
2002,singer-songwriter,4/30/02,Musician,Alanis Morissette
2002,actress,4/4/02,Acting,Ashley Judd
2002,actor,4/8/02,Acting,Tony Danza
2002,news anchor,4/9/02,media,Judy Woodruff
2002,Broadcaster,5/1/02,Media,Robin Roberts
2002,Singer-songwriter,5/13/02,Musician,Moby
2002,actor,5/14/02,Acting,Liev Schreiber
2002,actor,5/15/02,Acting,Rupert Everett
2002,actress,5/16/02,Acting,Allison Janney
2002,actor,5/2/02,Acting,Willem Dafoe
2002,NA,5/23/02,NA,Matt Walsh Goes To Hawaii
2002,actor,5/6/02,Acting,Simon Baker
2002,Writer,5/7/02,Media,Mark Bowden
2002,actress,5/8/02,Acting,Diane Lane
2002,actor,5/9/02,Acting,David Boreanaz
2002,actor,6/11/02,Acting,Val Kilmer
2002,Former Mayor of New York City,6/12/02,Politician,Michael Bloomberg
2002,author,6/13/02,Media,Joseph Cirincione
2002,actor,6/17/02,Acting,Freddie Prinze Jr.
2002,actor,6/18/02,Acting,Christian Slater
2002,journalist,6/19/02,Media,Cynthia McFadden
2002,stand-up comedian,6/20/02,Comedy,"David Cross Bob Odenkirk"
2002,actor,6/20/02,Acting,"David Cross Bob Odenkirk"
2002,actor,6/24/02,Acting,Colin Farrell
2002,lawyer,6/25/02,Misc,David Scheffer
2002,actor,6/26/02,Acting,Paul Sorvino
2002,soccer player,6/27/02,Athletics,Clint Mathis
2002,actor,6/3/02,Acting,Colin Firth
2002,journalist,6/4/02,Media,Ashleigh Banfield
2002,actor,6/6/02,Acting,Charles Grodin
2002,rapper,7/10/02,Musician,Busta Rhymes
2002,television Personality,7/11/02,Media,Steve Irwin
2002,actor,7/15/02,Acting,John Ritter
2002,actress,7/16/02,Acting,Michelle Williams
2002,commentator,7/17/02,Media,Ann Coulter
2002,actress,7/18/02,Acting,Natasha Henstridge
2002,actor,7/22/02,Acting,Regis Philbin
2002,actor,7/23/02,Acting,Tim Blake Nelson
2002,actor,7/24/02,Acting,Steven Weber
2002,actor,7/25/02,Acting,Seth Green
2002,actress,7/29/02,Acting,Cynthia Nixon
2002,actor,7/30/02,Acting,Robert Wagner
2002,Comedian,7/31/02,Comedy,Martin Lawrence
2002,actor,7/8/02,Acting,Adam Sandler
2002,journalist,7/9/02,Media,John King
2002,actor,8/1/02,Acting,Mike Myers
2002,actor,8/12/02,Acting,Michael C. Hall
2002,Critic,8/13/02,Media,Scott Ritter
2002,actor,8/14/02,Acting,Kevin Nealon
2002,Journalist,8/15/02,Media,Rich Eisen
2002,actor,8/19/02,Acting,Denis Leary
2002,journalist,8/20/02,Media,Jim Lehrer
2002,actor,8/21/02,Acting,Robin Williams
2002,actor,8/22/02,Acting,Matthew Perry
2002,us senator,8/5/02,Politician,Charles Schumer
2002,actor,8/6/02,Acting,Antonio Banderas
2002,actor,8/7/02,Acting,Vin Diesel
2002,actor,8/8/02,Acting,Paul Rudd
2002,actor,9/10/02,Acting,Zach Braff
2002,Author,9/12/02,Media,Sarah Vowell
2002,journalist,9/16/02,Media,John Miller
2002,actor,9/17/02,Acting,Jason Lee
2002,actor,9/18/02,Acting,Damon Wayans
2002,actor,9/19/02,Acting,Djimon Hounsou
2002,actress,9/24/02,Acting,Kate Hudson
2002,white house sommunications director,9/25/02,Political Aide,George Stephanopoulos
2002,actress,9/26/02,Acting,Goldie Hawn
2002,actress,9/30/02,Acting,Bonnie Hunt
2002,actress,9/9/02,Acting,Lorraine Bracco
2003,actress,1/13/03,Acting,Kathy Bates
2003,Filmmaker,1/14/03,Media,Michael Moore
2003,comedian,1/15/03,Comedy,Dave Chappelle
2003,former us senator,1/16/03,Politician,Joseph Lieberman
2003,television host,1/20/03,Media,Merv Griffin
2003,television producer,1/21/03,Media,Simon Cowell
2003,actor,1/22/03,Acting,John C. Reilly
2003,television host,1/23/03,Media,Jimmy Kimmel
2003,actress,1/27/03,Acting,Rosie Perez
2003,actor,1/28/03,Acting,Sam Rockwell
2003,journalist,1/29/03,Media,Jeff Greenfield
2003,actor,1/30/03,Acting,Laurence Fishburne
2003,actress,1/7/03,Acting,Cameron Diaz
2003,actor,1/8/03,Acting,Ray Liotta
2003,actor,1/9/03,Acting,Philip Seymour Hoffman
2003,actress,10/1/03,Acting,Vivica A. Fox
2003,actor,10/2/03,Acting,Rob Lowe
2003,former national security advisio\r,10/20/03,Government,Henry Kissinger
2003,actress,10/21/03,Acting,Angelina Jolie
2003,Writer,10/22/03,Media,Walter Isaacson
2003,actor,10/23/03,Acting,Anthony Hopkins
2003,actor,10/27/03,Acting,Ted Danson
2003,Comedian,10/28/03,Comedy,Wanda Sykes
2003,Stand-up comedian,10/29/03,Comedy,Norm Macdonald
2003,Novelist,10/30/03,Media,Neal Pollack
2003,Filmmaker,10/6/03,Media,Michael Moore
2003,actor,10/7/03,Acting,"Ronny Cox Marc Singer Robert Amstler Arianna Huffington"
2003,us senator,10/8/03,Politician,Sen. Hillary Clinton
2003,actor,10/9/03,Acting,Tim Robbins
2003,actor,11/10/03,Acting,Will Ferrell
2003,actor,11/11/03,Acting,Peter Dinklage
2003,Rapper,11/12/03,Musician,Wyclef Jean
2003,actor,11/13/03,Acting,Brendan Fraser
2003,model,11/17/03,Media,Heidi Klum
2003,writer,11/18/03,Media,Bernard Goldberg
2003,actor,11/19/03,Acting,James Spader
2003,actor,11/20/03,Acting,Billy Bob Thornton
2003,NA,11/24/03,NA,Who are the Daily Show? Special
2003,actor,11/3/03,Acting,Kyle MacLachlan
2003,Historian,11/4/03,Academic,Michael Beschloss
2003,stand-up comedian,11/5/03,Comedy,Bob Newhart
2003,actor,11/6/03,Acting,Colin Firth
2003,actor,12/1/03,Acting,Adam Goldberg
2003,us senator,12/10/03,Politician,Sen. Zell Miller
2003,political figure,12/11/03,Politician,Gen. Wesley Clark
2003,actress,12/15/03,Acting,Maggie Gyllenhaal
2003,actor,12/16/03,Acting,Ben Affleck
2003,actress,12/17/03,Acting,Julia Stiles
2003,actress,12/18/03,Acting,Natalie Portman
2003,us senator,12/2/03,Politician,Sen. Tom Daschle
2003,radio host,12/3/03,Media,"Alan Colmes"
2003,radio host,12/3/03,Media,"Sean Hannity"
2003,actor,12/4/03,Acting,Alec Baldwin
2003,actress,12/8/03,Acting,Eva Mendes
2003,actor,12/9/03,Acting,Steve Buscemi
2003,journalist,2/10/03,Media,Joe Klein
2003,actress,2/11/03,Acting,Bebe Neuwirth
2003,actor,2/12/03,Acting,Michael Clarke Duncan
2003,actor,2/13/03,Acting,Ben Affleck
2003,Journalist,2/18/03,Media,Steve Kroft
2003,actor,2/19/03,Acting,Jeff Daniels
2003,actor,2/20/03,Acting,Luke Wilson
2003,pastor,2/3/03,Clergy,Doug Wilson
2003,actress,2/4/03,Acting,Kate Hudson
2003,author,2/5/03,Media,Arianna Huffington
2003,commentator,2/6/03,Media,David Frum
2003,correspondent,3/10/03,Media,Les Gelb
2003,stand-up comedian,3/11/03,Comedy,Colin Quinn
2003,former majority leader,3/12/03,Politician,Dick Gephardt
2003,actor,3/13/03,Acting,Tom Cavanagh
2003,historian,3/17/03,Academic,Eric Alterman
2003,actor,3/18/03,Acting,Jason Lee
2003,foreign policy expert,3/19/03,Academic,John Hulsman
2003,actor,3/20/03,Acting,Eddie Griffin
2003,editor,3/24/03,Media,Jim Kelly
2003,actress,3/25/03,Acting,Connie Nielsen
2003,Musician,3/26/03,Musician,Ringo Starr
2003,actress,3/27/03,Acting,Hilary Swank
2003,comedian,3/3/03,Comedy,Eric Idle
2003,comedian,3/31/03,Comedy,Chris Rock
2003,Writer,3/4/03,Media,Walter Isaacson
2003,actor,3/5/03,Acting,Adrien Brody
2003,stand-up comedian,3/6/03,Comedy,"David Cross (show hosted by Stephen Colbert)"
2003,writer,4/1/03,Media,Anthony Swofford
2003,stand-up comedian,4/10/03,Comedy,Dennis Miller
2003,actress,4/2/03,Acting,Kelly Preston
2003,Film actor,4/21/03,Acting,Patrick Stewart
2003,Film actress,4/22/03,Acting,Rachel Weisz
2003,Comedian,4/23/03,Comedy,Richard Lewis
2003,journalist,4/24/03,Media,Fareed Zakaria
2003,neurosurgeon,4/28/03,Science,Dr Sanjay Gupta
2003,actress,4/29/03,Acting,Julia Louis-Dreyfus
2003,actor,4/3/03,Acting,Colin Farrell
2003,actor,4/30/03,Acting,John Malkovich
2003,political psychologist,4/7/03,Consultant,Martha Burk
2003,actress,4/8/03,Acting,Susan Sarandon
2003,lawyer,4/9/03,Misc,Ambassador David Scheffer
2003,actress,5/1/03,Acting,Famke Janssen
2003,singer,5/12/03,Musician,Randy Jackson
2003,actor,5/13/03,Acting,Joshua Jackson
2003,historian,5/14/03,Academic,Diane Ravitch
2003,Journalist,5/15/03,Media,Michael Kinsley
2003,NA,5/26/03,NA,Iraq - A Look Baq (or how we learned to stop reporting and love the war)
2003,NA,5/26/03,NA,Iraq - A Look Baq (or how we learned to stop reporting and love the war)
2003,Commentator,5/27/03,Media,William Kristol
2003,journalist,5/28/03,Media,Lisa Ling
2003,journalist,5/29/03,Media,David Halberstam
2003,commentator,5/5/03,Media,Chris Matthews
2003,author,5/6/03,Media,Caroline Kennedy
2003,television presenter,5/7/03,Media,Graham Norton
2003,actor,5/8/03,Acting,Paul Rudd
2003,Former U.S. Representative,6/10/03,Politician,Newt Gingrich
2003,Journalist,6/11/03,Media,Sidney Blumenthal
2003,Rapper,6/12/03,Musician,Ludacris
2003,actor,6/16/03,Acting,Harrison Ford
2003,writer,6/17/03,Media,Lewis Lapham
2003,singer-songwriter,6/18/03,Musician,Kelly Clarkson
2003,actor,6/19/03,Acting,Ron Livingston
2003,journalist,6/2/03,Media,Bill Hemmer
2003,stand-up comedian,6/3/03,Comedy,Eddie Izzard
2003,Former United States Secretary of State,6/4/03,Politician,Madeleine Albright
2003,Singer,6/5/03,Musician,Tyrese Gibson
2003,NA,6/8/03,NA,Looking Beyond The Show
2003,actor,6/9/03,Acting,Guy Pearce
2003,american television personality,7/10/03,Media,Carson Daly
2003,actress,7/14/03,Acting,Angelina Jolie
2003,former us senator,7/15/03,Politician,Gary Hart
2003,actor,7/16/03,Acting,Rowan Atkinson
2003,Comedian,7/17/03,Comedy,Martin Lawrence
2003,actress,7/21/03,Acting,Gabrielle Union
2003,actor,7/22/03,Acting,Scott Glenn
2003,author,7/23/03,Media,Dick Morris
2003,diplomat,7/24/03,Government,Joseph C. Wilson
2003,television producer,7/28/03,Media,Paul Teutul Sr. Paul Teutul Jr.
2003,designer,7/28/03,Media,Paul Teutul Sr. Paul Teutul Jr.
2003,journalist,7/29/03,Media,Brian Williams
2003,actress,7/30/03,Acting,Alyson Hannigan
2003,Broadcaster,7/31/03,Media,Soledad O'Brien
2003,Former White House Press Secretary,7/8/03,Political Aide,Tony Snow
2003,author,7/9/03,Media,Erica Jong
2003,actor,8/11/03,Acting,Samuel L. Jackson
2003,actress,8/12/03,Acting,Kim Cattrall
2003,actor,8/13/03,Acting,Paul Giamatti
2003,-,8/14/03,NA,"Again, A Look Back"
2003,columnist,8/18/03,Media,Jim Hightower
2003,actress,8/19/03,Acting,Cynthia Nixon
2003,Puzzle Creator,8/20/03,Media,Will Shortz
2003,former us representative,8/21/03,Politician,Dennis Kucinich
2003,actor,8/4/03,Acting,Denis Leary
2003,musician,8/5/03,Musician,John Popper
2003,actor,8/6/03,Acting,Robert Duvall
2003,television actress,8/7/03,Acting,Tracey Ullman
2003,NA,9/1/03,NA,"I'm a Correspondent, Please Don't Fire Me!"
2003,actress,9/10/03,Acting,Kate Beckinsale
2003,NA,9/11/03,NA,No Guest
2003,us senator,9/15/03,Politician,"Sen. John Edwards"
2003,actor,9/15/03,Acting,"Cuba Gooding, Jr."
2003,Former United States Secretary of State,9/16/03,Politician,Madeleine Albright
2003,actor,9/17/03,Acting,Charlie Sheen
2003,actress,9/18/03,Acting,Christina Ricci
2003,actor,9/23/03,Acting,Michael Caine
2003,actor,9/24/03,Acting,Ben Stiller
2003,columnist,9/25/03,Media,Jonah Goldberg
2003,actor,9/29/03,Acting,Jack Black
2003,former us representative,9/30/03,Politician,Joe Scarborough
2003,united states senator,9/9/03,Politician,Al Franken
2004,Comedian,1/12/04,Comedy,Richard Lewis
2004,scientist,1/13/04,Science,Catherine Weitz
2004,former us senator,1/14/04,Politician,Carol Moseley-Braun
2004,vice president,1/15/04,Politician,Joe Biden
2004,actor,1/19/04,Acting,Philip Seymour Hoffman
2004,comedian,1/20/04,Comedy,Jeff Garlin
2004,us senator,1/21/04,Politician,Sen. John McCain
2004,actress,1/22/04,Acting,Erika Christensen
2004,writer,1/26/04,Media,Ken Auletta
2004,Political Scientist,1/27/04,Consultant,Richard Perle
2004,former governor of new jersey,1/28/04,Politician,Christine Todd Whitman
2004,actor,1/29/04,Acting,Kelsey Grammer
2004,Journalist,1/6/04,Media,Tom Brokaw
2004,actor,1/7/04,Acting,Elijah Wood
2004,actress,1/8/04,Acting,Charlize Theron
2004,us representative,10/18/04,Politician,Ed Koch
2004,actress,10/19/04,Acting,Marisa Tomei
2004,journalist,10/20/04,Media,Fareed Zakaria
2004,actor,10/21/04,Acting,Billy Crudup
2004,Former United States Secretary of State,10/25/04,Politician,Madeleine Albright
2004,former governor of nebraska,10/26/04,Politician,Bob Kerrey
2004,civil rights activist,10/27/04,Advocacy,Jesse Jackson
2004,author,10/28/04,Media,John Zogby
2004,social activist,10/4/04,Advocacy,Bishop Desmond Tutu
2004,actor,10/5/04,Acting,Billy Bob Thornton
2004,journalist,10/6/04,Media,Bob Schieffer
2004,television host,10/7/04,Media,Bill O'Reilly
2004,television host,11/1/04,Media,Chris Wallace
2004,Author,11/10/04,Media,Tom Wolfe
2004,analyst,11/11/04,Consultant,Kenneth Pollack
2004,former us senator,11/15/04,Politician,Kay Bailey Hutchison
2004,Journalist,11/16/04,Media,Tom Brokaw
2004,Historian,11/17/04,Academic,Thomas Frank
2004,actor,11/18/04,Acting,Woody Harrelson
2004,former govrnor of masssachusetts,11/2/04,Politician,William Weld & Al Sharpton
2004,minister,11/2/04,Clergy,William Weld & Al Sharpton
2004,actor,11/29/04,Acting,Jude Law
2004,us senator,11/3/04,Politician,Sen. Charles Schumer
2004,journalist,11/30/04,Media,Brian Williams
2004,Commentator,11/4/04,Media,William Kristol
2004,Businessman,11/9/04,Business,Richard Branson
2004,author,12/1/04,Media,Christopher Hitchens
2004,actor,12/13/04,Acting,Kevin Spacey
2004,diplomat,12/14/04,Government,Dore Gold
2004,comedian,12/15/04,Comedy,Billy Connolly
2004,journalist,12/16/04,Media,Katie Couric
2004,Author,12/2/04,Media,Stephen King
2004,actress,12/6/04,Acting,Isabella Rossellini
2004,Baseball player,12/7/04,Athletics,Paul O'Neill
2004,Writer,12/8/04,Media,Seth Mnookin
2004,actress,12/9/04,Acting,Kate Bosworth
2004,comedian,2/10/04,Comedy,Dave Chappelle
2004,actor,2/11/04,Acting,Paul Rudd
2004,actress,2/12/04,Acting,Drew Barrymore
2004,singer,2/2/04,Musician,Randy Jackson
2004,television Personality,2/23/04,Media,Tyra Banks
2004,writer,2/24/04,Media,John Podhoretz
2004,Singer-songwriter,2/25/04,Musician,Norah Jones
2004,actor,2/26/04,Acting,Samuel L. Jackson
2004,business magnate,2/3/04,Business,Donald Trump
2004,american politician,2/4/04,Politician,Bob Dole
2004,Film actor,2/5/04,Acting,Noah Wyle
2004,journalist,2/9/04,Media,Charles Lewis
2004,television actress,3/1/04,Acting,Edie Falco
2004,comedian,3/10/04,Comedy,George Carlin
2004,Journalist,3/11/04,Media,Paula Zahn
2004,us senator,3/15/04,Politician,Sen. Charles Schumer
2004,television personality,3/16/04,Media,John Stossel
2004,actor,3/17/04,Acting,Mekhi Phifer
2004,actor,3/18/04,Acting,Ethan Hawke
2004,Journalist,3/2/04,Media,Mark Ebner
2004,Trumpeter,3/22/04,Musician,Wynton Marsalis
2004,actor,3/23/04,Acting,Tom Hanks
2004,actor,3/24/04,Acting,Jamie Foxx
2004,united states senator,3/25/04,Politician,Al Franken
2004,actress,3/29/04,Acting,Jennifer Beals
2004,former mayor of new york,3/3/04,Politician,Rudolph Giuliani
2004,Adviser,3/30/04,Consultant,Richard A. Clarke
2004,public official,3/31/04,Government,Karen Hughes
2004,actor,3/4/04,Acting,Willem Dafoe
2004,actor,3/8/04,Acting,Val Kilmer
2004,political figure,3/9/04,Politician,Ed Gillespie
2004,stunt perfomrer,4/1/04,Acting,Johnny Knoxville
2004,Singer-songwriter,4/19/04,Musician,Melissa Etheridge
2004,actor,4/20/04,Acting,Mark Ruffalo
2004,television host,4/21/04,Media,John Gibson
2004,author,4/22/04,Media,Arianna Huffington
2004,former governor of nebraska,4/26/04,Politician,Bob Kerrey
2004,actress,4/27/04,Acting,Rebecca Romijn
2004,journalist,4/28/04,Media,Fareed Zakaria
2004,journalist,4/29/04,Media,Bob Woodward
2004,comedian,4/5/04,Comedy,Jerry Seinfeld
2004,actor,4/6/04,Acting,Matthew Perry and Bruce Willis
2004,actor,4/6/04,Acting,Matthew Perry and Bruce Willis
2004,actor,4/7/04,Acting,Tim Robbins
2004,actor,4/8/04,Acting,Jason Bateman
2004,us senator,5/10/04,Politician,Sen. John McCain
2004,journalist,5/11/04,Media,Tim Russert
2004,American Political figure,5/12/04,Politician,Ken Mehlman
2004,Commentator,5/13/04,Media,William Kristol
2004,film actress,5/3/04,Acting,Janeane Garofalo
2004,diplomat,5/4/04,Government,Joseph C. Wilson
2004,basketball player,5/5/04,Athletics,Kareem Abdul-Jabbar
2004,actor,5/6/04,Acting,Andy Richter
2004,stand-up comedian,6/1/04,Comedy,David Cross
2004,actress,6/10/04,Acting,Jennifer Love Hewitt
2004,actor,6/14/04,Acting,Stanley Tucci
2004,physician,6/15/04,Science,Hassan Ibrahim
2004,Former United States Secretary of Labor,6/16/04,Politician,Robert Reich
2004,television presenter,6/17/04,Media,Graham Norton
2004,journalist,6/2/04,Media,Thomas Friedman
2004,Columnist,6/21/04,Media,Stephen F. Hayes
2004,actress,6/22/04,Acting,Ashley Judd
2004,actor,6/23/04,Acting,Kevin Kline
2004,Filmmaker,6/24/04,Media,Michael Moore
2004,Governor of Virginia,6/28/04,Politician,Terry McAuliffe
2004,author,6/29/04,Media,Edward Conlon
2004,Former Governor of New York,6/3/04,Politician,Mario Cuomo
2004,journalist,6/30/04,Media,Calvin Trillin
2004,author,6/7/04,Media,Donna Brazile
2004,commentator,6/8/04,Media,David Brooks
2004,Documentary Filmmaker,6/9/04,Media,Morgan Spurlock
2004,Journalist,7/12/04,Media,Wolf Blitzer
2004,Journalist,7/13/04,Media,Michael Isikoff
2004,Author,7/14/04,Media,Sarah Vowell
2004,actor,7/15/04,Acting,Sacha Baron Cohen
2004,former governor of new mexico,7/27/04,Politician,Gov. Bill Richardson
2004,us senator,7/28/04,Politician,Sen. Joe Biden
2004,NA,7/29/04,NA,None
2004,NA,7/30/04,NA,None
2004,activist,7/6/04,Advocacy,"Ralph Nader (show hosted by Stephen Colbert)"
2004,actor,7/7/04,Acting,Will Ferrell
2004,actress,7/8/04,Acting,Christina Applegate
2004,Columnist,8/10/04,Media,Maureen Dowd
2004,actor,8/11/04,Acting,Tom Cruise
2004,author,8/12/04,Media,Bryan Keefer
2004,Former American senator,8/17/04,Politician,Norm Coleman
2004,actor,8/18/04,Acting,Burt Reynolds
2004,actor,8/19/04,Acting,Seth Green
2004,us representative,8/2/04,Politician,Rep. Henry Bonilla
2004,musician,8/23/04,Musician,Robert Smith
2004,secretary of state,8/24/04,Politician,John Kerry
2004,political figure,8/25/04,Politician,Ed Gillespie
2004,Film director,8/3/04,Media,Spike Lee
2004,0,8/30/04,NA,(None)
2004,Broadcaster,8/31/04,Media,Ted Koppel
2004,film actor,8/4/04,Acting,Aaron Eckhart
2004,actress,8/5/04,Acting,Natalie Portman
2004,us president,8/9/04,Politician,Bill Clinton
2004,assistant to the president for communications,9/1/04,Political Aide,Dan Bartlett
2004,actress,9/13/04,Acting,Drew Barrymore
2004,Former Assistant to the President for Communications,9/14/04,Political Aide,Pat Buchanan
2004,actor,9/15/04,Acting,Alec Baldwin
2004,actress,9/16/04,Acting,Gwyneth Paltrow
2004,us senator,9/2/04,Politician,Sen. John McCain
2004,adviser,9/21/04,Consultant,Richard Clarke
2004,former governor of montans,9/22/04,Politician,Gov. Marc Racicot
2004,actor,9/23/04,Acting,Matthew Broderick
2004,actress,9/27/04,Acting,Rosie Perez
2004,activist,9/28/04,Advocacy,Ralph Reed
2004,Journalist,9/29/04,Media,Seymour Hersh
2004,commentator,9/3/04,Media,Chris Matthews
2004,political figure,9/30/04,Politician,"Wesley Clark"
2004,former mayor of new york,9/30/04,Politician,"Rudolph Giuliani"
2005,lawyer,1/10/05,Misc,John Grisham
2005,actor,1/11/05,Acting,Samuel L. Jackson
2005,actor,1/12/05,Acting,Dennis Quaid
2005,actress,1/13/05,Acting,Annette Bening
2005,journalist,1/17/05,Media,Brian Ross
2005,writer,1/18/05,Media,Jim Wallis
2005,Historian,1/19/05,Academic,Michael Beschloss
2005,us senator,1/20/05,Politician,Sen. Joe Lieberman
2005,Political figure,1/24/05,Politician,Richard Viguerie
2005,Journalist,1/25/05,Media,Seymour Hersh
2005,actor,1/26/05,Acting,John Leguizamo
2005,former governor of new jersey,1/27/05,Politician,Christine Todd Whitman
2005,journalist,1/31/05,Media,Fareed Zakaria
2005,actor,1/4/05,Acting,Paul Giamatti
2005,actor,1/5/05,Acting,Don Cheadle
2005,historian,1/6/05,Academic,Howard Zinn
2005,singer-songwriter,10/17/05,Musician,Dolly Parton
2005,television host,10/18/05,Media,Bill O'Reilly
2005,us assistant attorney,10/19/05,Government,Louis Freeh
2005,actor,10/20/05,Acting,"Dwayne The Rock"" Johnson"""
2005,Commentator,10/24/05,Media,William Kristol
2005,united states senator,10/25/05,Politician,Al Franken
2005,biographer,10/26/05,Media,Doris Kearns Goodwin
2005,military officer,10/27/05,Military,Janis Karpinski
2005,writer,10/3/05,Media,David Rakoff
2005,actor,10/31/05,Acting,D.L. Hughley
2005,actress,10/4/05,Acting,Cameron Diaz
2005,us senator,10/5/05,Politician,Sen. John Edwards
2005,actor,10/6/05,Acting,Philip Seymour Hoffman
2005,us senator,11/1/05,Politician,Sen. Barbara Boxer
2005,actor,11/10/05,Acting,Chris Elliott
2005,Businesswoman,11/14/05,Business,Martha Stewart
2005,actress,11/15/05,Acting,Rosario Dawson
2005,author,11/16/05,Media,John Hodgman
2005,adviser,11/17/05,Consultant,Richard Clarke
2005,American football wide receiver,11/2/05,Athletics,Mike Wallace
2005,actor,11/28/05,Acting,Adrien Brody
2005,Author,11/29/05,Media,Peggy Noonan
2005,lawyer,11/3/05,Misc,Robert Ray
2005,former speaker of the the house,11/30/05,Politician,Rep. Nancy Pelosi
2005,us senator,11/7/05,Politician,Sen. Barack Obama
2005,us senator,11/8/05,Politician,Sen. John McCain
2005,actress,11/9/05,Acting,Keira Knightley
2005,Rock duo,12/1/05,Musician,The White Stripes
2005,radio personality,12/13/05,Media,Howard Stern
2005,Journalist,12/14/05,Media,Tom Brokaw
2005,actress,12/15/05,Acting,Sarah Jessica Parker
2005,former president,12/5/05,Politician,Jimmy Carter
2005,actress,12/6/05,Acting,Michelle Yeoh
2005,author,12/7/05,Media,David McCullough
2005,writer,12/8/05,Media,Ken Auletta
2005,Singer-songwriter,2/1/05,Musician,Paula Abdul
2005,Writer,2/14/05,Media,Redmond O'Hanlon
2005,comedian,2/15/05,Comedy,Eric Idle
2005,actor,2/16/05,Acting,Alan Cumming
2005,consultant,2/17/05,Political Aide,Mark P. Mills
2005,journalist,2/2/05,Media,Anderson Cooper
2005,Film actress,2/22/05,Acting,Rachel Weisz
2005,Journalist,2/23/05,Media,Peter Jennings
2005,actress,2/24/05,Acting,Christina Ricci
2005,former governor of nebraska,2/28/05,Politician,Ben Nelson
2005,journalist,2/3/05,Media,Joe Klein
2005,foreign policy strategist,3/1/05,Academic,Nancy Soderberg
2005,Economist,3/10/05,Academic,Paul Krugman
2005,philosopher,3/14/05,Academic,Harry Frankfurt
2005,Correspondent,3/15/05,Media,Tom Fenton
2005,singer,3/16/05,Musician,Al Green
2005,television host,3/17/05,Media,Craig Ferguson
2005,actor,3/2/05,Acting,The Rock
2005,actress,3/21/05,Acting,Sandra Bullock
2005,actress,3/22/05,Acting,Catherine Keener
2005,Singer,3/23/05,Musician,Ozzy Osbourne
2005,Music Producer,3/24/05,Musician,RZA
2005,former white house press secretary,3/3/05,Political Aide,Ari Fleischer
2005,Film actress,3/7/05,Acting,Melissa Boyle Mahle
2005,journalist,3/8/05,Media,Brian Williams
2005,actor,3/9/05,Acting,Bruce Willis
2005,columnist,4/11/05,Media,Byron York
2005,american politician,4/12/05,Politician,Bob Dole
2005,journalist,4/13/05,Media,John Avlon
2005,actor,4/14/05,Acting,David Duchovny
2005,Former United States Secretary of Labor,4/18/05,Politician,Robert Reich
2005,Author,4/19/05,Media,Sarah Vowell
2005,stand-up comedian,4/20/05,Comedy,Dennis Miller
2005,Professor,4/21/05,Academic,Reza Aslan
2005,attorney,4/25/05,Misc,Floyd Abrams
2005,rapper,4/26/05,Musician,Ice Cube
2005,author,4/27/05,Media,Christina Hoff Sommers
2005,economist,4/28/05,Academic,Steven Levitt
2005,Basketball player,4/4/05,Athletics,Reggie Miller
2005,Journalist,4/5/05,Media,Thomas L. Friedman
2005,actor,4/6/05,Acting,Matthew McConaughey
2005,actress,4/7/05,Acting,Drew Barrymore
2005,Comedian,5/10/05,Comedy,Wanda Sykes
2005,television personality,5/11/05,Media,Al Roker
2005,television actress,5/12/05,Acting,Tracey Ullman
2005,Former United States Senator,5/2/05,Politician,Zell Miller
2005,journalist,5/3/05,Media,Christiane Amanpour
2005,journalist,5/31/05,Media,Gerald Posner
2005,actor,5/4/05,Acting,Martin Short
2005,Former Governor of Pennsylvania,5/5/05,Politician,Tom Ridge
2005,film actress,5/9/05,Acting,Kathleen Turner
2005,singer,6/1/05,Musician,Bo Bice
2005,Scholar,6/13/05,Academic,Larry Diamond
2005,actor,6/14/05,Acting,Will Ferrell
2005,professor,6/15/05,Academic,Flynt Leverett
2005,writer,6/16/05,Media,Kenneth Timmerman
2005,actor,6/2/05,Acting,Russell Crowe
2005,Musician,6/20/05,Musician,Ringo Starr
2005,singer-songwriter,6/21/05,Musician,Dwight Yoakam
2005,former white house press secretary,6/22/05,Political Aide,Bill Moyers
2005,former governor of vermont,6/23/05,Politician,Howard Dean
2005,author,6/27/05,Media,Hanna Rosin
2005,Documentary Filmmaker,6/28/05,Media,Morgan Spurlock
2005,Former U.S. Representative,6/6/05,Politician,Newt Gingrich
2005,Author,6/7/05,Media,Steven Johnson
2005,former us secretary of defense,6/8/05,Politician,Colin Powell
2005,Journalist,6/9/05,Media,Matt Lauer
2005,professor,7/11/05,Academic,Marci Hamilton
2005,Author,7/12/05,Media,Matt Taibbi
2005,writer,7/13/05,Media,Bernard Goldberg
2005,Journalist,7/14/05,Media,Michael Isikoff
2005,journalist,7/18/05,Media,"Carl Bernstein"
2005,journalist,7/18/05,Media,"Bob Woodward"
2005,actor,7/19/05,Acting,Billy Bob Thornton
2005,radio host,7/20/05,Media,Robert F. Kennedy Jr.
2005,journalist,7/21/05,Media,Fareed Zakaria
2005,us senator,7/25/05,Politician,Sen. Rick Santorum
2005,actress,7/26/05,Acting,Diane Lane
2005,sportscaster,7/27/05,Media,Bob Costas
2005,actress,7/28/05,Acting,Maggie Gyllenhaal
2005,journalist,8/10/05,Media,John Hockenberry
2005,rapper,8/11/05,Musician,Andrí© Benjamin
2005,actor,8/15/05,Acting,Steve Carell
2005,Journalist,8/16/05,Media,Seymour Hersh
2005,novelist,8/17/05,Media,John Irving
2005,author,8/18/05,Media,"John H. Richardson, Jr."
2005,us senator,8/2/05,Politician,Sen. Joe Biden
2005,television host,8/22/05,Media,Chris Wallace
2005,Film actress,8/23/05,Acting,Rachel Weisz
2005,us senator,8/24/05,Politician,Sen. Trent Lott
2005,author,8/25/05,Media,Christopher Hitchens
2005,author,8/3/05,Media,John Crawford
2005,Broadcaster,8/4/05,Media,Miles O'Brien
2005,actor,8/8/05,Acting,Paul Rudd
2005,actress,8/9/05,Acting,Kate Hudson
2005,journalist,9/12/05,Media,Chris Mooney
2005,Writer,9/13/05,Media,Kurt Vonnegut
2005,historian,9/14/05,Academic,"Dr. Edward J. Larson"
2005,mathematician,9/14/05,Academic,"Dr. William A. Dembski"
2005,psychic,9/14/05,Misc,"Ellie Crystal"
2005,actress,9/15/05,Acting,Gwyneth Paltrow
2005,actor,9/20/05,Acting,Alan Alda
2005,Comedian,9/21/05,Comedy,Ricky Gervais
2005,actor,9/22/05,Acting,George Clooney
2005,author,9/26/05,Media,Dr. Irwin Redlener
2005,actor,9/27/05,Acting,Viggo Mortensen
2005,comedian,9/28/05,Comedy,Jeff Garlin
2005,us senator,9/29/05,Politician,Sen. Chuck Schumer
2005,doctor,9/6/05,Science,Dr. Marc Siegel
2005,actor,9/7/05,Acting,Samuel L. Jackson
2005,journalist,9/8/05,Media,Brian Williams
2006,actor,1/10/06,Acting,Albert Brooks
2006,Broadcaster,1/11/06,Media,Peter Bergen
2006,lawyer,1/12/06,Misc,Edward Lazarus
2006,author,1/16/06,Media,Eugene Jarecki
2006,diplomat,1/17/06,Government,L. Paul Bremer
2006,lawyer,1/18/06,Misc,R. James Woolsey
2006,actor,1/19/06,Acting,Josh Lucas
2006,commentator,1/23/06,Media,Fred Barnes
2006,Professor,1/24/06,Academic,Reza Aslan
2006,actor,1/25/06,Acting,Anthony Hopkins
2006,intellectual,1/26/06,Academic,Bernard-Henri Lí©vy
2006,singer,1/30/06,Musician,Randy Jackson
2006,basketball player,1/31/06,Athletics,Charles Barkley
2006,journalist,1/4/06,Media,George Packer
2006,actor,1/5/06,Acting,Pierce Brosnan
2006,journalist,1/9/06,Media,James Risen
2006,stand-up comedian,10/10/06,Comedy,David Cross
2006,television personality,10/11/06,Media,Lou Dobbs
2006,journalist,10/12/06,Media,David Mark
2006,essayist,10/16/06,Media,Frank Rich
2006,actress,10/17/06,Acting,Amy Sedaris
2006,former governor of missouri,10/18/06,Politician,John Ashcroft
2006,actress,10/19/06,Acting,Kirsten Dunst
2006,Former United States Senator,10/2/06,Politician,Trent Lott
2006,stand-up comedian,10/3/06,Comedy,Dennis Miller
2006,basketball player,10/30/06,Athletics,LeBron James
2006,political scientist,10/31/06,Consultant,John Mueller
2006,political scientist,10/4/06,Consultant,Ian Bremmer
2006,writer,10/5/06,Media,David Rakoff
2006,former white house chief of staff,10/9/06,Politician,James Baker
2006,NA,11/1/06,NA,None
2006,actress,11/13/06,Acting,Tina Fey
2006,former american senator,11/14/06,Politician,John Edwards
2006,Broadcaster,11/15/06,Media,Ted Koppel
2006,Entrepreneur,11/16/06,Business,Muhammad Yunus
2006,actor,11/2/06,Acting,Sacha Baron Cohen
2006,Mayor of Chicago,11/27/06,Politician,Rahm Emanuel
2006,Singer-songwriter,11/28/06,Musician,Tom Waits
2006,actor,11/29/06,Acting,George Clooney
2006,Rock duo,11/30/06,Musician,Tenacious D
2006,comedian,11/6/06,Comedy,Jerry Seinfeld
2006,journalist,11/7/06,Media,Dan Rather
2006,former governor of vermont,11/8/06,Politician,Howard Dean
2006,actor,11/9/06,Acting,Dustin Hoffman
2006,former governor of rhode island,12/11/06,Politician,Lincoln Chafee
2006,journalist,12/12/06,Media,Fareed Zakaria
2006,Comedian,12/13/06,Comedy,Ricky Gervais
2006,Journalist,12/14/06,Media,Rajiv Chandrasekaran
2006,United States Secretary of Agriculture,12/18/06,Politician,Tom Vilsack
2006,commentator,12/19/06,Media,Bill Kristol
2006,actor,12/20/06,Acting,Ben Stiller
2006,actor,12/4/06,Acting,Nathan Lane
2006,former us senator,12/5/06,Politician,John Danforth
2006,author,12/6/06,Media,Eve Herold
2006,high-altitude mountaineer,12/7/06,Athletics,Ed Viesturs
2006,Historian,2/1/06,Academic,Michael Beschloss
2006,astronaut,2/13/06,Science,Astronaut Mike Mullane
2006,Economist,2/14/06,Academic,Peter Tertzakian
2006,actress,2/15/06,Acting,Julianne Moore
2006,actor,2/16/06,Acting,Ed Harris
2006,journalist,2/2/06,Media,"Robert O'Harrow, Jr."
2006,Author,2/21/06,Media,Sarah Vowell
2006,actor,2/22/06,Acting,Matthew Fox
2006,Film critic,2/23/06,Media,Roger Ebert
2006,communications consultant,2/7/06,Political Aide,Torie Clarke
2006,actor,2/8/06,Acting,Harrison Ford
2006,actor,2/9/06,Acting,Will Arnett
2006,author,3/13/06,Media,Eric Burns
2006,scholar,3/14/06,Academic,Bart Ehrman
2006,actress,3/15/06,Acting,Natalie Portman
2006,actor,3/16/06,Acting,Vin Diesel
2006,actor,3/20/06,Acting,Clive Owen
2006,author,3/21/06,Media,Georges Sada
2006,us senator,3/22/06,Politician,Senator Russ Feingold
2006,Professor,3/23/06,Academic,Michael Mandelbaum
2006,journalist,3/27/06,Media,Michael Gordon
2006,journalist,3/28/06,Media,Fareed Zakaria
2006,Singer,3/29/06,Musician,Queen Latifah
2006,actress,3/30/06,Acting,Sharon Stone
2006,author,3/7/06,Media,Eugene Linden
2006,Singer-songwriter,3/8/06,Musician,Neil Young
2006,historian,3/9/06,Academic,Bruce Bartlett
2006,editor,4/17/06,Media,Jon Meacham
2006,journalist,4/18/06,Media,Ryan Nerz
2006,actor,4/19/06,Acting,Dennis Quaid
2006,Former United States Senator,4/20/06,Politician,Ted Kennedy
2006,israeli official,4/24/06,Government,Efraim Halevy
2006,actor,4/25/06,Acting,Tom Selleck
2006,Author,4/26/06,Media,Kimberley Strassel
2006,actor,4/27/06,Acting,Robin Williams
2006,Comedian,4/3/06,Comedy,Ricky Gervais
2006,Author,4/4/06,Media,Studs Terkel
2006,military,4/5/06,Military,Tony Zinni
2006,actor,4/6/06,Acting,Josh Hartnett
2006,Journalist,5/1/06,Media,Matthew Continetti
2006,comedian,5/10/06,Comedy,Billy Connolly
2006,political scientist,5/11/06,Consultant,Francis Fukuyama
2006,former governor of vermont,5/15/06,Politician,Howard Dean
2006,actor,5/16/06,Acting,Denis Leary
2006,Columnist,5/17/06,Media,Ramesh Ponnuru
2006,Singer-songwriter,5/18/06,Musician,Willie Nelson
2006,Former United States Secretary of State,5/2/06,Politician,Madeleine Albright
2006,inspector general of homeland security department,5/3/06,Government,Clark Kent Ervin
2006,actor,5/4/06,Acting,John Malkovich
2006,journalist,5/8/06,Media,David Remnick
2006,reporter,5/9/06,Media,Eric Shawn
2006,journalist,6/12/06,Media,Thomas Friedman
2006,American Political figure,6/13/06,Politician,Ken Mehlman
2006,journalist,6/14/06,Media,Tim Russert
2006,comedian,6/15/06,Comedy,Louis C.K.
2006,journalist,6/19/06,Media,Calvin Trillin
2006,journalist,6/20/06,Media,Juliet Eilperin
2006,journalist,6/21/06,Media,Anderson Cooper
2006,actor,6/22/06,Acting,Adam Sandler
2006,Professional Road Racing Cyclist,6/26/06,Athletics,Lance Armstrong
2006,author,6/27/06,Media,Helen Thomas
2006,former vice president,6/28/06,Politician,Al Gore
2006,actor,6/29/06,Acting,Kevin Spacey
2006,author,6/5/06,Media,Caroline Kennedy
2006,former us secretary of education,6/6/06,Politician,William John Bennett
2006,actress,6/7/06,Acting,Bonnie Hunt
2006,actress,6/8/06,Acting,Lily Tomlin
2006,telvision actor,7/10/06,Acting,Ilario Pantano
2006,former white house counsel,7/11/06,Political Aide,John Dean
2006,actor,7/12/06,Acting,Shawn Wayans
2006,actor,7/13/06,Acting,Owen Wilson
2006,lawyer,7/17/06,Misc,Gordon G. Chang
2006,Film director,7/18/06,Media,M. Night Shyamalan
2006,author,7/19/06,Media,James Maguire
2006,actor,7/20/06,Acting,Paul Giamatti
2006,us senator,7/24/06,Politician,John McCain
2006,actor,7/25/06,Acting,Edward Burns
2006,Journalist,7/26/06,Media,Sharon Weinberger
2006,political expert,7/27/06,Consultant,Alon Ben-Meir
2006,actor,7/31/06,Acting,Will Ferrell
2006,Academic,8/1/06,Academic,Vali Nasr
2006,race car driver,8/10/06,Athletics,"Dale Earnhardt, Jr."
2006,Journalist,8/14/06,Media,Thomas E. Ricks
2006,actor,8/15/06,Acting,Samuel L. Jackson
2006,Former Governor of New Jersey,8/16/06,Politician,Thomas Kean
2006,actor,8/17/06,Acting,Matt Dillon
2006,filmmaker,8/2/06,Media,Chris Paine
2006,Professor,8/21/06,Academic,Reza Aslan
2006,Former member of the United States Senate,8/22/06,Politician,William Cohen
2006,author,8/23/06,Media,Frederick S. Lane
2006,actor,8/24/06,Acting,Martin Short
2006,actor,8/3/06,Acting,Danny DeVito
2006,journalist,8/8/06,Media,Brian Williams
2006,editor,8/9/06,Media,Craig Glenday
2006,actress,9/11/06,Acting,Maggie Gyllenhaal
2006,former us senator,9/12/06,Politician,Gary Hart
2006,political figure,9/13/06,Politician,Ed Gillespie
2006,Stand-up comedian,9/14/06,Comedy,Norm Macdonald
2006,us president,9/18/06,Politician,Bill Clinton
2006,actor,9/19/06,Acting,Ben Affleck
2006,stunt perfomrer,9/20/06,Acting,Johnny Knoxville
2006,documentarian,9/21/06,Media,CC Goldwater
2006,Former Assistant to the President for Communications,9/25/06,Political Aide,Pat Buchanan
2006,Former President of Pakistan,9/26/06,Politician,Pervez Musharraf
2006,united states senator,9/27/06,Politician,Al Franken
2006,former governor of new jersey,9/28/06,Politician,Jim McGreevey
2007,actress,1/1/07,Acting,Meryl Streep
2007,author,1/1/07,Media,Sam Sheridan
2007,former governor of arkansas,1/10/07,Politician,Fmr. Gov. Mike Huckabee
2007,Film actor,1/11/07,Acting,Peter O'Toole
2007,author,1/15/07,Media,Josh Bernstein
2007,Historian,1/16/07,Academic,Michael Oren
2007,american football wide reciever,1/17/07,Athletics,Jerry Rice
2007,actress,1/18/07,Acting,Robin Wright Penn
2007,military,1/22/07,Military,Gen. Rupert Smith
2007,Governor of Virginia,1/23/07,Politician,Terry McAuliffe
2007,Former White House Press Secretary,1/24/07,Political Aide,Scott McClellan
2007,us senator,1/25/07,Politician,Sen. Chuck Schumer
2007,busines magnate,1/29/07,Business,Bill Gates
2007,Astrophysicist,1/30/07,Science,Neil deGrasse Tyson
2007,us senator,1/31/07,Politician,Sen. Joe Biden
2007,comedian,1/8/07,Comedy,Louis C.K.
2007,philosopher,1/9/07,Academic,Harry Frankfurt
2007,commentator,10/1/07,Media,Jack Cafferty
2007,Author,10/10/07,Media,Lynne Cheney
2007,journalist,10/11/07,Media,Howard Kurtz
2007,Former White House Press Secretary,10/15/07,Political Aide,Tony Snow
2007,Comedian,10/16/07,Comedy,Stephen Colbert
2007,actor,10/17/07,Acting,Jake Gyllenhaal
2007,actor,10/18/07,Acting,Ben Affleck
2007,commentator,10/2/07,Media,Chris Matthews
2007,Columnist,10/29/07,Media,Michael Gerson
2007,Broadcaster,10/3/07,Media,Ted Koppel
2007,author,10/30/07,Media,Valerie Plame Wilson
2007,baseball player,10/31/07,Athletics,David Wright
2007,law professor,10/4/07,Academic,Jack Goldsmith
2007,Former President of Mexico,10/8/07,Politician,Vicente Fox
2007,American football running back,10/9/07,Athletics,Tiki Barber
2007,comedian,11/1/07,Comedy,Jerry Seinfeld
2007,actress,2/1/07,Acting,Sienna Miller
2007,academic,2/12/07,Academic,Jeffrey Rosen
2007,author,2/13/07,Media,Christopher Horner
2007,author,2/14/07,Media,Ishmael Beah
2007,journalist,2/15/07,Media,Meredith Vieira
2007,entrepreneur,2/26/07,Business,Craig Newmark
2007,basketball player,2/27/07,Athletics,John Amaechi
2007,actor,2/28/07,Acting,Jake Gyllenhaal
2007,Chef,2/5/07,Misc,Walter Scheib
2007,television host,2/6/07,Media,Mike Rowe
2007,activist,2/7/07,Advocacy,Ralph Nader
2007,musician,2/8/07,Musician,John Mellencamp
2007,minister,3/1/07,Clergy,Rev. Al Sharpton
2007,us senator,3/12/07,Politician,Sen. Christopher Dodd
2007,director,3/13/07,Media,John Waters
2007,Former United States National Security Advisor,3/14/07,Government,Zbigniew Brzezinski
2007,actress,3/15/07,Acting,Sandra Bullock
2007,Professor,3/19/07,Academic,Stephen Prothero
2007,lawyer,3/20/07,Misc,John Bolton
2007,journalist,3/21/07,Media,Chris Hansen
2007,actor,3/22/07,Acting,Don Cheadle
2007,us senator,3/26/07,Politician,Sen. John Kerry
2007,stand-up comedian,3/27/07,Comedy,Dennis Miller
2007,former governor of new mexico,3/28/07,Politician,Gov. Bill Richardson
2007,Psychologist,3/29/07,Academic,Philip Zimbardo
2007,journalist,3/5/07,Media,Bob Woodruff
2007,Surgeon,3/6/07,Science,Richard Jadick
2007,Trumpeter,3/7/07,Musician,Wynton Marsalis
2007,0,3/8/07,NA,John Bambenek
2007,physician,3/8/07,Science,Dr. Sharon Moalem
2007,Writer,4/10/07,Media,Walter Isaacson
2007,actress,4/11/07,Acting,Halle Berry
2007,Writer,4/12/07,Media,Richard Preston
2007,former white house chief of staff,4/16/07,Politician,Andrew Card
2007,television Actor,4/17/07,Acting,Sig Hansen
2007,minister of defense,4/18/07,Politician,Ali Allawi
2007,editor,4/19/07,Media,Jeremy Scahill
2007,Reporter,4/23/07,Media,Matthew Cooper
2007,us senator,4/24/07,Politician,Sen. John McCain
2007,comedian,4/25/07,Comedy,Garry Shandling
2007,actor,4/26/07,Acting,Richard Gere
2007,author,4/30/07,Media,Christopher Hitchens
2007,former american senator,4/9/07,Politician,Bill Bradley
2007,actor,5/1/07,Acting,Tobey Maguire
2007,Professor,5/10/07,Academic,Reza Aslan
2007,broadcaster,5/14/07,Media,Jeremy Paxman
2007,journalist,5/15/07,Media,Tim Russert
2007,comedian,5/16/07,Comedy,Don Rickles
2007,editor,5/17/07,Media,Brink Lindsey
2007,Film-maker,5/2/07,Media,Pierre Rehov
2007,Journalist,5/21/07,Media,Zaki Chehab
2007,Former United States Secretary of Education,5/22/07,Politician,Margaret Spellings
2007,military,5/23/07,Military,Lt. Col. Kevin Robbins
2007,former vice president,5/24/07,Politician,Al Gore
2007,Broadcaster,5/3/07,Media,Ted Koppel
2007,writer,5/7/07,Media,Lee Gutkind
2007,professor,5/8/07,Academic,George Tenet
2007,Historian,5/9/07,Academic,Michael Beschloss
2007,comedian,6/11/07,Comedy,David Steinberg
2007,political consultant,6/12/07,Consultant,Robert Shrum
2007,historian,6/13/07,Academic,Allan Brandt
2007,actress,6/14/07,Acting,Angelina Jolie
2007,actor,6/18/07,Acting,Steve Carell
2007,journalist,6/19/07,Media,Brian Williams
2007,journalist,6/20/07,Media,Fareed Zakaria
2007,writer,6/21/07,Media,Greg Bear
2007,journalist,6/25/07,Media,Steve Vogel
2007,actor,6/26/07,Acting,Bruce Willis
2007,Filmmaker,6/27/07,Media,Michael Moore
2007,actress,6/28/07,Acting,Claire Danes
2007,us representative,6/4/07,Politician,Rep. Ron Paul
2007,actor,6/5/07,Acting,Paul Rudd
2007,Pundit,6/6/07,Consultant,Michael Barone
2007,stand-up comedian,6/7/07,Comedy,Eddie Izzard
2007,broadcaster,7/16/07,Media,Josh Rushing
2007,actor,7/17/07,Acting,Christopher Walken
2007,Cartoonist,7/18/07,Media,Matt Groening
2007,actor,7/19/07,Acting,Adam Sandler
2007,Astrophysicist,7/23/07,Science,Neil deGrasse Tyson
2007,professor,7/24/07,Academic,Robert Pallitto
2007,Correspondent,7/25/07,Media,Rob Gifford
2007,Historian,7/26/07,Academic,Robert Dallek
2007,journalist,7/30/07,Media,Alastair Campbell
2007,advocate,7/31/07,Advocacy,Lewis Gordon Pugh
2007,author,8/1/07,Media,Jed Babbin
2007,commentator,8/13/07,Media,Bill Kristol
2007,actor,8/14/07,Acting,Denis Leary
2007,Columnist,8/15/07,Media,Stephen F. Hayes
2007,us senator,8/16/07,Politician,Sen. John McCain
2007,actor,8/2/07,Acting,Matt Damon
2007,Author,8/20/07,Media,Nikolas Kozloff
2007,author,8/21/07,Media,Alan Weisman
2007,us senator,8/22/07,Politician,Sen. Barack Obama
2007,military,8/23/07,Military,Lt. Col. John Nagl
2007,actor,8/7/07,Acting,Andy Samberg
2007,us senator,8/8/07,Politician,Sen. Joe Biden
2007,Writer,8/9/07,Media,Tal Ben-Shahar
2007,comedian,9/10/07,Comedy,Jeff Garlin
2007,actress,9/11/07,Acting,Jodie Foster
2007,Freelance writer,9/12/07,Media,Robert Draper
2007,journalist,9/13/07,Media,Douglas Farah
2007,economist,9/18/07,Academic,Alan Greenspan
2007,political figure,9/19/07,Politician,Gen. Wesley Clark
2007,president,9/20/07,Politician,President Bill Clinton
2007,author,9/24/07,Media,John Bowe
2007,president,9/25/07,Politician,President Evo Morales
2007,actor,9/26/07,Acting,Jamie Foxx
2007,Filmmaker,9/27/07,Media,Ken Burns
2008,Author,1/1/08,Media,Peggy Noonan
2008,Consultant,1/1/08,Political Aide,Tim Gunn
2008,television host,1/1/08,Media,Conan O'Brien
2008,television personality,1/10/08,Media,Lou Dobbs
2008,journalist,1/14/08,Media,Fareed Zakaria
2008,lawyer,1/15/08,Misc,John Bolton
2008,columnist,1/16/08,Media,Jonah Goldberg
2008,consultant,1/17/08,Political Aide,Allen Raymond
2008,editor,1/21/08,Media,Jon Meacham
2008,writer,1/22/08,Media,Jim Wallis
2008,Political satirist,1/23/08,Media,P. J. O'Rourke
2008,journalist,1/24/08,Media,Gerri Willis
2008,American football quarterback,1/28/08,Athletics,Phil Simms
2008,biographer,1/29/08,Media,Doris Kearns Goodwin
2008,Author,1/30/08,Media,Peggy Noonan
2008,correspondent,1/31/08,Media,Karen Tumulty
2008,television Actor,1/7/08,Acting,Ronald Seeber
2008,commentator,1/8/08,Media,David Frum
2008,author,1/9/08,Media,John Zogby
2008,editor,10/1/08,Media,Gideon Rose
2008,author,10/13/08,Media,Amity Shlaes
2008,former white house press secretary,10/14/08,Political Aide,Ari Fleischer
2008,Comedian,10/15/08,Comedy,Richard Lewis
2008,Former United States Secretary of Labor,10/16/08,Politician,Robert Reich
2008,actor,10/2/08,Acting,Clint Eastwood
2008,author,10/20/08,Media,Eugene Jarecki
2008,author of novels,10/21/08,Media,Christopher Buckley
2008,Journalist,10/22/08,Media,Tom Brokaw
2008,former us senator,10/23/08,Politician,Jon Corzine
2008,reporter,10/27/08,Media,Campbell Brown
2008,Comedian,10/28/08,Comedy,Steve Martin
2008,us president,10/29/08,Politician,Barack Obama
2008,commentator,10/30/08,Media,Bill Kristol
2008,actor,10/6/08,Acting,Tim Robbins
2008,Author,10/7/08,Media,Sarah Vowell
2008,First Lady of the United States,10/8/08,Politician,Michelle Obama
2008,actor,10/9/08,Acting,Robert De Niro
2008,Journalist,11/11/08,Media,Thomas L. Friedman
2008,Business magnate,11/12/08,Business,T. Boone Pickens
2008,television host,11/13/08,Media,Bill O'Reilly
2008,journalist,11/17/08,Media,David Frost
2008,actor,11/18/08,Acting,Denis Leary
2008,editor,11/19/08,Media,Jon Meacham
2008,Stand-up comedian,11/20/08,Comedy,Richard Belzer
2008,biographer,11/3/08,Media,Doris Kearns Goodwin
2008,NA,11/4/08,NA,Indecision 2008 Live Election Night Special
2008,television host,11/5/08,Media,Chris Wallace
2008,actor,11/6/08,Acting,Paul Rudd
2008,actress,12/1/08,Acting,Anne Hathaway
2008,comedian,12/10/08,Comedy,Don Rickles
2008,actor,12/11/08,Acting,Philip Seymour Hoffman
2008,journalist,12/2/08,Media,Calvin Trillin
2008,author,12/3/08,Media,Arianna Huffington
2008,Film director,12/4/08,Media,Ron Howard
2008,Author,12/8/08,Media,Matthew Alexander
2008,Former Governor of Arkansas,12/9/08,Politician,Mike Huckabee
2008,author,2/11/08,Media,Philip Shenon
2008,commentator,2/12/08,Media,Bill Kristol
2008,author,2/13/08,Media,Mark Siegel
2008,writer,2/14/08,Media,Lee Siegel
2008,Former United States Secretary of State,2/26/08,Politician,Madeleine Albright
2008,professor,2/27/08,Academic,Allen Guelzo
2008,journalist,2/28/08,Media,Brian Williams
2008,Comedian,2/4/08,Comedy,Stephen Colbert
2008,television host,2/5/08,Media,Chris Wallace
2008,Journalist,2/6/08,Media,Tom Brokaw
2008,Writer,2/7/08,Media,Laton McCartney
2008,military,3/10/08,Military,Lt. Gen. William B. Caldwell
2008,political advocate,3/11/08,Advocacy,Grover G. Norquist
2008,Journalist,3/12/08,Media,Ronald Kessler
2008,former white house press secretary,3/13/08,Political Aide,Dana Perino
2008,author,3/17/08,Media,Brian Fagan
2008,economist,3/18/08,Academic,Jeffrey Sachs
2008,former us senator,3/19/08,Politician,Arlen Specter
2008,journalist,3/20/08,Media,Alex Kingsbury
2008,former us secretary of state,3/3/08,Politician,Hillary Clinton
2008,us secretary of defense,3/31/08,Politician,Chuck Hagel
2008,activist,3/4/08,Advocacy,Ralph Nader
2008,Author,3/5/08,Media,Martin Fletcher
2008,Former U.S. senator,3/6/08,Politician,Tom Daschle
2008,Neuroscientist,4/1/08,Science,Simon LeVay
2008,journalist,4/10/08,Media,Aram Roston
2008,screenwriter,4/14/08,Media,Judd Apatow
2008,law professor,4/15/08,Academic,Jack Goldsmith
2008,Journalist,4/16/08,Media,Peter Steinfels
2008,actress,4/17/08,Acting,Uma Thurman
2008,Author,4/2/08,Media,William Safire
2008,us president,4/21/08,Politician,Barack Obama
2008,director,4/22/08,Media,John Waters
2008,journalist,4/23/08,Media,Howard Fineman
2008,actor,4/24/08,Acting,Colin Firth
2008,presidnet,4/28/08,Politician,President Jimmy Carter
2008,Former U.S. Representative,4/29/08,Politician,Newt Gingrich
2008,actor,4/3/08,Acting,George Clooney
2008,Editor,4/30/08,Media,Robert Schlesinger
2008,actor,4/7/08,Acting,Nathan Lane
2008,journalist,4/8/08,Media,Cokie Roberts
2008,Journalist,4/9/08,Media,Steve Coll
2008,former governor of vermont,5/1/08,Politician,Howard Dean
2008,university professor,5/12/08,Academic,Douglas J. Feith
2008,former white house press secretary,5/13/08,Political Aide,Bill Moyers
2008,journalist,5/14/08,Media,John Harwood
2008,actor,5/15/08,Acting,Denis Leary
2008,Author,5/27/08,Media,Matt Taibbi
2008,security expert,5/28/08,Consultant,Fred Burton
2008,Adviser,5/29/08,Consultant,Richard A. Clarke
2008,former majority leader,5/5/08,Politician,Harry Reid
2008,journalist,5/6/08,Media,Fareed Zakaria
2008,us senator,5/7/08,Politician,John McCain
2008,professor,5/8/08,Academic,David D. Perlmutter
2008,activist,6/10/08,Advocacy,Ralph Reed
2008,author,6/11/08,Media,Rick Shenkman
2008,Journalist,6/12/08,Media,Richard Engel
2008,attorney,6/16/08,Misc,David Iglesias
2008,Journalist,6/17/08,Media,Lara Logan
2008,actor,6/18/08,Acting,Steve Carell
2008,actor,6/19/08,Acting,Mike Myers
2008,Former White House Press Secretary,6/2/08,Political Aide,Scott McClellan
2008,actor,6/23/08,Acting,James McAvoy
2008,journalist,6/24/08,Media,James Harding
2008,rock band,6/25/08,Musician,Coldplay
2008,Broadcaster,6/26/08,Media,Ted Koppel
2008,humorist,6/3/08,Media,David Sedaris
2008,broadcaster,6/4/08,Media,Barbara Walters
2008,actor,6/5/08,Acting,Adam Sandler
2008,former us senator,6/9/08,Politician,Jim Webb
2008,journalist,7/14/08,Media,Andrew Ward
2008,actor,7/15/08,Acting,Pierce Brosnan
2008,analyst,7/16/08,Consultant,Kenneth Pollack
2008,actress,7/17/08,Acting,Maggie Gyllenhaal
2008,Author,7/21/08,Media,Richard Bitner
2008,actor,7/22/08,Acting,Will Ferrell and John C. Reilly
2008,actor,7/22/08,Acting,Will Ferrell and John C. Reilly
2008,author,7/23/08,Media,T.J. English
2008,television host,7/24/08,Media,Geo Beach
2008,former speaker of the the house,7/28/08,Politician,Rep. Nancy Pelosi
2008,author,7/29/08,Media,Bill Bishop
2008,author,7/30/08,Media,Ben Wattenberg
2008,journalist,7/31/08,Media,Brian Williams
2008,Journalist,8/11/08,Media,Ron Suskind
2008,former us senator,8/12/08,Politician,Mel Martinez
2008,journalist,8/13/08,Media,Philip P. Pan
2008,actor,8/14/08,Acting,Ben Stiller
2008,United States Senator,8/26/08,Politician,Tim Kaine
2008,former governor of vermont,8/27/08,Politician,Howard Dean
2008,former senator,8/28/08,Politician,Evan Bayh
2008,0,8/29/08,NA,(no guest)
2008,actor,8/4/08,Acting,Dennis Hopper
2008,actor,8/5/08,Acting,Seth Rogen
2008,us senator,8/6/08,Politician,Chuck Schumer
2008,television host,8/7/08,Media,David Gregory
2008,journalist,9/15/08,Media,Barton Gellman
2008,Comedian,9/16/08,Comedy,Ricky Gervais
2008,actress,9/17/08,Acting,Charlize Theron
2008,Former British Prime Minister,9/18/08,Politician,Tony Blair
2008,journalist,9/2/08,Media,Brian Williams
2008,us president,9/23/08,Politician,Bill Clinton
2008,film actor,9/24/08,Acting,Aaron Eckhart
2008,journalist,9/25/08,Media,Bob Schieffer
2008,journalist,9/29/08,Media,Hooman Majd
2008,Former U.S. Representative,9/3/08,Politician,Newt Gingrich
2008,comedian,9/30/08,Comedy,Bill Maher
2008,Former Governor of Arkansas,9/4/08,Politician,Mike Huckabee
2008,0,9/5/08,NA,(no guest)
2009,author,1/12/09,Media,Maxwell Kennedy
2009,actor,1/13/09,Acting,Daniel Craig
2009,journalist,1/14/09,Media,Fareed Zakaria
2009,editor,1/15/09,Media,Bethany McLean
2009,JOURNALIST,1/19/09,Media,Abderrahim Foukara
2009,canon,1/20/09,Clergy,Rt. Rev. V. Gene Robinson
2009,correspondent,1/21/09,Media,David Sanger
2009,actor,1/22/09,Acting,Liam Neeson
2009,presidnet,1/26/09,Politician,President Jimmy Carter
2009,journalist,1/27/09,Media,Gwen Ifill
2009,Astrophysicist,1/28/09,Science,Neil DeGrasse Tyson
2009,Political Scientist,1/29/09,Consultant,P. W. Singer
2009,television host,1/5/09,Media,David Gregory
2009,Author,1/6/09,Media,Michael Wolff
2009,television host,1/7/09,Media,Rachel Maddow
2009,former white house press secretary,1/8/09,Political Aide,Dana Perino
2009,comedian,10/1/09,Comedy,Joy Behar
2009,former governor of arizona,10/12/09,Politician,Janet Napolitano
2009,aviator,10/13/09,Misc,Chesley Sullenberger
2009,author,10/14/09,Media,Barbara Ehrenreich
2009,author,10/15/09,Media,Jennifer Burns
2009,Stand-up comedian,10/26/09,Comedy,Susie Essman
2009,economist,10/27/09,Academic,Steven Levitt
2009,activist,10/28/09,Advocacy,Dr. Mustafa Barghouti and Anna Baltzer
2009,public speaker,10/28/09,Misc,Dr. Mustafa Barghouti and Anna Baltzer
2009,Comedian,10/29/09,Comedy,Wanda Sykes
2009,Author,10/5/09,Media,Sarah Vowell
2009,United States Secretary of the Navy,10/6/09,Politician,Ray Mabus
2009,Innovator,10/7/09,Academic,William Kamkwamba
2009,television host,10/8/09,Media,David Gregory
2009,Tennis player,11/10/09,Athletics,Serena Williams
2009,musician,11/11/09,Musician,Clarence Clemons
2009,primatologist,11/12/09,Science,Jane Goodall
2009,journalist,11/16/09,Media,Jake Adelstein
2009,vice president,11/17/09,Politician,Joe Biden
2009,television personality,11/18/09,Media,Lou Dobbs
2009,rock band,11/19/09,Musician,Jack's Mannequin
2009,us senator,11/2/09,Politician,Bob Menendez
2009,political strategist,11/3/09,Consultant,David Plouffe
2009,Journalist,11/30/09,Media,Maziar Bahari
2009,former vice president,11/4/09,Politician,Al Gore
2009,United States Ambassador to the United Nations,11/5/09,Government,Susan Rice
2009,Former United States Senator,11/9/09,Politician,Kit Bond
2009,journalist,12/1/09,Media,Thomas Friedman
2009,journalist,12/10/09,Media,Gwen Ifill
2009,actress,12/14/09,Acting,Sigourney Weaver
2009,Former United States Secretary of Transportation,12/15/09,Politician,Ray LaHood
2009,actor,12/16/09,Acting,Hugh Grant
2009,Professional Road Racing Cyclist,12/2/09,Athletics,Lance Armstrong
2009,Journalist,12/3/09,Media,Michael Specter
2009,journalist,12/7/09,Media,Dan Rather
2009,Former Governor of Arkansas,12/8/09,Politician,Mike Huckabee
2009,journalist,12/9/09,Media,Andrew Ross Sorkin
2009,journalist,2/10/09,Media,Thomas Ricks
2009,professor,2/11/09,Academic,Daniel Sperling
2009,former governor of new hampshire,2/12/09,Politician,John Sununu
2009,former director of the national economic counscil,2/2/09,Government,Lawrence Lindsey
2009,business magnate,2/23/09,Business,Jeff Bezos
2009,Comedian,2/24/09,Comedy,Ricky Gervais
2009,actor,2/25/09,Acting,Tom Selleck
2009,journalist,2/26/09,Media,Brian Williams
2009,actor,2/3/09,Acting,Dev Patel
2009,author,2/4/09,Media,Karen Greenberg
2009,Author,2/5/09,Media,Randall Balmer
2009,Writer,2/9/09,Media,Walter Isaacson
2009,author,3/10/09,Media,Craig Mullaney
2009,actor,3/11/09,Acting,Paul Rudd
2009,television personality,3/12/09,Media,Jim Cramer
2009,military,3/16/09,Military,Gen. Richard B. Myers
2009,actor,3/17/09,Acting,Ian McShane
2009,Entrepreneur,3/18/09,Business,Nandan Nilekani
2009,musician,3/19/09,Musician,Bruce Springsteen
2009,scientist,3/2/09,Science,Harold Varmus
2009,Former Associate Justice of the Supreme Court of the United States,3/3/09,Government,Sandra Day O'Connor
2009,commentator,3/30/09,Media,Jack Cafferty
2009,actor,3/31/09,Acting,Seth Rogen
2009,journalist,3/4/09,Media,Joe Nocera
2009,actor,3/5/09,Acting,Billy Crudup
2009,author,3/9/09,Media,Nathaniel Frank
2009,Former Director of the Office of Management and Budget,4/1/09,Government,Peter R. Orszag
2009,Baseball athlete,4/14/09,Athletics,Ron Darling
2009,us senator,4/15/09,Politician,Elizabeth Warren
2009,actor,4/16/09,Acting,Ben Affleck
2009,Author,4/2/09,Media,Tom Zoellner
2009,Professor,4/20/09,Academic,Reza Aslan
2009,president of liberia,4/21/09,Politician,Ellen Johnson Sirleaf
2009,author,4/22/09,Media,Philip Alcabes
2009,Historian,4/23/09,Academic,Richard Beeman
2009,lawyer,4/27/09,Misc,Christine Lagarde
2009,journalist,4/28/09,Media,Clifford May
2009,biographer,4/29/09,Media,Doris Kearns Goodwin
2009,actor,4/30/09,Acting,Hugh Jackman
2009,actor,4/6/09,Acting,Michael J. Fox
2009,first lady of egypt,4/7/09,Politician,Jehan Al Sadat
2009,Minority Leader of the United States House of Representatives,4/8/09,Politician,Nancy Pelosi
2009,Writer,4/9/09,Media,William D. Cohan
2009,scholar,5/11/09,Academic,Frank Partnoy
2009,actor,5/12/09,Acting,Tom Hanks
2009,author,5/13/09,Media,Husain Haqqani
2009,EPA administrator,5/14/09,Government,Lisa P. Jackson
2009,Racing driver,5/18/09,Athletics,Sarah Fisher
2009,Former U.S. Representative,5/19/09,Politician,Newt Gingrich
2009,attorney,5/20/09,Misc,Elizabeth Edwards
2009,television host,5/21/09,Media,Larry King
2009,actor,5/4/09,Acting,Denis Leary
2009,journalist,5/5/09,Media,Fareed Zakaria
2009,white house sommunications director,5/6/09,Political Aide,George Stephanopoulos
2009,Former United States Secretary of the Interior,5/7/09,Politician,Ken Salazar
2009,journalist,6/1/09,Media,Bob Woodruff
2009,Businessman,6/10/09,Business,Saad Mohseni
2009,journalist,6/11/09,Media,Katie Couric
2009,actor,6/15/09,Acting,Ed Helms
2009,Writer,6/16/09,Media,Tom Folsom
2009,Journalist,6/17/09,Media,Peter Laufer
2009,Former Governor of Arkansas,6/18/09,Politician,Mike Huckabee
2009,Political satirist,6/2/09,Media,P.J. O'Rourke
2009,basketball player,6/22/09,Athletics,Bill Russell
2009,Comedian,6/23/09,Comedy,Larry David
2009,Professor,6/24/09,Academic,Reza Aslan
2009,actress,6/25/09,Acting,Cameron Diaz
2009,Neurologist,6/29/09,Science,Oliver Sacks
2009,Author,6/3/09,Media,Michael Lewis
2009,Author,6/30/09,Media,Mike Kim
2009,actor,6/4/09,Acting,Will Ferrell
2009,singer,6/8/09,Musician,Gretchen Peters
2009,Financier,6/9/09,Business,Peter Schiff
2009,journalist,7/1/09,Media,Justin Fox
2009,former us representative,7/13/09,Politician,Barney Frank
2009,professor,7/14/09,Academic,Peter Mancall
2009,former hhs secretary,7/15/09,Politician,Kathleen Sebelius
2009,commentator,7/16/09,Media,Robert Glennon
2009,Screenwriter,7/2/09,Media,Robert Kenner
2009,journalist,7/20/09,Media,Brian Williams
2009,Former United States Secretary of Energy,7/21/09,Politician,Steven Chu
2009,actor,7/22/09,Acting,Kevin Nealon
2009,Sports Columnist,7/23/09,Media,Sally Jenkins
2009,commentator,7/27/09,Media,Bill Kristol
2009,Band,7/28/09,Musician,Spinal Tap
2009,lawyer,7/29/09,Misc,John R. Bolton
2009,screenwriter,7/30/09,Media,Judd Apatow
2009,author,8/10/09,Media,Douglas Brinkley
2009,economist,8/11/09,Academic,Austan Goolsbee
2009,author,8/12/09,Media,Larry Lawton (skit)[4] and Jeff Sharlet (interview)
2009,journalist,8/12/09,Media,Larry Lawton (skit)[4] and Jeff Sharlet (interview)
2009,actress,8/13/09,Acting,Rachel McAdams
2009,stand-up comedian,8/17/09,Comedy,David Cross
2009,author,8/18/09,Media,Christopher McDougall
2009,Consultant,8/19/09,Political Aide,Tim Gunn
2009,american politician,8/20/09,Politician,Betsy McCaughey
2009,Journalist,8/3/09,Media,Ronald Kessler
2009,former us representative,8/4/09,Politician,Henry Waxman (D-CA)
2009,actor,8/5/09,Acting,Paul Giamatti
2009,swimmer,8/6/09,Athletics,Dara Torres
2009,basketball player,9/14/09,Athletics,LeBron James
2009,actor,9/15/09,Acting,Matt Damon
2009,Comedian,9/16/09,Comedy,Ricky Gervais
2009,president,9/17/09,Politician,President Bill Clinton
2009,Academic,9/22/09,Academic,Vali Nasr
2009,Former Governor of Pennsylvania,9/23/09,Politician,Tom Ridge
2009,Former Governor of Illinois,9/24/09,Politician,Rod Blagojevich
2009,professor,9/28/09,Academic,Bruce Bueno de Mesquita
2009,Former U.S. Congressman,9/29/09,Politician,Ron Paul
2009,writer,9/30/09,Media,Jon Krakauer
2010,lawyer,1/11/10,Misc,John Yoo
2010,Editor,1/12/10,Media,Paul Ingrassia
2010,musician,1/13/10,Musician,Ringo Starr and The Ben Harper Band
2010,rock band,1/13/10,Musician,Ringo Starr and The Ben Harper Band
2010,Journalist,1/14/10,Media,Tom Brokaw
2010,comptroller of the us,1/18/10,Government,David M. Walker
2010,actor,1/19/10,Acting,Colin Firth
2010,writer,1/20/10,Media,Jim Wallis
2010,actress,1/21/10,Acting,Julie Andrews
2010,busines magnate,1/25/10,Business,Bill Gates
2010,us senator,1/26/10,Politician,Elizabeth Warren
2010,journalist,1/27/10,Media,Ethan Watters
2010,biographer,1/28/10,Media,Doris Kearns Goodwin
2010,Author,1/4/10,Media,Michael Pollan
2010,film director,1/5/10,Media,George Lucas
2010,military,1/6/10,Military,Michael Mullen
2010,actress,1/7/10,Acting,Maggie Gyllenhaal
2010,stunt perfomrer,10/11/10,Acting,Johnny Knoxville
2010,former mjority leader,10/12/10,Politician,Eric Cantor
2010,former us secretary of state,10/13/10,Politician,Condoleezza Rice
2010,writer,10/14/10,Media,David Rakoff
2010,economist,10/25/10,Academic,Austan Goolsbee
2010,Former United States Senator,10/26/10,Politician,Ted Kaufman
2010,president,10/27/10,Politician,President Barack Obama
2010,NA,10/28/10,NA,none
2010,Author,10/4/10,Media,Sam Harris
2010,actor,10/5/10,Acting,Bruce Willis
2010,Writer,10/6/10,Media,Philip Dray
2010,actress,10/7/10,Acting,Naomi Watts
2010,Stand-up comedian,11/1/10,Comedy,Zach Galifianakis
2010,Professional Wrestler,11/10/10,Athletics,Mick Foley
2010,actress,11/11/10,Acting,Rosario Dawson
2010,Track and field athlete,11/15/10,Athletics,Marion Jones
2010,editor,11/16/10,Media,Bethany McLean and Joe Nocera
2010,journalist,11/16/10,Media,Bethany McLean and Joe Nocera
2010,rapper,11/17/10,Musician,Jay-Z
2010,Lawyer,11/18/10,Misc,Philip K. Howard
2010,Historian,11/2/10,Academic,Michael Beschloss
2010,actor,11/29/10,Acting,Judah Friedlander
2010,television host,11/3/10,Media,Chris Wallace
2010,Author,11/30/10,Media,Susan Casey
2010,humorist,11/4/10,Media,David Sedaris
2010,Former Governor of Texas,11/8/10,Politician,Rick Perry
2010,actor,11/9/10,Acting,Harrison Ford
2010,musician,12/1/10,Musician,Sting
2010,former british prime minister,12/13/10,Politician,Gordon Brown
2010,Comedian,12/14/10,Comedy,Ricky Gervais
2010,actor,12/15/10,Acting,Paul Rudd
2010,Former Governor of Arkansas,12/16/10,Politician,Mike Huckabee
2010,Author,12/2/10,Media,Stacy Schiff
2010,military officer,12/6/10,Military,Hugh Shelton
2010,actor,12/7/10,Acting,Seth Green
2010,actress,12/8/10,Acting,Michelle Williams
2010,writer,12/9/10,Media,Edmund Morris
2010,economist,2/1/10,Academic,Austan Goolsbee
2010,Baseball player,2/10/10,Athletics,Willie Mays
2010,actor,2/11/10,Acting,Lee Daniels
2010,journalist,2/2/10,Media,Brian Williams
2010,Comedian,2/22/10,Comedy,Ricky Gervais
2010,comedian,2/23/10,Comedy,Jeff Garlin
2010,actor,2/24/10,Acting,Tracy Morgan
2010,us representative,2/25/10,Politician,Rep. James Clyburn
2010,surgeon,2/3/10,Science,Atul Gawande
2010,former us representative,2/4/10,Politician,Anthony Weiner
2010,investment banker,2/8/10,Business,Jenny Sanford
2010,Former U.S. Representative,2/9/10,Politician,Newt Gingrich
2010,Astrophysicist,3/1/10,Science,Neil DeGrasse Tyson
2010,comedian,3/10/10,Comedy,Jerry Seinfeld
2010,journalist,3/11/10,Media,Eamon Javers
2010,Author,3/15/10,Media,Michael Lewis
2010,actor,3/16/10,Acting,Jude Law
2010,actor,3/17/10,Acting,Snoop Dogg
2010,former governor of washington,3/18/10,Politician,Gary Locke
2010,actor,3/2/10,Acting,Robert Pattinson
2010,actor,3/29/10,Acting,Ben Stiller
2010,Writer,3/3/10,Media,Lynne Olson
2010,actor,3/30/10,Acting,Robin Williams
2010,Journalist,3/31/10,Media,Roxana Saberi
2010,actor,3/4/10,Acting,Scott Patterson
2010,accountant,3/8/10,Misc,Harry Markopolos
2010,Author,3/9/10,Media,Marc Thiessen
2010,television host,4/1/10,Media,Liz Claman
2010,actor,4/12/10,Acting,Bryan Cranston
2010,television host,4/13/10,Media,Rachel Maddow
2010,Diplomat,4/14/10,Government,Richard Burt
2010,actor,4/15/10,Acting,Tracy Morgan
2010,us representative,4/19/10,Politician,John Dingell
2010,author,4/20/10,Media,John M. O'Hara
2010,author,4/21/10,Media,Fred Pearce
2010,actress,4/22/10,Acting,Zoe Saldana
2010,EPA administrator,4/26/10,Government,Lisa P. Jackson
2010,author,4/27/10,Media,Richard Whittle
2010,Former Mayor of Cincinnati,4/28/10,Politician,Ken Blackwell
2010,actor,4/29/10,Acting,Michael Caine
2010,Professor,4/5/10,Academic,Reza Aslan
2010,author,4/6/10,Media,Captain Richard Phillips
2010,actor,4/7/10,Acting,Steve Carell
2010,journalist,4/8/10,Media,David Remnick
2010,historian,5/10/10,Academic,Jack Rakove
2010,Journalist,5/11/10,Media,Sebastian Junger
2010,Director,5/12/10,Media,Michael Patrick King
2010,political scientist,5/13/10,Consultant,Ian Bremmer
2010,journalist,5/3/10,Media,Jonathan Eig
2010,Former First Lady of the United States,5/4/10,Politician,Rosalynn Carter
2010,editor,5/5/10,Media,Jon Meacham
2010,Chef,5/6/10,Misc,Mario Batali
2010,aei president,6/1/10,Advocacy,Arthur C. Brooks
2010,Former Governor of Minnesota,6/10/10,Politician,Tim Pawlenty
2010,actress,6/14/10,Acting,Betty White
2010,professor,6/15/10,Academic,James M. Tabor
2010,comedian,6/16/10,Comedy,Louis C.K.
2010,former us senator,6/17/10,Politician,Fred Thompson
2010,actor,6/2/10,Acting,Morgan Freeman
2010,film director,6/21/10,Media,Josh Fox
2010,actress,6/22/10,Acting,Cameron Diaz
2010,physician,6/23/10,Science,Dr. Connie Mariano
2010,actor,6/24/10,Acting,Adam Sandler and Chris Rock
2010,comedian,6/24/10,Comedy,Adam Sandler and Chris Rock
2010,former senior advisor to the presidnet,6/28/10,Political Aide,David Axelrod
2010,actor,6/29/10,Acting,Helen Mirren
2010,actor,6/3/10,Acting,Jonah Hill
2010,soccer player,6/30/10,Athletics,Landon Donovan and Bob Bradley
2010,soccer manager,6/30/10,Athletics,Landon Donovan and Bob Bradley
2010,actor,6/7/10,Acting,John C. Reilly
2010,author,6/8/10,Media,Christopher Hitchens
2010,Geneticist,6/9/10,Academic,Spencer Wells
2010,author,7/1/10,Media,Jere Van Dyk
2010,Author,7/26/10,Media,William Rosen
2010,journalist,7/27/10,Media,Fareed Zakaria
2010,writer,7/28/10,Media,Robert O'Connell
2010,actor,7/29/10,Acting,Liev Schreiber
2010,actor,7/5/10,Acting,Denis Leary
2010,actress,7/6/10,Acting,Julianne Moore
2010,writer,7/7/10,Media,Daniel Okrent
2010,Novelist,7/8/10,Media,Marilynne Robinson
2010,actor,8/10/10,Acting,Jason Bateman
2010,actress,8/11/10,Acting,Laura Linney
2010,rock band,8/12/10,Musician,Arcade Fire
2010,actress,8/16/10,Acting,Emma Thompson
2010,former us representative,8/17/10,Politician,Dick Armey
2010,author,8/18/10,Media,Edward P. Kohn
2010,actress,8/19/10,Acting,Jennifer Aniston
2010,Author,8/2/10,Media,Mary Roach
2010,Former Governor of Illinois,8/23/10,Politician,Rod Blagojevich
2010,journalist,8/24/10,Media,Brian Williams
2010,actress,8/25/10,Acting,Drew Barrymore
2010,Former Mayor of New York City,8/26/10,Politician,Michael Bloomberg
2010,actor,8/3/10,Acting,Will Ferrell (The interview also featured Rob Riggle
2010,journalist,8/4/10,Media,Bruce B. Henderson
2010,university professor,8/5/10,Academic,Akbar Ahmed
2010,actor,9/13/10,Acting,Ben Affleck
2010,Former British Prime Minister,9/14/10,Politician,Tony Blair
2010,actor,9/15/10,Acting,Jon Hamm
2010,president,9/16/10,Politician,President Bill Clinton
2010,presidnet,9/20/10,Politician,President Jimmy Carter
2010,actress,9/21/10,Acting,Sigourney Weaver
2010,actor,9/22/10,Acting,Edward Norton
2010,king,9/23/10,Politician,H.M. Abdullah II
2010,television host,9/27/10,Media,Bill O'Reilly
2010,author,9/28/10,Media,Arianna Huffington
2010,journalist,9/29/10,Media,Linda Polman
2010,singer-songwriter,9/30/10,Musician,Justin Timberlake
2010,Consultant,9/7/10,Political Aide,Tim Gunn
2010,United States Senator,9/8/10,Politician,Tim Kaine
2010,Columnist,9/9/10,Media,Meghan McCain
2011,actor,1/10/11,Acting,Denis Leary
2011,actor,1/11/11,Acting,Colin Firth
2011,Former Governor of Minnesota,1/12/11,Politician,Tim Pawlenty
2011,Film director,1/13/11,Media,Ron Howard
2011,Broadcaster,1/17/11,Media,Peter Bergen
2011,Astrophysicist,1/18/11,Science,Neil deGrasse Tyson
2011,Baseball player,1/19/11,Athletics,Paul Clemens
2011,political satirist,1/20/11,Media,Kambiz Hosseini and Saman Arbabi
2011,journalist,1/20/11,Media,Kambiz Hosseini and Saman Arbabi
2011,author,1/24/11,Media,Anand Giridharadas
2011,actor,1/25/11,Acting,James Franco
2011,journalist,1/26/11,Media,Jonathan Alter
2011,Business magnate,1/27/11,Business,T. Boone Pickens
2011,actor,1/3/11,Acting,Paul Giamatti
2011,busines magnate,1/31/11,Business,Bill Gates
2011,United States Senator,1/4/11,Politician,Kirsten Gillibrand
2011,internet entrepreneur,1/5/11,Business,Jimmy Wales
2011,Stand-up comedian,1/6/11,Comedy,Patton Oswalt
2011,journalist,10/17/11,Media,Ellen Schultz
2011,journalist,10/18/11,Media,Calvin Trillin
2011,minister,10/19/11,Clergy,Al Sharpton
2011,Journalist,10/20/11,Media,Richard Brookhiser
2011,Puppeteer,10/24/11,Media,Kevin Clash
2011,Writer,10/25/11,Media,Walter Isaacson
2011,physicist,10/26/11,Science,Lisa Randall
2011,legal analyst,10/27/11,Misc,Andrew Napolitano
2011,journalist,10/3/11,Media,Thomas Friedman
2011,actress,10/31/11,Acting,Mindy Kaling
2011,Author,10/4/11,Media,Michael Lewis
2011,actor,10/5/11,Acting,Hugh Jackman
2011,actor,10/6/11,Acting,Jason Sudeikis
2011,former us secretary of state,11/1/11,Politician,Condoleezza Rice
2011,actor,11/10/11,Acting,Adam Sandler
2011,peace activist,11/14/11,Advocacy,Leymah Gbowee
2011,Astronaut,11/15/11,Science,Mark Kelly
2011,film actress,11/16/11,Acting,Diane Keaton
2011,Director,11/17/11,Media,Martin Scorsese
2011,Journalist,11/2/11,Media,Tom Brokaw
2011,Author,11/28/11,Media,Merrill Markoe
2011,actress,11/29/11,Acting,Betty White
2011,singer-songwriter,11/3/11,Musician,Brad Paisley
2011,singer-songwriter,11/30/11,Musician,Bono
2011,actor,11/7/11,Acting,Clint Eastwood
2011,us president,11/8/11,Politician,Bill Clinton
2011,Minority Leader of the United States House of Representatives,11/9/11,Politician,Nancy Pelosi
2011,sportscaster,12/1/11,Media,Bob Costas
2011,chef,12/12/11,Misc,Anne Burrell
2011,academic,12/13/11,Academic,Lawrence Lessig
2011,us official,12/14/11,Government,Melody Barnes
2011,actor,12/15/11,Acting,Matt Damon
2011,photojournalist,12/5/11,Media,Ben Lowy
2011,actor,12/6/11,Acting,Jonah Hill
2011,actor,12/7/11,Acting,Ralph Fiennes
2011,political figure,12/8/11,Politician,Ed Gillespie
2011,Former Lieutenant Governor of Maryland,2/1/11,Politician,Michael Steele
2011,economist,2/14/11,Academic,Edward Glaeser
2011,actress,2/15/11,Acting,January Jones
2011,journalist,2/16/11,Media,Brian Williams
2011,political figure,2/17/11,Politician,Ed Gillespie
2011,actor,2/2/11,Acting,Matthew Perry
2011,journalist,2/21/11,Media,Lisa Ling
2011,journalist,2/22/11,Media,Anderson Cooper
2011,former secretary of defense,2/23/11,Politician,Donald Rumsfeld
2011,economist,2/24/11,Academic,Austan Goolsbee
2011,radio personality,2/28/11,Media,Howard Stern
2011,ADMIRAL,2/3/11,Military,Admiral Michael Mullen
2011,prince,3/1/11,Politician,Prince Zeid Ra'ad
2011,actor,3/10/11,Acting,Trey Parker & Matt Stone
2011,actor,3/10/11,Acting,Trey Parker & Matt Stone
2011,professor,3/2/11,Academic,Allison Stanger
2011,Author,3/21/11,Media,Sarah Vowell
2011,author,3/22/11,Media,T.J. English
2011,Comedian,3/23/11,Comedy,Richard Lewis
2011,news anchor,3/24/11,media,Bret Baier
2011,professor,3/28/11,Academic,Dr. Mansour El-Kikhia[4]
2011,physician,3/29/11,Science,Dr. Miguel Angelo Laporta Nicolelis[6]
2011,historian,3/3/11,Academic,Diane Ravitch
2011,actor,3/30/11,Acting,Jake Gyllenhaal[8]
2011,Stand-up comedian,3/31/11,Comedy,Norm Macdonald[10]
2011,United States Senate member,3/7/11,Politician,Rand Paul
2011,author,3/8/11,Media,Brian Christian
2011,film actor,3/9/11,Acting,Aaron Eckhart
2011,rock band,4/11/11,Musician,Foo Fighters
2011,former governor of massachusetts,4/12/11,Politician,Deval Patrick
2011,actor,4/13/11,Acting,Tracy Morgan
2011,Comedian,4/14/11,Comedy,Ricky Gervais
2011,journalist,4/25/11,Media,Gigi Ibrahim
2011,us senator,4/26/11,Politician,Elizabeth Warren
2011,us senator,4/27/11,Politician,Bernie Sanders
2011,writer,4/28/11,Media,William Cohan
2011,actor,4/4/11,Acting,Billy Crystal
2011,stand-up comedian,4/5/11,Comedy,Colin Quinn
2011,Former Governor of Arkansas,4/6/11,Politician,Mike Huckabee
2011,celbrity chef,4/7/11,Misc,Jamie Oliver
2011,actor,5/10/11,Acting,Will Ferrell
2011,actor,5/11/11,Acting,Albert Brooks
2011,actress,5/12/11,Acting,Kristen Wiig
2011,journalist,5/16/11,Media,Jon Ronson
2011,journalist,5/17/11,Media,Annie Jacobsen
2011,Historian,5/18/11,Academic,Richard Beeman
2011,EPA administrator,5/19/11,Government,Lisa P. Jackson
2011,Lawyer,5/2/11,Misc,Philip K. Howard
2011,television host,5/3/11,Media,Rachel Maddow
2011,comedian,5/31/11,Comedy,Jimmy Fallon[12]
2011,author,5/4/11,Media,David Barton
2011,editor,5/5/11,Media,Jon Meacham
2011,actress,5/9/11,Acting,Keira Knightley
2011,former white house press secretary,6/1/11,Political Aide,Bill Moyers
2011,journalist,6/13/11,Media,Alex Prud'homme
2011,director,6/14/11,Media,J.J. Abrams
2011,actor,6/15/11,Acting,Trey Parker & Matt Stone
2011,actor,6/15/11,Acting,Trey Parker & Matt Stone
2011,American football quarterback,6/2/11,Athletics,Tim Tebow
2011,Former Mayor of New Orleans,6/20/11,Politician,Ray Nagin
2011,actress,6/21/11,Acting,Cameron Diaz
2011,Professor,6/22/11,Academic,Mitchell Zuckoff
2011,journalist,6/23/11,Media,Bruce Headlam
2011,actress,6/27/11,Acting,Jennifer Aniston
2011,comedian,6/28/11,Comedy,Louis C.K.
2011,actor,6/29/11,Acting,Tom Hanks
2011,commentator,6/30/11,Media,Bill Kristol
2011,Journalist,6/6/11,Media,Maziar Bahari
2011,journalist,6/7/11,Media,Fareed Zakaria
2011,television host,6/8/11,Media,Larry King
2011,biographer,6/9/11,Media,Howard Wasdin
2011,actor,7/11/11,Acting,Denis Leary
2011,Singer,7/12/11,Musician,Kid Rock
2011,Economist,7/13/11,Academic,Matthew Richardson
2011,military,7/14/11,Military,Leroy Petry
2011,actor,7/18/11,Acting,Daniel Radcliffe
2011,Former President of Pakistan,7/19/11,Politician,Pervez Musharraf
2011,actor,7/20/11,Acting,Steve Carell
2011,author,7/21/11,Media,Scott Miller
2011,actor,7/25/11,Acting,Neil Patrick Harris
2011,journalist,7/26/11,Media,Juan Williams
2011,Film actress,7/27/11,Acting,Rachel Weisz
2011,Diplomat,7/28/11,Government,Peter Tomsen
2011,actress,8/1/11,Acting,Freida Pinto
2011,lawyer,8/10/11,Misc,John Coffee
2011,Journalist,8/11/11,Media,Michael Wallis
2011,television host,8/15/11,Media,Ali Velshi
2011,actor,8/16/11,Acting,Matt Long
2011,Former Lieutenant Governor of Maryland,8/17/11,Politician,Michael Steele
2011,actress,8/18/11,Acting,Anne Hathaway
2011,actor,8/2/11,Acting,Jason Bateman
2011,economist,8/3/11,Academic,Austan Goolsbee
2011,us senator,8/4/11,Politician,Dick Durbin
2011,author,8/8/11,Media,Mark Adams
2011,journalist,8/9/11,Media,Jay Bahadur
2011,ADMIRAL,9/12/11,Military,Admiral Michael Mullen
2011,journalist,9/13/11,Media,Jim Lehrer
2011,hip-hop artist,9/14/11,Musician,Common
2011,author,9/15/11,Media,Caroline Kennedy
2011,Journalist,9/20/11,Media,Ron Suskind
2011,Former Governor of Indiana,9/21/11,Politician,Mitch Daniels
2011,former governor of michigan,9/22/11,Politician,Jennifer Granholm
2011,Former U.S. Congressman,9/26/11,Politician,Ron Paul
2011,actor,9/27/11,Acting,Seth Rogen
2011,television host,9/28/11,Media,Bill O'Reilly
2011,Singer,9/29/11,Musician,Tony Bennett
2011,former governor of louisiana,9/6/11,Politician,Buddy Roemer
2011,neurosurgeon,9/7/11,Science,Dr. Sanjay Gupta
2011,actress,9/8/11,Acting,Marion Cotillard
2012,legal analyst,1/10/12,Misc,Andrew Napolitano
2012,former us senator,1/11/12,Politician,Jim DeMint
2012,singer-songwriter,1/12/12,Musician,Dolly Parton
2012,correspondent,1/16/12,Media,Jodi Kantor
2012,actor,1/17/12,Acting,Liam Neeson
2012,journalist,1/18/12,Media,Joe Nocera
2012,actress,1/19/12,Acting,Elizabeth Banks
2012,former hhs secretary,1/23/12,Politician,Kathleen Sebelius
2012,us senator,1/24/12,Politician,Elizabeth Warren
2012,Writer,1/25/12,Media,Paula Broadwell
2012,actress,1/26/12,Acting,Tilda Swinton
2012,basketball player,1/3/12,Athletics,Charles Barkley
2012,television personality,1/30/12,Media,Lou Dobbs
2012,professor,1/31/12,Academic,Jonathan Macey
2012,historian,1/4/12,Academic,Elizabeth Dowling Taylor
2012,author,1/5/12,Media,Craig Shirley
2012,film director,1/9/12,Media,George Lucas
2012,former governor of california,10/1/12,Politician,Arnold Schwarzenegger
2012,Basketball player,10/10/12,Athletics,Magic Johnson
2012,Film director,10/11/12,Media,Paul Thomas Anderson
2012,author,10/15/12,Media,J. K. Rowling
2012,author,10/16/12,Media,Eugene Jarecki
2012,Statistician,10/17/12,Media,Nate Silver
2012,president,10/18/12,Politician,President Barack Obama
2012,actor,10/2/12,Acting,Liam Neeson
2012,actor,10/22/12,Acting,D. L. Hughley
2012,actor,10/23/12,Acting,Gerard Butler
2012,military,10/24/12,Military,Dakota Meyer
2012,Minority Leader of the United States House of Representatives,10/25/12,Politician,Nancy Pelosi
2012,United States Senate member,10/3/12,Politician,Rand Paul
2012,journalist,10/31/12,Media,Jon Ronson
2012,television host,10/4/12,Media,Bill O'Reilly
2012,Musician,10/8/12,Musician,Pete Townshend
2012,actor,10/9/12,Acting,Ben Affleck
2012,journalist,11/1/12,Media,Bob Woodruff
2012,Former Governor of Arkansas,11/12/12,Politician,Mike Huckabee
2012,actor,11/13/12,Acting,Jason Sudeikis
2012,editor,11/14/12,Media,Jon Meacham
2012,legal analyst,11/15/12,Misc,Andrew Napolitano
2012,author,11/26/12,Media,David Nasaw
2012,business magnate,11/27/12,Business,Warren Buffett and Carol Loomis
2012,journalist,11/27/12,Media,Warren Buffett and Carol Loomis
2012,Singer-songwriter,11/28/12,Musician,Neil Young
2012,journalist,11/29/12,Media,Calvin Trillin
2012,Reporter,11/5/12,Media,Martha Raddatz
2012,NA,11/6/12,NA,Election Night: This Ends Now
2012,Statistician,11/7/12,Media,Nate Silver
2012,film director,11/8/12,Media,Katie Dellamaggiore and Pobo Efekoro
2012,chess player,11/8/12,Misc,Katie Dellamaggiore and Pobo Efekoro
2012,canon,12/10/12,Clergy,Bishop Gene Robinson
2012,actress,12/11/12,Acting,Laura Linney
2012,us senator,12/12/12,Politician,Cory Booker
2012,actress,12/13/12,Acting,Kristen Stewart
2012,actor,12/3/12,Acting,Denis Leary
2012,Baseball player,12/4/12,Athletics,R.A. Dickey
2012,former us senator,12/5/12,Politician,Alan Simpson
2012,governor of new jersey,12/6/12,Politician,Chris Christie
2012,actor,2/1/12,Acting,Brad Pitt
2012,Journalist,2/1/12,Media,Masha Gessen
2012,fbi agent,2/13/12,Government,Ali Soufan
2012,Comedian,2/14/12,Comedy,Ricky Gervais
2012,us representative,2/15/12,Politician,Louise Slaughter
2012,us secetary of education,2/16/12,Politician,Arne Duncan
2012,author,2/2/12,Media,David Agus
2012,AUTHOR,2/20/12,Media,Alan Huffman & Michael Rejebian
2012,AUTHOR,2/20/12,Media,Alan Huffman & Michael Rejebian
2012,Former U.S. senator,2/21/12,Politician,Russ Feingold
2012,historian,2/22/12,Academic,Bruce Bartlett
2012,actor,2/23/12,Acting,Paul Rudd
2012,Astrophysicist,2/27/12,Science,Neil deGrasse Tyson
2012,Writer,2/28/12,Media,Stephen Merchant
2012,professor,3/1/12,Academic,M. Cathleen Kaveny
2012,political advocate,3/12/12,Advocacy,Grover Norquist
2012,actor,3/13/12,Acting,Will Ferrell
2012,Film actress,3/14/12,Acting,Rachel Weisz
2012,NA,3/15/12,NA,None
2012,Basketball player,3/26/12,Athletics,Shaquille O'Neal
2012,Journalist,3/27/12,Media,Maria Goodavage
2012,journalist,3/28/12,Media,Ahmed Rashid
2012,television host,3/29/12,Media,Rachel Maddow
2012,United States Secretary of Housing and Urban Development,3/5/12,Politician,Shaun Donovan
2012,actress,3/6/12,Acting,Julianne Moore
2012,activist,3/7/12,Advocacy,Cecile Richards
2012,Author,3/8/12,Media,Trita Parsi
2012,business magnate,4/10/12,Business,Elon Musk
2012,Comedian,4/11/12,Comedy,Ricky Gervais
2012,bassist,4/12/12,Musician,Esperanza Spalding
2012,primatologist,4/16/12,Science,Jane Goodall
2012,actress,4/17/12,Acting,Julia Louis-Dreyfus
2012,Former United States Secretary of Labor,4/18/12,Politician,Robert Reich
2012,author,4/19/12,Media,Judy Smith
2012,Former President of the Maldives,4/2/12,Politician,Mohamed Nasheed
2012,business person,4/23/12,Business,Ben Rattray
2012,Former United States Secretary of State,4/24/12,Politician,Madeleine Albright
2012,actor,4/25/12,Acting,Jason Segel
2012,Freelance writer,4/26/12,Media,Robert Draper
2012,Attorney,4/3/12,Misc,Tom Goldstein
2012,Author,4/30/12,Media,Zach Wahls
2012,law professor,4/4/12,Academic,Jack Goldsmith
2012,chef,4/5/12,Misc,Anthony Bourdain
2012,Reporter,4/9/12,Media,Tim Weiner
2012,author,5/1/12,Media,David Barton
2012,Journalist,5/10/12,Media,Robert Caro
2012,us senator,5/2/12,Politician,Sen. Tom Coburn
2012,first lady,5/29/12,Politician,First Lady Michelle Obama
2012,Broadcaster,5/3/12,Media,Peter Bergen
2012,journalist,5/30/12,Media,Dan Rather
2012,actor,5/31/12,Acting,Jim Parsons
2012,CHARACTER,5/7/12,Comedy,"Admiral General Aladeen"""
2012,us permanent representative to nato,5/8/12,Government,Ambassador Ivo Daalder
2012,priest,5/9/12,Clergy,John R. Hall
2012,mayor of london,6/11/12,Politician,Boris Johnson
2012,former us secretary of defense,6/12/12,Politician,Colin Powell
2012,actress,6/13/12,Acting,Maggie Gyllenhaal
2012,actress,6/14/12,Acting,Catherine Zeta-Jones
2012,Journalist,6/18/12,Media,Parmy Olson
2012,actor,6/19/12,Acting,Denis Leary
2012,actor,6/20/12,Acting,Steve Carell
2012,satirist,6/21/12,Media,Bassem Youssef
2012,United States Senator,6/25/12,Politician,Marco Rubio
2012,television Series Creator,6/26/12,Media,Seth MacFarlane
2012,actor,6/27/12,Acting,Andrew Garfield
2012,Rock duo,6/28/12,Musician,Tenacious D
2012,author,6/4/12,Media,Thomas Mann & Norman Ornstein
2012,author,6/4/12,Media,Thomas Mann & Norman Ornstein
2012,former governor of new mexico,6/5/12,Politician,Gary Johnson
2012,actor,6/6/12,Acting,Michael Fassbender
2012,author,6/7/12,Media,Edward Conard
2012,comedian,7/16/12,Comedy,Louis C.K.
2012,American football wide receiver,7/17/12,Athletics,Victor Cruz
2012,actress,7/18/12,Acting,Sigourney Weaver
2012,journalist,7/19/12,Media,E.J. Dionne
2012,journalist,7/23/12,Media,Fareed Zakaria
2012,actor,7/24/12,Acting,Matthew McConaughey
2012,economist,7/25/12,Academic,Joseph Stiglitz
2012,Stand-up comedian,7/26/12,Comedy,"Zach the Erect"" Galifianakis & Will Ferrell"""
2012,actor,7/26/12,Acting,"Zach the Erect"" Galifianakis & Will Ferrell"""
2012,actress,7/30/12,Acting,Rashida Jones
2012,economist,7/31/12,Academic,Dambisa Moyo
2012,journalist,8/1/12,Media,Fred Guterl
2012,actor,8/13/12,Acting,Robert Pattinson
2012,Beach Volleyball Player,8/14/12,Athletics,Misty May-Treanor
2012,journalist,8/15/12,Media,Brian Williams
2012,actor,8/16/12,Acting,Rob Corddry
2012,actress,8/2/12,Acting,Jessica Biel
2012,United States Senator,8/28/12,Politician,Marco Rubio
2012,author,8/29/12,Media,Herman Cain
2012,Former Lieutenant Governor of Maryland,8/30/12,Politician,Michael Steele
2012,NA,8/31/12,NA,none
2012,Consultant,8/6/12,Political Aide,Tim Gunn
2012,Author,8/7/12,Media,Saima Wahab
2012,comedian,8/8/12,Comedy,Chris Rock
2012,author,8/9/12,Media,Joanna Brooks
2012,Diplomat,9/17/12,Government,Kofi Annan
2012,Novelist,9/18/12,Media,Salman Rushdie
2012,Product line,9/19/12,Misc,Pink
2012,us president,9/20/12,Politician,Bill Clinton
2012,king,9/25/12,Politician,Abdullah II bin Al-Hussein
2012,actress,9/26/12,Acting,Olivia Wilde
2012,basketball player,9/27/12,Athletics,Amar'e Stoudemire
2012,Journalist,9/4/12,Media,Tom Brokaw
2012,United States Senator,9/5/12,Politician,Kirsten Gillibrand
2012,economist,9/6/12,Academic,Austan Goolsbee
2012,NA,9/7/12,NA,none
2013,actor,1/10/13,Acting,Josh Brolin
2013,Musician,1/14/13,Musician,Roger Waters
2013,journalist,1/15/13,Media,Bob Schieffer
2013,actress,1/16/13,Acting,Jessica Chastain
2013,actress,1/17/13,Acting,Lena Dunham
2013,Associate Justice of the Supreme Court of the United States,1/21/13,Government,Sonia Sotomayor
2013,actress,1/22/13,Acting,Jennifer Lopez
2013,professor,1/23/13,Academic,Missy Cummings
2013,actor,1/24/13,Acting,Christopher Walken
2013,sportscaster,1/28/13,Media,Bob Costas
2013,actress,1/29/13,Acting,Melissa McCarthy
2013,former vice president,1/30/13,Politician,Al Gore
2013,actor,1/31/13,Acting,Jason Bateman
2013,actress,1/7/13,Acting,Anne Hathaway
2013,armed forces officer,1/8/13,Military,Stanley McChrystal
2013,actor,1/9/13,Acting,Jeff Bridges
2013,actor,10/1/13,Acting,David Mitchell
2013,biographer,10/10/13,Media,Brian Jay Jones
2013,actress,10/2/13,Acting,Sandra Bullock
2013,economist,10/21/13,Academic,Alan Greenspan
2013,Journalist,10/22/13,Media,Malcolm Gladwell
2013,columnist,10/23/13,Media,Charles Krauthammer
2013,actor,10/24/13,Acting,Chiwetel Ejiofor
2013,actor,10/28/13,Acting,Nick Offerman
2013,us representative,10/29/13,Politician,Debbie Wasserman Schultz
2013,actress,10/3/13,Acting,Kerry Washington
2013,historian,10/30/13,Academic,Diane Ravitch
2013,author,10/31/13,Media,Mark Fainaru-Wada
2013,former hhs secretary,10/7/13,Politician,Kathleen Sebelius
2013,activist,10/8/13,Advocacy,Malala Yousafzai
2013,actor,10/9/13,Acting,Michael Fassbender
2013,biographer,11/11/13,Media,Doris Kearns Goodwin
2013,former us representative,11/12/13,Politician,Joe Scarborough
2013,actor,11/13/13,Acting,Keegan-Michael Key and Jordan Peele
2013,actor,11/13/13,Acting,Keegan-Michael Key and Jordan Peele
2013,actor,11/14/13,Acting,Geoffrey Rush
2013,actress,11/18/13,Acting,Elizabeth Olsen
2013,comedian,11/19/13,Comedy,Bill Cosby
2013,Journalist,11/20/13,Media,Tom Brokaw
2013,actress,11/21/13,Acting,Jennifer Lawrence
2013,journalist,11/4/13,Media,Bob Woodruff
2013,actor,11/5/13,Acting,John Goodman
2013,author,11/6/13,Media,Monique Brinson Demery
2013,Film actor,11/7/13,Acting,Patrick Stewart
2013,actress,12/10/13,Acting,Amy Adams
2013,Professor,12/11/13,Academic,Reza Aslan
2013,actress,12/12/13,Acting,Evangeline Lilly
2013,film director,12/16/13,Media,Haifaa al-Mansour
2013,businessman,12/17/13,Business,Erik Prince
2013,actor,12/18/13,Acting,"Steve Carell, Will Ferrell, David Koechner & Paul Rudd"
2013,actor,12/18/13,Acting,"Steve Carell, Will Ferrell, David Koechner & Paul Rudd"
2013,actor,12/18/13,Acting,"Steve Carell, Will Ferrell, David Koechner & Paul Rudd"
2013,actor,12/19/13,Acting,Jonah Hill
2013,actor,12/2/13,Acting,Ian McKellen
2013,actor,12/3/13,Acting,Jared Leto
2013,film director,12/4/13,Media,Jehane Noujaim
2013,journalist,12/5/13,Media,Jorge Ramos
2013,author,12/9/13,Media,Husain Haqqani
2013,white house sommunications director,2/11/13,Political Aide,George Stephanopoulos
2013,Baseball player,2/12/13,Athletics,Mike Piazza
2013,afghan politician,2/13/13,Politician,Fawzia Koofi
2013,United States Ambassador to the United Nations,2/14/13,Government,Susan Rice
2013,actress,2/19/13,Acting,Alison Brie
2013,author,2/20/13,Media,Helaine Olen
2013,Journalist,2/21/13,Media,Steven Brill
2013,singer,2/25/13,Musician,Donnie Wahlberg
2013,film director,2/26/13,Media,Lori Silverbush & Kristi Jacobson
2013,film director,2/26/13,Media,Lori Silverbush & Kristi Jacobson
2013,Filmmaker,2/27/13,Media,R. J. Cutler
2013,television host,2/28/13,Media,Rachel Maddow
2013,Educator,2/4/13,Advocacy,Michelle Rhee
2013,police officer,2/5/13,Government,Ray Kelly
2013,businessman,2/6/13,Business,Ed Whitacre
2013,Attorney at law,2/7/13,Misc,Neil Barofsky
2013,actor,3/25/13,Acting,Peter Dinklage
2013,Reporter,3/26/13,Media,Michael Moss
2013,actress,3/27/13,Acting,Eva Mendes
2013,journalist,3/28/13,Media,Denise Kiernan
2013,actor,3/4/13,Acting,Paul Rudd
2013,Former Associate Justice of the Supreme Court of the United States,3/5/13,Government,Sandra Day O'Connor
2013,Astrophysicist,3/6/13,Science,Neil deGrasse Tyson
2013,Football coach,3/7/13,Athletics,Tom Coughlin
2013,Author,4/1/13,Media,Mary Roach
2013,Filmmaker,4/10/13,Media,Ken Burns
2013,television actress,4/11/13,Acting,Edie Falco
2013,actor,4/16/13,Acting,Tom Cruise
2013,Comedian,4/17/13,Comedy,Ricky Gervais
2013,Journalist,4/18/13,Media,Mark Mazzetti
2013,professor,4/2/13,Academic,Jonathan Sperber
2013,actress,4/22/13,Acting,Christina Hendricks
2013,Novelist,4/23/13,Media,Salman Rushdie
2013,satirist,4/24/13,Media,Bassem Youssef
2013,Academic,4/25/13,Academic,Vali Nasr
2013,actor,4/29/13,Acting,Jon Hamm
2013,Executive,4/3/13,Business,Sheryl Sandberg
2013,actor,4/30/13,Acting,Robert Downey Jr.
2013,film director,4/4/13,Media,Danny Boyle
2013,former omb director,4/8/13,Government,David Stockman
2013,former president,4/9/13,Politician,Jimmy Carter
2013,former us senator,5/1/13,Politician,Kay Bailey Hutchison
2013,director,5/13/13,Media,J. J. Abrams
2013,actor,5/14/13,Acting,Nathan Lane
2013,Former United States Senator,5/15/13,Politician,Olympia Snowe
2013,journalist,5/16/13,Media,George Packer
2013,author,5/2/13,Media,Eric Greitens
2013,actress,5/20/13,Acting,Ellen Page
2013,Basketball Coach,5/21/13,Athletics,Phil Jackson
2013,television host,5/22/13,Media,Bill O' Reilly
2013,actor,5/23/13,Acting,Morgan Freeman
2013,journalist,5/6/13,Media,Christiane Amanpour
2013,actress,5/7/13,Acting,Mindy Kaling
2013,actress,5/8/13,Acting,Carey Mulligan
2013,humorist,5/9/13,Media,David Sedaris
2013,actor,6/10/13,Acting,Seth Rogen
2013,satirist,6/11/13,Media,Armando Iannucci
2013,Singer,6/12/13,Musician,Mavis Staples
2013,journalist,6/13/13,Media,Fareed Zakaria
2013,actress,6/17/13,Acting,Linda Cardellini
2013,comedian,6/18/13,Comedy,Jim Gaffigan
2013,writer,6/19/13,Media,Dawn Porter
2013,Journalist,6/20/13,Media,Tom Brokaw
2013,actress,6/24/13,Acting,Maggie Gyllenhaal
2013,drummer,6/25/13,Musician,Questlove
2013,film director,6/26/13,Media,Josh Fox
2013,Attorney,6/27/13,Misc,Tom Goldstein
2013,filmmaker,6/3/13,Media,Maxim Pozdorovkin & Mike Lerner
2013,filmmaker,6/3/13,Media,Maxim Pozdorovkin & Mike Lerner
2013,journalist,6/4/13,Media,Brian Williams
2013,speechwriter,6/5/13,Political Aide,Jon Favreau
2013,NA,6/6/13,NA,No Guest
2013,screenwriter,7/15/13,Media,Aaron Sorkin
2013,actor,7/16/13,Acting,Helen Mirren
2013,Professor,7/17/13,Academic,Reza Aslan
2013,Author,7/18/13,Media,Sarah Vowell
2013,comedian,7/22/13,Comedy,Louis C.K.
2013,diplomat,7/23/13,Government,Richard Haass
2013,actress,7/24/13,Acting,Shailene Woodley
2013,soccer manager,7/25/13,Athletics,Bob Bradley
2013,Journalist,7/29/13,Media,Mark Leibovich
2013,Consultant,7/30/13,Political Aide,Tim Gunn
2013,actor,7/31/13,Acting,Hank Azaria
2013,stand-up comedian,8/1/13,Comedy,Colin Quinn
2013,United States Senate member,8/12/13,Politician,Rand Paul
2013,film director,8/13/13,Media,Joshua Oppenheimer
2013,actor,8/14/13,Acting,Regis Philbin
2013,actor,8/15/13,Acting,Simon Pegg
2013,Fiction writer,8/5/13,Media,Neal Thompson
2013,actor,8/6/13,Acting,Liam Hemsworth
2013,actress,8/7/13,Acting,Lake Bell
2013,United States Senator,8/8/13,Politician,Kirsten Gillibrand
2013,journalist,9/10/13,Media,Bill Dedman
2013,actor,9/11/13,Acting,Bob Odenkirk & David Cross
2013,stand-up comedian,9/11/13,Comedy,Bob Odenkirk & David Cross
2013,actor,9/12/13,Acting,Billy Crystal
2013,Former United States Secretary of Labor,9/16/13,Politician,Robert Reich
2013,actor,9/17/13,Acting,Jake Gyllenhaal
2013,actor,9/18/13,Acting,Hugh Jackman
2013,coorespondant,9/19/13,Media,Chelsea Clinton
2013,Ethologist,9/24/13,Academic,Richard Dawkins
2013,rock band,9/25/13,Musician,Atoms for Peace
2013,actor,9/26/13,Acting,Robin Williams
2013,united nations official,9/3/13,Government,Andrew Harper
2013,television host,9/30/13,Media,Bill O'Reilly
2013,Astrophysicist,9/4/13,Science,Mario Livio
2013,actor,9/5/13,Acting,Michael C. Hall
2013,Journalist,9/9/13,Media,Sheri Fink
2014,television Director,1/13/14,Media,Roger Ross Williams
2014,Consultant,1/14/14,Political Aide,Tim Gunn
2014,United States Secretary of Defense,1/15/14,Politician,Robert Gates
2014,Journalist,1/16/14,Media,Steven Brill
2014,author,1/20/14,Media,Marilynne Roach
2014,author,1/21/14,Media,Theresa Payton
2014,broadcaster,1/22/14,Media,Hari Sreenivasan
2014,journalist,1/23/14,Media,Anjan Sundaram
2014,comedian,1/27/14,Comedy,Jeff Garlin
2014,comedian,1/28/14,Comedy,Louis C.K.
2014,stunt perfomrer,1/29/14,Acting,Johnny Knoxville
2014,Minority Leader of the United States House of Representatives,1/30/14,Politician,Nancy Pelosi
2014,actor,1/6/14,Acting,Oscar Isaac
2014,actor,1/7/14,Acting,Steve Coogan
2014,Director of the Consumer Financial Protection Bureau,1/8/14,Government,Richard Cordray
2014,actress,1/9/14,Acting,Scarlett Johansson
2014,actress,10/1/14,Acting,Lena Dunham
2014,Columnist,10/13/14,Media,Matt Bai
2014,Stand-up comedian,10/14/14,Comedy,Zach Galifianakis
2014,television host,10/15/14,Media,Bill O'Reilly
2014,professor,10/16/14,Academic,Bryan Stevenson
2014,documentarian,10/2/14,Media,Ben Steele
2014,Lawyer,10/27/14,Misc,Wendy Davis
2014,us representative,10/28/14,Politician,Joaquin Castro
2014,actor,10/29/14,Acting,Ellar Coltrane
2014,Rock band,10/30/14,Musician,Spoon
2014,surgeon,10/6/14,Science,Atul Gawande
2014,Stand-up comedian,10/7/14,Comedy,Wyatt Cenac
2014,former cia director,10/8/14,Government,Leon Panetta
2014,actor,10/9/14,Acting,Jeremy Renner
2014,musician,11/10/14,Musician,Bruce Springsteen & Frank Caruso
2014,illustrator,11/10/14,Media,Bruce Springsteen & Frank Caruso
2014,United States Ambassador to the United Nations,11/11/14,Government,Samantha Power
2014,actor,11/12/14,Acting,Steve Carell
2014,Journalist,11/13/14,Media,Maziar Bahari & Gael Garcí_a Bernal
2014,film actor,11/13/14,Acting,Maziar Bahari & Gael Garcí_a Bernal
2014,film director,11/17/14,Media,Laura Poitras
2014,actor,11/18/14,Acting,Benedict Cumberbatch
2014,actress,11/19/14,Acting,Jessica Chastain
2014,actor,11/20/14,Acting,Eddie Redmayne
2014,actor,11/3/14,Acting,Jake Gyllenhaal
2014,RNC chairman,11/4/14,Politician,Reince Priebus
2014,actor,11/5/14,Acting,John Cleese
2014,journalist,11/6/14,Media,James Risen
2014,legal analyst,12/1/14,Misc,Andrew Napolitano
2014,Writer,12/10/14,Media,Suki Kim
2014,Professional Wrestler,12/11/14,Athletics,Mick Foley
2014,Film director,12/15/14,Media,Tim Burton
2014,Singer-songwriter,12/16/14,Musician,Paul McCartney
2014,actress,12/17/14,Acting,Anna Kendrick
2014,non profit director,12/2/14,Advocacy,Sophie Delaunay
2014,musician,12/3/14,Musician,Dave Grohl
2014,actress,12/4/14,Acting,Angelina Jolie
2014,television writer,12/8/14,Media,Norman Lear
2014,filmmaker,12/9/14,Media,Kathryn Bigelow & Juan Zarate
2014,white house official,12/9/14,Political Aide,Kathryn Bigelow & Juan Zarate
2014,actor,2/10/14,Acting,Ty Burrell
2014,journalist,2/11/14,Media,Elizabeth Kolbert
2014,actor,2/12/14,Acting,Joel Kinnaman
2014,actor,2/18/14,Acting,Kevin Spacey
2014,film director,2/19/14,Media,David O. Russell
2014,activist,2/20/14,Advocacy,Ronan Farrow
2014,journalist,2/24/14,Media,Hooman Majd
2014,Futurist,2/25/14,Academic,Michio Kaku
2014,actor,2/26/14,Acting,Liam Neeson
2014,Writer,2/27/14,Media,Kevin Roose
2014,nyc mayor,2/3/14,Politician,Bill de Blasio
2014,actress,2/4/14,Acting,Elizabeth Banks
2014,actor,2/5/14,Acting,George Clooney
2014,Reporter,2/6/14,Media,Robyn Doolittle
2014,Choreographer,3/10/14,Media,Paul Taylor
2014,legal analyst,3/11/14,Misc,Andrew Napolitano
2014,actor,3/12/14,Acting,Jason Bateman
2014,attorney,3/13/14,Misc,Anita Hill
2014,author,3/24/14,Media,Arianna Huffington
2014,author,3/25/14,Media,Amy Yates Wuelfing & Gibby Haynes
2014,musician,3/25/14,Musician,Amy Yates Wuelfing & Gibby Haynes
2014,actor,3/26/14,Acting,Jude Law
2014,Statistician,3/27/14,Media,Nate Silver
2014,television Series Creator,3/3/14,Media,Seth MacFarlane
2014,actor,3/31/14,Acting,Peter Dinklage
2014,former us senator,3/4/14,Politician,Jim DeMint
2014,television host,3/5/14,Media,Rachel Maddow
2014,foreign policy analyst,3/6/14,Academic,Kimberly Marten
2014,Author,4/1/14,Media,Michael Lewis
2014,actress,4/10/14,Acting,Jennifer Garner
2014,actor,4/2/14,Acting,Samuel L. Jackson
2014,administrator,4/21/14,Government,Gina McCarthy
2014,us senator,4/22/14,Politician,Elizabeth Warren
2014,Broadcaster,4/23/14,Media,Robin Roberts
2014,Historian,4/24/14,Academic,Ramachandra Guha
2014,Coach,4/28/14,Athletics,Mookie Wilson
2014,Writer,4/29/14,Media,William D. Cohan
2014,Soccer player,4/3/14,Athletics,Pelí©
2014,professor,4/30/14,Academic,Martin Gilens & Benjamin Page
2014,professor,4/30/14,Academic,Martin Gilens & Benjamin Page
2014,Author,4/7/14,Media,Matt Taibbi
2014,actor,4/8/14,Acting,Denis Leary
2014,actor,4/9/14,Acting,Colin Firth
2014,stand-up comedian,5/1/14,Comedy,David Spade
2014,professor,5/12/14,Academic,Martin Blaser
2014,Journalist,5/13/14,Media,Ron Suskind
2014,rock band,5/14/14,Musician,Blondie
2014,actor,5/15/14,Acting,Jim Parsons
2014,actor,5/19/14,Acting,James McAvoy
2014,chief technology officer of united states,5/20/14,Government,Aneesh Chopra
2014,Former United States Secretary of the Treasury,5/21/14,Politician,Timothy Geithner
2014,actress,5/22/14,Acting,Drew Barrymore
2014,Baseball player,5/5/14,Athletics,Mariano Rivera
2014,author,5/6/14,Media,Peter Schuck
2014,actor,5/7/14,Acting,Seth Rogen
2014,journalist,5/8/14,Media,Katie Couric
2014,Journalist,6/10/14,Media,Sebastian Junger
2014,us senator,6/11/14,Politician,Charles Schumer
2014,actor,6/12/14,Acting,Christopher Walken
2014,businessman,6/16/14,Business,Howard Schultz
2014,journalist,6/17/14,Media,Daniel Schulman
2014,actor,6/18/14,Acting,Kevin Hart
2014,author,6/19/14,Media,Hamid Al-Bayati
2014,actor,6/2/14,Acting,Robert De Niro
2014,comedian,6/23/14,Comedy,Bill Maher
2014,actress,6/24/14,Acting,Jennifer Esposito
2014,actress,6/25/14,Acting,Keira Knightley
2014,actress,6/26/14,Acting,Melissa McCarthy
2014,Comedian,6/3/14,Comedy,Ricky Gervais
2014,journalist,6/4/14,Media,Gihan Ibrahim
2014,actor,6/5/14,Acting,Tom Cruise
2014,Lawyer,6/9/14,Misc,Philip K. Howard
2014,writer,7/14/14,Media,Dahlia Lithwick
2014,former us secretary of state,7/15/14,Politician,Hillary Clinton
2014,comedian,7/16/14,Comedy,Jerry Seinfeld
2014,actress,7/17/14,Acting,Emma Stone
2014,journalist,7/21/14,Media,Sue Turton
2014,Film director,7/22/14,Media,Richard Linklater
2014,actor,7/23/14,Acting,George Takei
2014,journalist,7/24/14,Media,Fareed Zakaria
2014,Journalist,7/28/14,Media,Sonia Nazario
2014,journalist,7/29/14,Media,Sara Firth
2014,actress,7/30/14,Acting,Maggie Gyllenhaal
2014,actress,7/31/14,Acting,Aubrey Plaza
2014,professor,8/26/14,Academic,David L. Rose
2014,academic,8/27/14,Academic,Hassan Abbas
2014,Comedian,8/28/14,Comedy,Todd Glass
2014,actor,8/4/14,Acting,Elisabeth Moss
2014,author,8/5/14,Media,Helen Thorpe
2014,Composer,8/6/14,Musician,Wu-Tang Clan
2014,TV Producer,8/7/14,Media,Tracy Droz Tragos
2014,diplomat,9/10/14,Government,Ban Ki-moon
2014,Talk show host,9/11/14,Media,Tavis Smiley
2014,Filmmaker,9/15/14,Media,Ken Burns
2014,actor,9/16/14,Acting,Bill Hader
2014,Law professor,9/17/14,Academic,Zephyr Teachout
2014,us president,9/18/14,Politician,Bill Clinton
2014,Journalist,9/2/14,Media,Ramita Navai
2014,journalist,9/22/14,Media,Jenny Nordberg
2014,military,9/23/14,Military,Tony Zinni
2014,non profit worker,9/24/14,Advocacy,Tia Torres
2014,Author,9/25/14,Media,Steven Johnson
2014,syrian politician,9/29/14,Politician,Hadi al-Bahra
2014,Documentary Filmmaker,9/3/14,Media,Rory Kennedy
2014,actor,9/30/14,Acting,Ben Affleck
2014,singer-songwriter,9/4/14,Musician,Adam Levine
2014,United States Senator,9/9/14,Politician,Kirsten Gillibrand
2015,former president,1/12/15,Politician,Jimmy Carter
2015,United States Senator,1/13/15,Politician,Marco Rubio
2015,actress,1/14/15,Acting,Julianne Moore
2015,actress,1/15/15,Acting,Sienna Miller
2015,Former Governor of Arkansas,1/19/15,Politician,Mike Huckabee
2015,actress,1/20/15,Acting,Jennifer Lopez
2015,actress,1/21/15,Acting,Anne Hathaway
2015,actress,1/22/15,Acting,Jennifer Aniston
2015,former mayor of san antonio,1/26/15,Politician,Julian Castro
2015,actor,1/28/15,Acting,Oscar Isaac
2015,Reporter,1/29/15,Media,Sarah Chayes
2015,Journalist,1/5/15,Media,Steven Brill
2015,legal scholar,1/6/15,Misc,Cass Sunstein
2015,director,1/7/15,Media,Ava DuVernay
2015,actress,1/8/15,Acting,Allison Williams
2015,former senior advisor to the presidnet,2/10/15,Political Aide,David Axelrod
2015,actor,2/11/15,Acting,Colin Firth
2015,actor,2/2/15,Acting,Martin Short
2015,lawyer,2/23/15,Misc,Christine Lagarde
2015,Photojournalist,2/24/15,Media,Lynsey Addario
2015,television host,2/25/15,Media,Conan O'Brien
2015,actress,2/26/15,Acting,Olivia Wilde
2015,executive,2/3/15,Business,Bill Browder
2015,author,2/4/15,Media,Wes Moore
2015,actor,2/5/15,Acting,Bob Odenkirk
2015,actress,2/9/15,Acting,Patricia Arquette
2015,comedian,3/10/15,Comedy,Abbi Jacobson
2015,hip-hop artist,3/11/15,Musician,Common
2015,actor,3/12/15,Acting,Rob Corddry
2015,journalist,3/16/15,Media,Andrew Cockburn
2015,actress,3/17/15,Acting,Amanda Seyfried
2015,actor,3/18/15,Acting,Kevin Hart
2015,actor,3/19/15,Acting,Will Ferrell
2015,actor,3/2/15,Acting,Robert Smigel
2015,activist,3/23/15,Advocacy,Ayaan Hirsi Ali
2015,journalist,3/24/15,Media,Jon Ronson
2015,Film director,3/25/15,Media,Kirby Dick
2015,orca trainer,3/26/15,Athletics,John Hargrove
2015,actress,3/3/15,Acting,Sigourney Weaver
2015,Ice hockey coach,3/4/15,Athletics,Viacheslav Fetisov
2015,journalist,3/5/15,Media,Gerald Posner
2015,us representative,3/9/15,Politician,John Lewis
2015,musician,4/13/15,Musician,Adam Horovitz
2015,journalist,4/14/15,Media,Fareed Zakaria
2015,actor,4/15/15,Acting,Billy Crystal
2015,author,4/16/15,Media,Eric Greitens
2015,author,4/20/15,Media,Gayle Tzemach Lemmon
2015,comedian,4/21/15,Comedy,Jeff Garlin
2015,former white house press secretary,4/22/15,Political Aide,Dana Perino
2015,Astrophysicist,4/23/15,Science,Neil deGrasse Tyson
2015,actress,4/27/15,Acting,Elizabeth Olsen
2015,white house sommunications director,4/28/15,Political Aide,George Stephanopoulos
2015,journalist,4/29/15,Media,Judith Miller
2015,actress,4/30/15,Acting,Kristen Wiig
2015,activist,4/6/15,Advocacy,Gene Baur
2015,actor,4/7/15,Acting,Peter Dinklage
2015,Talk show host,4/8/15,Media,Tavis Smiley
2015,us senator,4/9/15,Politician,Elizabeth Warren
2015,singer-songwriter,5/11/15,Musician,John Legend
2015,Journalist,5/12/15,Media,Tom Brokaw
2015,Professor,5/13/15,Academic,Reza Aslan
2015,Stand-up comedian,5/14/15,Comedy,Rebel Wilson
2015,United States Senate member,5/26/15,Politician,Rand Paul
2015,Professor,5/27/15,Academic,Rosabeth Moss Kanter
2015,Baseball player,5/28/15,Athletics,Matt Harvey
2015,film producer,5/4/15,Media,Brian Grazer
2015,Singer-songwriter,5/5/15,Musician,Willie Nelson
2015,us secretary of energy,5/6/15,Politician,Ernest Moniz
2015,rock band,5/7/15,Musician,Mumford & Sons
2015,armed forces officer,6/1/15,Military,Stanley McChrystal
2015,stand-up comedian,6/10/15,Comedy,Colin Quinn
2015,actor,6/11/15,Acting,Mark Ruffalo
2015,screenwriter,6/15/15,Media,Judd Apatow
2015,actor,6/16/15,Acting,Aziz Ansari
2015,us president,6/17/15,Politician,Bill Clinton
2015,activist,6/18/15,Advocacy,Malala Yousafzai
2015,nyc mayor,6/2/15,Politician,Bill de Blasio
2015,united states senator,6/22/15,Politician,Al Franken
2015,television Series Creator,6/23/15,Media,Seth MacFarlane
2015,legal analyst,6/24/15,Misc,Andrew Napolitano
2015,Comedian,6/25/15,Comedy,Richard Lewis
2015,actress,6/29/15,Acting,Taylor Schilling
2015,actress,6/3/15,Acting,Melissa McCarthy
2015,actor,6/30/15,Acting,Jon Hamm
2015,actor,6/4/15,Acting,Steve Buscemi
2015,First Minister of Scotland,6/8/15,Politician,Nicola Sturgeon
2015,actor,6/9/15,Acting,Nick Offerman
2015,United States Senator,7/1/15,Politician,Kirsten Gillibrand
2015,Author,7/2/15,Media,Sarah Vowell
2015,actor,7/20/15,Acting,Paul Rudd
2015,us president,7/21/15,Politician,Barack Obama
2015,actor,7/22/15,Acting,Jake Gyllenhaal
2015,Writer,7/23/15,Media,Ta-Nehisi Coates
2015,author,7/27/15,Media,David McCullough
2015,actor,7/28/15,Acting,Tom Cruise
2015,biographer,7/29/15,Media,Doris Kearns Goodwin
2015,director,7/30/15,Media,J. J. Abrams
2015,stand-up comedian,8/3/15,Comedy,Amy Schumer
2015,actor,8/4/15,Acting,Denis Leary
2015,comedian,8/5/15,Comedy,Louis C.K.
CSV

CSV.parse(csv, headers: true) do |row|
  db.execute "insert into users values ( ?, ?, ?, ?, ? )", row.fields # equivalent to: [row['name'], row['age']]
end

db.execute( "select * from users" )