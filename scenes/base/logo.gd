extends Control

signal show_logo_finished

func queue_free_logo():
  show_logo_finished.emit()
  queue_free()

func _ready():
  $CenterContainer/Logo.modulate.a = 0
  $Godot.modulate.a = 0
  var tween = create_tween().set_parallel(true)
  tween.tween_property($CenterContainer/Logo, "modulate:a", 1, 0.5)
  tween.tween_property($Godot, "modulate:a", 1, 0.5)
  tween.tween_property(self, "modulate:a", 0, 0.25).set_delay(1.5).finished.connect(queue_free_logo)
