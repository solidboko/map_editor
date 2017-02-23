=begin
	Replicates the RPG Maker 2003 system
	thanks to explanations here : https://rpgmaker.net/tutorials/975/	
=end

class Tileset
	def initialize(filename, tile_size)
		filename = "source/gfx/chipsets/#{filename}.png"
		@tiles = Gosu::Image.load_tiles(filename, tile_size, tile_size, :retro=>true)
		@tiles_in_width = 30
		@tiles_in_height = 16
		@tile_size = tile_size
	end

	def draw_tile_xy(x_tileset, y_tileset, draw_x, draw_y, draw_z = 0)
		tile_to_draw = y_tileset * @tiles_in_width + x_tileset
		@tiles[tile_to_draw].draw(draw_x, draw_y, draw_z)
	end

	def display_upper_layer_tiles(draw_x, draw_y)
		color = Gosu::Color.new(255, 231, 0, 123)
		Gosu::draw_rect(draw_x, draw_y, 6 * @tile_size, 24 * @tile_size, color)
		# static tiles
		x, y = 0, 0
		for x_tileset in 18..23
			for y_tileset in 8..15
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 0
			x += 1
		end
		x, y = 0, 8
		for x_tileset in 24..29
			for y_tileset in 0..15
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 8
			x += 1
		end
	end

	def display_lower_layer_tiles(draw_x, draw_y)
		# animated tiles		
		draw_tile_xy(0, 0, draw_x, draw_y)
		draw_tile_xy(3, 0, draw_x + 1 * @tile_size, draw_y)
		draw_tile_xy(1, 6, draw_x + 2 * @tile_size, draw_y)
		draw_tile_xy(3, 4, draw_x + 3 * @tile_size, draw_y)
		draw_tile_xy(4, 4, draw_x + 4 * @tile_size, draw_y)
		draw_tile_xy(5, 4, draw_x + 5 * @tile_size, draw_y)

		# autotiles
		draw_tile_xy(0, 8, draw_x, draw_y + 1 * @tile_size)
		draw_tile_xy(3, 8, draw_x + 1 * @tile_size, draw_y + 1 * @tile_size)
		draw_tile_xy(0, 12, draw_x + 2 * @tile_size, draw_y + 1 * @tile_size)
		draw_tile_xy(3, 12, draw_x + 3 * @tile_size, draw_y + 1 * @tile_size)
		draw_tile_xy(6, 0, draw_x + 4 * @tile_size, draw_y + 1 * @tile_size)
		draw_tile_xy(9, 0, draw_x + 5 * @tile_size, draw_y + 1 * @tile_size)
		
		draw_tile_xy(6, 4, draw_x, draw_y + 2 * @tile_size)
		draw_tile_xy(9, 4, draw_x + 1 * @tile_size, draw_y + 2 * @tile_size)
		draw_tile_xy(6, 8, draw_x + 2 * @tile_size, draw_y + 2 * @tile_size)
		draw_tile_xy(9, 8, draw_x + 3 * @tile_size, draw_y + 2 * @tile_size)
		draw_tile_xy(6, 12, draw_x + 4 * @tile_size, draw_y + 2 * @tile_size)
		draw_tile_xy(9, 12, draw_x + 5 * @tile_size, draw_y + 2 * @tile_size)

		# static tiles
		x, y = 0, 3
		for x_tileset in 12..17
			for y_tileset in 0..15
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 3
			x += 1
		end
		x, y = 0, 19
		for x_tileset in 18..23
			for y_tileset in 0..7
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 19
			x += 1
		end
	end
end