extends Control

signal range_plus_press
signal full_health_press
signal health_plus_press
signal pos_vector(vector)

const MOB := preload("res://scenes/mob.gd")
const BULLET := preload("res://scenes/bullet.gd")
const GUN := preload("res://scenes/gun.gd")
const PLAYER := preload("res://scenes/player.gd")

static var cashPlusValue = 6.0
static var damagePlusValue = 10.0
static var rangePlusValue = 5.0
static var healthPlusValue = 5.0
static var fullHealthValue = 10.0

@onready var joy_stick = %JoyStick

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos_vector.emit(joy_stick.posVector)

	%CashValue.text = str(MOB.cash)
	%CashPlusValue.text = str(cashPlusValue)
	%DamagePlusValue.text = str(damagePlusValue)
	%RangePlusValue.text = str(rangePlusValue)
	%FullHealthValue.text = str(fullHealthValue)
	%HealthPlusValue.text = str(healthPlusValue)
	
func on_game_add_cash(value):
	var cashValue = value
	print(cashValue)
	#cash_value.text = str(cashValue)


func _on_cash_plus_pressed():
	if MOB.cash >= cashPlusValue:
		MOB.cash -= cashPlusValue
		MOB.cash_value *= 1.4
		cashPlusValue *= 1.5	


func _on_bomb_pressed():
	pass # Replace with function body.


func _on_damage_plus_pressed():
	if MOB.cash >= damagePlusValue:
		MOB.cash -= damagePlusValue
		BULLET.damageRate *= 1.4
		damagePlusValue *= 2



func _on_range_plus_pressed():
	if MOB.cash >= rangePlusValue:
		MOB.cash -= rangePlusValue
		GUN.rangeScale *= 1.4
		rangePlusValue *= 2
		range_plus_press.emit()


func _on_health_plus_pressed():
	if MOB.cash >= healthPlusValue:
		MOB.cash -= healthPlusValue
		PLAYER.maxHealth *= 1.4
		healthPlusValue *= 2
		health_plus_press.emit()


func _on_full_health_pressed():
	if MOB.cash >= fullHealthValue:
		MOB.cash -= fullHealthValue
		PLAYER.health = PLAYER.maxHealth
		fullHealthValue *= 2
		full_health_press.emit()


func _on_game_new_game_request():
	cashPlusValue = 6.0
	damagePlusValue = 10.0
	rangePlusValue = 5.0
	healthPlusValue = 5.0
	fullHealthValue = 10.0
	MOB.cash = 0.0
	MOB.cash_value = 1.0
	BULLET.damageRate = 1.0
	GUN.rangeScale = 1.0
	PLAYER.maxHealth = 100.0 
	PLAYER.health = 100.0
