@tool
extends EditorPlugin

var path = "res://GitVersion.json"
var file

func _enter_tree():
	if FileAccess.file_exists(path):
		file = FileAccess.open(path, FileAccess.READ)

	updateVersion()

func _build():
	updateVersion()

	return true

func updateVersion():
	var version = JSON.parse_string(file.get_as_text())["SemVer"]

	ProjectSettings.set_setting("version", version)
	ProjectSettings.save()
	
	print("version: ", version)

func _exit_tree():
	file = null
