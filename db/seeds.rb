# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'active_record/fixtures'

# Load grapes through fixtures
ActiveRecord::Fixtures.create_fixtures(Rails.root.join('test/fixtures'), 'grapes')

# Create a root admin user
user = User.new
user.email = 'gilles.albin@gmail.com'
user.password = 'wootwoot'
user.password_confirmation = 'wootwoot'
user.first_name = 'Albin'
user.last_name = 'Gilles'
user.save
user.add_role :admin
