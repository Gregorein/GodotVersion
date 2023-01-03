tool
extends EditorPlugin

func build() -> bool:
	var file = File.new()
	file.open("res://GitVersion.json", File.READ)
	var version = parse_json(file.get_as_text())
	print("version: ", version["SemVer"])
	ProjectSettings.version = version
	return true