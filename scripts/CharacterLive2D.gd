extends CharacterRenderer

class_name CharacterLive2D

# Live2D 角色渲染實現 - 用於連接 Cubism SDK
# 這是後續實現的模板，現在先預留結構

var cubism_model: Node  # 將來連接 Live2D Cubism 模型
var motion_manager: Node  # 動畫管理
var expression_manager: Node  # 表情管理

var current_expression: String = "neutral"
var current_animation: String = "idle"

func _ready() -> void:
	# 這裡將來會初始化 Live2D Cubism SDK
	# 例如：
	# cubism_model = preload("res://path/to/character.tscn").instantiate()
	# add_child(cubism_model)
	# motion_manager = cubism_model.get_node("MotionManager")
	# expression_manager = cubism_model.get_node("ExpressionManager")
	pass

func play_expression(expression: String) -> void:
	current_expression = expression
	if not expression_manager:
		return
	
	match expression:
		"neutral":
			expression_manager.set_expression("Neutral")
		"happy":
			expression_manager.set_expression("Happy")
		"focused":
			expression_manager.set_expression("Focused")
		"thinking":
			expression_manager.set_expression("Thinking")
		"blush":
			expression_manager.set_expression("Blush")

func play_animation(animation: String) -> void:
	current_animation = animation
	if not motion_manager:
		return
	
	match animation:
		"idle":
			motion_manager.start_motion("idle", 0, false)
		"talk":
			motion_manager.start_motion("talk", 0, false)
		"study":
			motion_manager.start_motion("study", 0, true)
		"happy":
			motion_manager.start_motion("happy", 0, false)
		"thinking":
			motion_manager.start_motion("thinking", 0, false)

func set_talk_text(text: String) -> void:
	# Live2D 版本可以透過嘴形同步等功能
	# 這裡先預留接口
	pass

func stop_animation() -> void:
	if motion_manager:
		motion_manager.stop_motion()
	current_animation = "idle"

func get_current_expression() -> String:
	return current_expression

func get_current_animation() -> String:
	return current_animation

# 設置 Cubism 模型（初始化時調用）
func set_cubism_model(model: Node) -> void:
	cubism_model = model
	add_child(model)
	# 初始化子系統
	# motion_manager = model.get_node("...")
	# expression_manager = model.get_node("...")
