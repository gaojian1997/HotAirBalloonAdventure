extends Node2D

signal call_app
signal call_setting

@onready var app = preload("res://scenes/app.tscn").instantiate()
@onready var setting = preload("res://scenes/base/setting.tscn").instantiate()

var locales = []

func _ready():
  locales = TranslationServer.get_loaded_locales()
  var os_lang = OS.get_locale_language()
  var index = 0
  # TODO: 支持读取本地保存的语言设置
  var select_index = locales.find("en")
  for locale in locales:
    var lang = TranslationServer.get_locale_name(locale)
    if Setting.lang_config[lang]:
      lang = Setting.lang_config[lang]
    $LanguageOptionButton.add_item(lang, index)
    if os_lang == locale:
      select_index = index
    index += 1
  $LanguageOptionButton.select(select_index)
  
func _process(_delta):
  if Input.is_action_just_pressed("call_home"):
    if self.visible:
      self.hide()
    else:
      self.show()

func _on_language_option_button_item_selected(index):
  TranslationServer.set_locale(locales[index])

func _on_start_button_down():
  call_app.emit()
  self.hide()

func _on_setting_button_down():
  call_setting.emit()
  self.hide()

func _on_exit_button_down():
  get_tree().quit()
