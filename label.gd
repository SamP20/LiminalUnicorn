extends RichTextLabel

export(Array, String) var strings

func _ready():
	bbcode_text = strings[0]