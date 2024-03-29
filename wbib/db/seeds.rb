# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topics = Topic.create(
  [
    {title: "Trump 4 Prez", description: "Industry titan Donald Trump is leading the presidential race."},
    {title: "Ruby Time Format", description: "Formatting Ruby with strftime."},
    {title: "Making HTML Tables Beautiful", description: "Using CSS to spice up boring old tables."},
    {title: "The Original Pokemon", description: "150 of the craziest things the Japanese have exported."}
  ]
)

references = Reference.create(
  [
    {url: "https://www.donaldjtrump.com/", description: "Make America great again!", topic_id: topics[0].id},
    {url: "http://www.breitbart.com/big-government/2015/07/15/the-10-most-important-reasons-trump-would-make-a-great-president/", description: "Top 10 reasons for Trump 4 prez", topic_id: topics[0].id},
    {url: "http://dailysignal.com/2015/06/16/7-reasons-donald-trump-says-hed-make-a-truly-great-president/", description: "7 reasons from Trump himself!", topic_id: topics[0].id},
    {url: "http://www.cnn.com/2015/10/02/politics/pew-poll-donald-trump-leads/", description: "Trump is crushing the polls! Join the winning team!", topic_id: topics[0].id},
    {url: "http://hotair.com/archives/2015/10/20/trump-leads-two-new-national-republican-polls-with-27-and-28-percent/", description: "Trump wins another small battle!", topic_id: topics[0].id},

    {url: "http://apidock.com/ruby/Time/strftime", description: "Format a string.", topic_id: topics[1].id},
    {url: "http://ruby-doc.org/core-1.9.3/Time.html", description: "Time function reference for 1.9.3.", topic_id: topics[1].id},
    {url: "http://www.foragoodstrftime.com/", description: "Time formatting tool.", topic_id: topics[1].id},


    {url: "http://www.w3schools.com/css/css_table.asp", description: "Make Tables great again!", topic_id: topics[2].id},
    {url: "https://css-tricks.com/complete-guide-table-element/", description: "Tricks of CSS to speed up the beautification process", topic_id: topics[2].id},
    {url: "https://www.freshdesignweb.com/free-css-tables/", description: "Just 40 free copy and paste templates.", topic_id: topics[2].id},


    {url: "http://www.giantbomb.com/profile/wakka/lists/the-150-original-pokemon/59579/", description: "The original 150.", topic_id: topics[3].id}
  ]
)
