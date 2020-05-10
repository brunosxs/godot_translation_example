extends Control
##
# Translation in godot, by BrunoSXS
#####################################
#
# You can put an csv file following godot's locale naming(see the csv file in the root of the project)
# Godot will read and generate *.translation files for each locale set in that csv. Then, just import these into godot,
#through Project > Project Settings > Localization, under the tab Translations
# You can also specify different resource files based on the locale, under the tab Remaps

onready var optionButton = $Panel/MarginContainer/VBoxContainer/HBoxContainer4/OptionButton
onready var rtl = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/RichTextLabel

enum Language {
	PORTUGUESE,
	ENGLISH,
	SPANISH
}

func _ready():
	# RichTextLabels don't translate automatically, so you can use the tr method to translate it, it is common to every node
	rtl.text = tr("BIGGER_DIALOG")
	optionButton.connect("item_selected", self, "_on_item_selected")
	print(TranslationServer.get_loaded_locales())

func _on_item_selected(number):
	match(number):
		Language.PORTUGUESE:
			TranslationServer.set_locale("pt_BR")
		Language.ENGLISH:	
			TranslationServer.set_locale("en")
		Language.SPANISH:
			TranslationServer.set_locale("es")
	#again, since rich text labels don't translate by using their unique ids, we need to call it through code.
	rtl.text = tr("BIGGER_DIALOG")
