class Map
	def initialize
		@tiles = Hash.new
		@width = 20
		@height = 15

		for x in 0..@width
			for y in 0..@height
				@tiles[[x, y]] = -1
			end
		end
	end
end