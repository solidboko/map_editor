class Map
	def initialize
		@tiles = Hash.new
		@width = 20
		@length = 15
		@tileset = Tileset.new('World', 16)
	end

	def button_down(id)

	end

	def update

	end

	def draw_tileset
		@tileset.display_upper_layer_tiles(20, 20)
	end

	def draw
		draw_tileset
	end
end