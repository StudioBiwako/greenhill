extends Node2D

signal fade_completed(fade_type: String)
# Duration in seconds
@export var fade_duration: float = 1.0  
# How often to update fade (smaller = smoother)
@export var fade_step: float = 0.1      

var fade_timer: Timer
var alpha: float = 0.0
var is_fading_in: bool = false
var is_fading_out: bool = false

func _ready():
    # Initialize the timer
    fade_timer = Timer.new()
    add_child(fade_timer)
    fade_timer.wait_time = fade_step
    fade_timer.connect("timeout", Callable(self, "_on_fade_timer_timeout"))
    
    # Set initial transparency
    modulate.a = alpha

func fade_in():
    if is_fading_out:
        fade_timer.stop()
        is_fading_out = false
    
    is_fading_in = true
    fade_timer.start()

func fade_out():
    if is_fading_in:
        fade_timer.stop()
        is_fading_in = false
    
    is_fading_out = true
    fade_timer.start()

func _on_fade_timer_timeout():
    if is_fading_in:
        alpha += fade_step / fade_duration
        if alpha >= 1.0:
            alpha = 1.0
            is_fading_in = false
            fade_timer.stop()
            emit_signal("fade_completed", "in")
    
    elif is_fading_out:
        alpha -= fade_step / fade_duration
        if alpha <= 0.0:
            alpha = 0.0
            is_fading_out = false
            fade_timer.stop()
            emit_signal("fade_completed", "out")
    
    modulate.a = alpha

func stop_fade():
    fade_timer.stop()
    is_fading_in = false
    is_fading_out = false

func reset_fade():
    stop_fade()
    alpha = 0.0
    modulate.a = alpha