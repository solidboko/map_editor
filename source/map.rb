class Map
	def initialize(window)
		@window = window
		@tiles = Hash.new
		@tile_size = 16
		@width = 20
		@length = 15
		@tileset = Tileset.new('World', @tile_size)
		@tile_selector = Gosu::Image.load_tiles('source/gfx/gui/tile_selector.png', 16, 16, :retro=>true)
		@current_layer = :lower
	end

	def button_down(id)
		if id == Gosu::KbSpace
			@current_layer = (@current_layer == :lower) ? :upper : :lower
		end

		on_left_click if id == Gosu::MsLeft
	end

	def on_left_click
		y_tiles_qty = (@current_layer == :lower) ? 27 : 24
		if @window.mouse_x >= @tileset.offset_x and @window.mouse_x <= 6 * @tile_size + @tileset.offset_x
			if @window.mouse_y >= @tileset.offset_y and @window.mouse_y <= y_tiles_qty * @tile_size + @tileset.offset_y
				tile_x = ((@window.mouse_x - @tileset.offset_x) / @tile_size).floor
				tile_y = ((@window.mouse_y - @tileset.offset_y) / @tile_size).floor
				@window.caption = [tile_x, tile_y].inspect
				if @current_layer == :lower
					# autotiles + animated tiles
					if tile_y < 3

					else
						if tile_y <= 18
							@current_tile = @tileset.get_tile_from_coords(tile_x + 12, tile_y - 3)
						else
							@current_tile = @tileset.get_tile_from_coords(tile_x + 18, tile_y - 19)
						end
					end
				end
			end
		end
	end

	def update

	end

	def draw_tileset
		if @current_layer == :lower
			@tileset.display_lower_layer_tiles
		else
			@tileset.display_upper_layer_tiles
		end
	end

	def draw
		draw_tileset
		if !@current_tile.nil?
			@tileset.tiles[@current_tile].draw(100, 100, 0, 2, 2)
		end
	end
end