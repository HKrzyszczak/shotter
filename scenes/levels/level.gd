extends Node2D

var test_array: Array[String] =['Test', 'tada', 'Padam']

func test_function():
	print("test function")
	


func _on_area_2d_body_entered(body):
	print("body has entered")
	print(body)


func _on_area_2d_body_exited(body):
	print("body has exited")
	print(body)
