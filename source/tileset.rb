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

	def display_background_tiles(draw_x, draw_y)
		# here we'll display animated tiles and autotiles

		# static tiles
		x, y = 0, 4
		for x_tileset in 12..17
			for y_tileset in 0..15
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 4
			x += 1
		end
		x, y = 0, 20
		for x_tileset in 18..23
			for y_tileset in 0..7
				draw_tile_xy(x_tileset, y_tileset, draw_x + x * @tile_size, draw_y + y * @tile_size)
				y += 1
			end	
			y = 20
			x += 1
		end
	end
end