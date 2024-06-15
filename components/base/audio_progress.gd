extends Control

@export var audio_bus_name = ""

func update_volume_db(db):
  Setting.audio_bus_config[audio_bus_name] = db
  AudioServer.set_bus_volume_db(AudioServer.get_bus_index(audio_bus_name), db)
  $Progress.update_progress(db)

func _ready():
  update_volume_db(Setting.audio_bus_config[audio_bus_name])

func _on_progress_changed(db):
  update_volume_db(db)
