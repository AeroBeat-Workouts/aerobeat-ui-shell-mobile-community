extends GutTest

const REPO_ROOT := "res://../"
const README_PATH := REPO_ROOT + "README.md"
const PLUGIN_CFG_PATH := REPO_ROOT + "plugin.cfg"
const ADDONS_MANIFEST_PATH := "res://addons.jsonc"

func _read_text(path: String) -> String:
	var file := FileAccess.open(path, FileAccess.READ)
	assert_not_null(file, "Expected to open %s" % path)
	if file == null:
		return ""
	return file.get_as_text()

func test_readme_marks_mobile_as_future_second_wave_scope() -> void:
	var readme := _read_text(README_PATH)
	assert_true(readme.contains("Future / second-wave platform path"))
	assert_true(readme.contains("PC community first"))
	assert_true(readme.contains("mobile"))
	assert_true(readme.contains("VR"))

func test_plugin_metadata_does_not_present_mobile_as_primary_v1_shell() -> void:
	var cfg := ConfigFile.new()
	var err := cfg.load(PLUGIN_CFG_PATH)
	assert_eq(err, OK, "plugin.cfg should load")
	assert_eq(
		cfg.get_value("plugin", "description"),
		"Future / second-wave mobile UI shell and layout surface for AeroBeat Community Edition; not the current primary v1 shell."
	)

func test_manifest_keeps_only_current_mobile_shell_dependencies() -> void:
	var manifest := _read_text(ADDONS_MANIFEST_PATH)
	assert_true(manifest.contains('"aerobeat-ui-core"'))
	assert_true(manifest.contains('"aerobeat-ui-kit-community"'))
	assert_true(manifest.contains('"gut"'))
	assert_false(manifest.contains('"aerobeat-core"'))
