require 'pusher'
    Pusher.app_id = ENV["1137891"]
    Pusher.key = ENV["5c043434ed4e8c459c94"]
    Pusher.secret = ENV["e65f61e48e2167fc4575"]
    Pusher.cluster = ENV["ap1"]
    Pusher.logger = Rails.logger
    Pusher.encrypted = true