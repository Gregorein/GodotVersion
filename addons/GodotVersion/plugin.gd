tool
extends EditorPlugin

func build() -> bool:
	var file = File.new()
	var fileStatus = file.open("res://GitVersion.json", File.READ)
	if (fileStatus == OK):
		var version = parse_json(file.get_as_text())
		print("version: ", version["SemVer"])
		ProjectSettings.version = version
		file.close()

	return true
