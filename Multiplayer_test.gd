extends Node2D

var peer = ENetMultiplayerPeer.new() #used to set server
@export var Player_scene: PackedScene


#when host button is pressed it creates a server which players can join
func _on_host_pressed():
	peer.create_server(8500)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

func _add_player(id = 1): #adds a joined player into the game "server"
	var player = Player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	

func _on_join_pressed(): #manual ip config allows the player to join the host
	peer.create_client("localhost",8500)
	multiplayer.multiplayer_peer = peer
	




