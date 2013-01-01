require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.facebook.com'

module UnfrienderApp
  class Unfriender
    include Capybara::DSL

    def unfriend!(friend_id_list)
      login

      friend_id_list.each do |friend_id|
        find_friend_by_id(friend_id)
        unfriend
        p "Goodbye #{friend_id} !"
      end
    end

    def login
      visit('/')
      within('#login_form') do
        fill_in('email', :with => ENV['FACEBOOK_USERNAME'])
        fill_in('pass', :with => ENV['FACEBOOK_PASSWORD'])
        find('label#loginbutton input[type="submit"]').click
      end
    end

    def find_friend_by_id(friend_id)
      visit("/#{friend_id}")
    end

    def unfriend
      find('div.actionsDropdown .wrap a.fbTimelineActionSelectorButton').click
      find('li#profile_action_remove_friend a.itemAnchor').click
      find('#pop_content input[name="remove-friend"]').click
    end

  end # Unfriender
end # UnfrienderApp

friend_id_list = ['']

unfriender = UnfrienderApp::Unfriender.new
unfriender.unfriend!(friend_id_list)
