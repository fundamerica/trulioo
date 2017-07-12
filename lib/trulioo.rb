# frozen_string_literal: true

require 'trulioo/settings'
require 'trulioo/client'

# Trulioo holds the settings and allows them to be set using Trulioo.configure.
module Trulioo
  class << self
    def configure
      yield(settings)
    end

    def settings
      @_settings ||= Settings.new
    end
  end
end
