extends 'res://addons/gut/test.gd'

class TestMathGeneric:
	extends 'res://addons/gut/test.gd'
	
	func test_sum():
		var a = 4
		var b = 3
		assert_eq(a+b, 7)
	
	func test_subtraction():
		var a = 5
		var b = 2
		assert_eq(a-b, 3)
	
	func test_multiplication():
		var a = 100
		var b = 3.14
		assert_eq(a*b, 314)
	
	func test_division():
		var a = 10
		var b = 5
		assert_eq(a/b, 2)
	
	func test_pow():
		var a = 2
		var b = 3
		assert_eq(pow(a,b), 8)
	
	func test_absolute():
		var a = -1
		assert_eq(abs(a), 1)
	
class TestTrigonometric:
	extends 'res://addons/gut/test.gd'
		
	func test_sine():
		var angle = 90
		assert_eq(sin(deg2rad(angle)), 1.0)
	
	func test_cosine():
		var angle = 180
		assert_eq(cos(deg2rad(angle)), -1.0)
	
	func test_tangent():
		pass
	
class TestVectors:
	extends 'res://addons/gut/test.gd'
		
	func test_dot_product():
		pass
	
	func test_cross_product():
		pass
	
	func test_vector_add_vector():
		var a = Vector2(1, 1)
		var b = Vector2(2, 2)
		assert_eq(a+b, Vector2(3, 3))
	
	func test_vector_subtract_vector():
		pass
	
	func test_vector_multiply_by_scalar():
		pass
	
	func test_vector_multiply_by_vector():
		pass
