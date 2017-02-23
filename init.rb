require 'gosu'
Dir.entries('source').each {|filename| require_relative "source/#{filename}" if filename.include?('.rb')}

Window.new.show