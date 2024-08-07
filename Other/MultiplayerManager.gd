extends Node3D

# Creating a new peer
var peer = ENetMultiplayerPeer.new()
# Defining the player object
@export var player_scene : PackedScene

var test_port = 445


func _on_host_pressed():
	# Creating a server on an open, listening port
	peer.create_server(test_port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = "Player " + str(id)
	call_deferred("add_child", player)


func _on_join_pressed():
	peer.create_client("localhost", test_port)
	multiplayer.multiplayer_peer = peer
