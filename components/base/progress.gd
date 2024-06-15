extends Control

signal progress_changed

func update_progress(value):
  $HSlider.value = value

func _on_h_slider_value_changed(value):
  $Label.text = str(value) + '%'
  progress_changed.emit(value)
