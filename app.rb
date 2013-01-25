require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.facebook.com'

module UnfrienderApp
  class Client
    include Capybara::DSL

    def unfriend!(friend)
      find_profile(friend)

    begin
      destroy_friendship
    rescue Capybara::ElementNotFound
      p "#{friend} is not your friend"
      return
    end

      p "Goodbye #{friend} !"
    end

    def login
      visit('/')
      within('#login_form') do
        fill_in('email', :with => ENV['FACEBOOK_USERNAME'])
        fill_in('pass', :with => ENV['FACEBOOK_PASSWORD'])
        find('#loginbutton > input[type="submit"]').click
      end
    end

    private

      def find_profile(friend)
        visit("/#{friend}")
      end

      def destroy_friendship
        find('div.actionsDropdown .wrap a.fbTimelineActionSelectorButton').click
        find('li#profile_action_remove_friend a.itemAnchor').click
        find('#pop_content input[name="remove-friend"]').click
      end

  end # Client
end # UnfrienderApp

unfriender = UnfrienderApp::Client.new

unfriender.login
File.open('friends.txt').each_line { |friend| unfriender.unfriend!(friend) }
