extends RichTextLabel

export(Array, String) var strings

func _ready():
	text = strings[0]