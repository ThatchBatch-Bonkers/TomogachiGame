extends Control

# KNOWLEDGE CHECK 4
# Code copied from stats view to help understand/create new page

# ==========================================
# NODE REFERENCES
# ==========================================
# Collects all Label nodes inside the StatsTextContainer into an array.
@onready var careLabels: Array = $GuideTextContainer.get_children()

# Optional AnimationPlayer for UI view transitions.
@onready var anim_player = $AnimationPlayer

# Local helper reference variable for label iteration.
var label: Label


# ==========================================
# INITIALIZATION & LIFECYCLE
# ==========================================
# Called when this computer page node enters the scene tree.
func _ready():
	set_text()

# Called whenever the player opens or updates the Care Guide tab.
func update():
	hide_text()
	set_text()
	animate_text()

# ==========================================
# DATA POPULATION
# ==========================================
# Reads global tracking variables and updates text strings for each statistics label.
func set_text():
	careLabels[0].text = 'Each of the 6 buttons increase the corresponding stat bars, giving you more money. The cleanliness bar will not go above a certain point with poops, and the rest bar actually shows how much the animal can sleep! ->                                 (Green = Can Sleep Lots || Red = Enough Sleep)'


# Dynamically hides text across all labels by setting their visible character count to 0
func hide_text():
	for careLabel in careLabels:
		careLabel.visible_characters = 0

# ==========================================
# TYPEWRITER ANIMATION
# ==========================================
# Sequentially reveals characters one by one across each label for a computer terminal typing effect.
func animate_text():
	for careLabel in careLabels:
		# Reveal one character at a time with a 0.01s delay.
		for i in range(careLabel.get_total_character_count()):
			careLabel.visible_characters += 1
			await get_tree().create_timer(0.01).timeout
			
		# Brief pause before typing out the next line.
		await get_tree().create_timer(0.05).timeout
