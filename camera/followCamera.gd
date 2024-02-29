extends Camera2D

@export var tilemap: TileMap
#@export var world: World2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	
	
	
	var viewPortsize = get_viewport().get_visible_rect().size
	
	limit_left= 0
	limit_top = viewPortsize.y - worldSizeInPixels.y
	limit_bottom = viewPortsize.y
	limit_right = worldSizeInPixels.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
