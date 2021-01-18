# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Install Ruby 2,7

* Install Rails 6

* Install Postgre

* Gem Install Bundle

* Bundle Install

* Change config database.yml setting to your postgreSQL settting

* Run rails db:migrate, rails db:seed

* run the server rails server

* open localhost:3000

* Login using authentication on db/sees.rb

* you can see 4 menus : all position , own position, add/update own position, logout

* all position : all the marker for all the member

* own position : self only position. You can change the position of the other member by doing : http://localhost:3000/own/Zen to get Zen only position or
  http://localhost:3000/own/Maman for Maman Only position
  
 * add/update own position : add if not exists and update if exists for the member which do login only
 
 * On map you can see name : position
 
 * you can focus your cursor to the selected name to get name and click it to get box for address. Click the address to go to the google map search.

