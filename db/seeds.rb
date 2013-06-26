#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@admin = User.create(:username => 'admin', :first_name => 'admin', :password => 'admin', :password_confirmation => 'admin', :last_name => 'admin', :email => 'admin@heartmap.com', :is_active => 1)
@educator = User.create(:username => 'educator', :first_name => 'educator', :password => 'educator', :password_confirmation => 'educator', :last_name => 'educator', :email => 'educator@heartmap.com', :is_active => 1)
@agent = User.create(:username => 'agent', :first_name => 'agent', :password => 'agent', :password_confirmation => 'agent', :last_name => 'agent', :email => 'agent@heartmap.com', :is_active => 1)
@expert = User.create(:username => 'expert', :first_name => 'expert', :password => 'expert', :password_confirmation => 'expert', :last_name => 'expert', :email => 'expert@heartmap.com', :is_active => 1)
@patient = User.create(:username => 'patient', :first_name => 'patient', :password => 'patient', :password_confirmation => 'patient', :last_name => 'patient', :email => 'patient@heartmap.com', :is_active => 1)

@admin_role = Role.create(:role_type => "SuperAdmin")
@educator_role = Role.create(:role_type => "Educator")
@agent_role = Role.create(:role_type => "agent")
@expert_role = Role.create(:role_type => "expert")
@patient_role = Role.create(:role_type => "patient")

UserRole.create(:role_id => @admin_role.id, :user_id => @admin.id)
UserRole.create(:role_id => @educator_role.id, :user_id => @educator.id)
UserRole.create(:role_id => @agent_role.id, :user_id => @agent.id)
UserRole.create(:role_id => @expert_role.id, :user_id => @expert.id)
UserRole.create(:role_id => @patient_role.id, :user_id => @patient.id)

@language = Language.create(:name => "English", :code => "en")

@page = Page.create(:name => "Contact-us", :content => "Contact-us Page", :page_route => "contact-us", :language_id => @language.id)
@page = Page.create(:name => "About-us", :content => "About-us Page", :page_route => "about-us", :language_id => @language.id)

@settings = Setting.create(:title => "heartMAP", :footer_text => "Copyright © 2013 heartMAP. All rights reserved.", :front_text => "Welcome to heartMAP")