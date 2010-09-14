require 'shoulda/active_record/matchers'
require 'shoulda/action_controller/matchers'
require 'shoulda/action_mailer/matchers'

# :enddoc:

module RSpec
  module Matchers
    include Shoulda::ActiveRecord::Matchers
  end

  module Rails
    module ControllerExampleGroupSubjectFix
      # If no explicit subject is specified, use @controller instead
      def subject
        object = super
        object.is_a?(::ActionController::Base) ? @controller : object
      end
    end
    
    module ControllerExampleGroup
      include Shoulda::ActionController::Matchers
      include ControllerExampleGroupSubjectFix
    end

    module MailerExampleGroup
      include Shoulda::ActionMailer::Matchers
    end
  end
end

