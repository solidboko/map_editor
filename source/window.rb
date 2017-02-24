class Window < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = 'Map Editor'
		@map = Map.new(self)
	end

	def button_down(id)
		super
		exit if id == Gosu::KbEscape
		@map.button_down(id)
	end

	def needs_cursor?; true; end

	def update
		@map.update
	end

	def draw
		@map.draw
	end
end