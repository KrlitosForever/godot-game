extends Node2D

@onready var player: Player = $Player
@onready var timer_spawn_enemy: Timer = $TimerSpawnEnemy
const ENEMY = preload("res://scenes/enemy.tscn")

var time_second_spawn_enemy:= 3

func _ready() -> void:
	timer_spawn_enemy.timeout.connect(spawn_enemy)
	timer_spawn_enemy.wait_time = time_second_spawn_enemy
	timer_spawn_enemy.start()

func spawn_enemy():
	var enemy = ENEMY.instantiate()
	
	var random_angle: float = randf() * PI * 2
	
	var spawn_distance: float = randf_range(270,300)
	
	var spawn_offset: Vector2 = Vector2(cos(random_angle), sin(random_angle)) * spawn_distance
	
	enemy.position = spawn_offset + player.position
	
	add_child(enemy)
