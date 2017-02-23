require 'gosu'

class Window < Gosu::Window
	def initialize
		super(640, 480, false)
	end

	def button_down(id)
		super
		exit if id == Gosu::KbEscape
	end

	def needs
end

Window.new.show