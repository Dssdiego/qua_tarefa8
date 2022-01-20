extends 'res://addons/gut/test.gd'

class TestDVDLogo:
	extends 'res://addons/gut/test.gd'
	
	# Busca o "local" do script (aka em qual nó ele está armazenado)
	var logo = load("res://scripts/logo.gd")
	var logo_instance = null
	
	# Antes de cada teste, instancia o objeto da logo
	func before_each():
		logo_instance = autofree(logo.new()) # usar autofree libera os objetos após o seu uso
	
	# Testa se o array de cores realmente foi "randomizado" após a chamada da função "randomize_color"
	# Simulando o TDD, falhará na primeira vez e ao se modificar a função (retirando o comentário, irá funcionar)
	func test_randomize_color_array():
		var colors_before = logo_instance.colors
		logo_instance.randomize_color()
		var colors_after = logo_instance.colors
		assert_false(colors_before == colors_after)
	
	# Testa se a direção informada foi refletida no eixo X
	func test_reflect_x_direction():
		var initial_direction = Vector2(1, 1)
		var new_direction = logo_instance.reflect_x_direction(initial_direction)
		assert_eq(new_direction, Vector2(-1, 1))
	
	# Testa se a direção informada foi refletida no eixo Y
	func test_reflect_y_direction():
		var initial_direction = Vector2(1, 1)
		var new_direction = logo_instance.reflect_y_direction(initial_direction)
		assert_eq(new_direction, Vector2(1, -1))
	
	# Testa se a direção informada foi refletida nos eixos X e Y, SIMULTANEAMENTE
	func test_reflect_x_y_directions():
		var initial_direction = Vector2(2, 0.5)
		var reflect_x_dir = logo_instance.reflect_x_direction(initial_direction)
		var new_direction = logo_instance.reflect_y_direction(reflect_x_dir)
		assert_eq(new_direction, Vector2(-2, -0.5))
	
	# Testa se a velocidade da logo foi AUMENTADA
	func test_increase_logo_speed():
		var cur_speed = logo_instance.speed # busca a velocidade atual da logo
		logo_instance.increase_speed() 	 # aumenta a velocidade
		var new_speed = logo_instance.speed  # busca a velocidade novamente
		assert_true(new_speed > cur_speed)  # verifica se a nova velocidade é MAIOR que a anterior
	
	# Testa se a velocidade da logo foi DIMINUÍDA
	func test_decrease_logo_speed():
		var cur_speed = logo_instance.speed # busca a velocidade atual da logo
		logo_instance.decrease_speed() 	 # aumenta a velocidade
		var new_speed = logo_instance.speed  # busca a velocidade novamente
		assert_true(new_speed < cur_speed)  # verifica se a nova velocidade é MENOR que a anterior
	
	# Testa se a velocidade da logo voltou à velocidade ORIGINAL
	func test_reset_logo_speed():
		var cur_speed = logo_instance.speed # busca a velocidade atual da logo
		var initial_speed = logo_instance.speed # busca a velocidade inicial da logo
		assert_eq(cur_speed, initial_speed) # verifica se a nova velocidade é IGUAL à velocidade inicial
