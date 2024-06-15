extends Node2D

@onready var app = preload("res://scenes/app.tscn").instantiate()
@onready var setting = preload("res://scenes/base/setting.tscn").instantiate()

func _ready():
  pass

func _process(_delta):
  pass

func _on_home_call_app():
  print('app', get_tree())
  print('app1', $App)
  get_tree().change_scene_to_file("res://scenes/app.tscn")

func _on_home_call_setting():
  print('setting')
  $Home.add_child(setting)
