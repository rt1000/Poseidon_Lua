--[[

	Tutorial 3: Modified Lua

	This tutorial introduces the language features of Modified Lua.

]]


--[[

	Modified Lua
	==================

	Modified Lua provides special operators for manual memory management as follows:

		1. CS_malloc: Accepts a size, in number of bytes, and allocates a block of memory of that size.

		2. CS_free: Accepts a pointer to a block of memory and deallocates that block of memory.


	Modified Lua provides a set of store operators that take input arguments as follows:

		1. First argument: A pointer to a block of memory.

		2. Second argument: An offset into the block of memory.

		3. Third argument: A value to be stored at the location of the offset.

	Each store operator returns its first input argument.

 
	Modified Lua provides a set of load operators that take input arguments as follows:

		1. First argument: A pointer to a block of memory.

		2. Second argument: An offset into the block of memory.

]]


--[[

	Primitive C types
	==========================

	Modified Lua provides store and load operators for the following primitive C types:

		1. char
		2. int
		3. double
		4. bool   ( Assume that "bool" is a type that is defined in C ) 


	Modified Lua provides store operators for the primitive C types as follows:

		1. CS_storeChar: Third argument is a Lua string value.

		2. CS_storeInt: Third argument is a Lua integer value.

		3. CS_storeDouble: Third argument is a Lua number value.

		4. CS_storeBool: Third argument is a Lua boolean value. 



	Modified Lua provides load operators for the primitive C types as follows:

		1. CS_loadChar: Returns a Lua string value.

		2. CS_loadInt: Returns a Lua integer value.

		3. CS_loadDouble: Returns a Lua number value.

		4. CS_loadBool: Returns a Lua boolean value.


]]


print( "" )
print( "Primitive C types" )
print( "========================" )




local pointer_char = CS_malloc( 100 )
local pointer_int = CS_malloc( 100 )
local pointer_double = CS_malloc( 100 )
local pointer_bool = CS_malloc( 100 )


CS_storeChar( pointer_char, 0, "A" )
CS_storeInt( pointer_int, 0, 100 )
CS_storeDouble( pointer_double, 0, 20.5 )
CS_storeBool( pointer_bool, 0, true )


print( "" )
print( "pointer_char[0] == " .. tostring( CS_loadChar( pointer_char, 0 ) ) )
print( "pointer_int[0] == " .. tostring( CS_loadInt( pointer_int, 0 ) ) )
print( "pointer_double[0] == " .. tostring( CS_loadDouble( pointer_double, 0 ) ) )
print( "pointer_bool[0] == " .. tostring( CS_loadBool( pointer_bool, 0 ) ) )
print( "" )


print( "----------------------------------" )
print( "" )






--[[

	C pointers
	==================

	Modified Lua provides a store operator for C pointers as follows:

		1. CS_storePointer: Third argument is a C pointer.

	Modified Lua provides a load operator for C pointers as follows:

		1. CS_loadPointer: Returns a C pointer.


	cs.NULL acts as the null pointer, equivalent to NULL in C.

]]


print( "C pointers" )
print( "=================" )



local pointer_pointer_int = CS_malloc( 100 )

CS_storePointer( pointer_pointer_int, 0, pointer_int )

print( "" )
print( "pointer_pointer_int[0][0] == " .. tostring( CS_loadInt( CS_loadPointer( pointer_pointer_int, 0 ), 0 ) ) )
print( "" )




CS_storePointer( pointer_pointer_int, 0, cs.NULL )

if cs.NULL == CS_loadPointer( pointer_pointer_int, 0 ) then

	print( "" )
	print( "pointer_pointer_int[0] has been set to NULL." )
	print( "" )

end --end if


CS_free( pointer_pointer_int )


print( "----------------------------------" )
print( "" )




--[[

	C strings
	================

	Modified Lua provides a store operator that can be used to store a Lua string value as a null-terminated C string as follows:

		1. CS_storeString: Third argument is a Lua string value.

	Modified Lua provides a load operator that can be used to load a null-terminated C string as a Lua string value as follows:

		1. CS_loadString: Returns a Lua string value. 

]]


print( "C strings" )
print( "==================" )





local pointer_char_2 = CS_malloc( 100 )

CS_storeString( pointer_char_2, 0, "Greetings" )


print( "" )
print( "pointer_char_2 == " .. tostring( CS_loadString( pointer_char_2, 0 ) ) )
print( "" )


CS_free( pointer_char_2 )


print( "----------------------------------" )
print( "" )




--[[

	C arrays
	================

	Modified Lua provides a load operator to retrieve a pointer to a location within a C array of bytes as follows:

		1. CS_loadOffset: Returns a pointer to the location of an offset within a block of memory.

]]


print( "C arrays" )
print( "================" )





local pointer_char_3 = CS_malloc( 100 )

CS_storeChar( CS_loadOffset( pointer_char_3, 0 ), 0, "A" )
CS_storeChar( CS_loadOffset( pointer_char_3, 1 ), 0, "B" )
CS_storeChar( CS_loadOffset( pointer_char_3, 2 ), 0, "C" )
CS_storeChar( CS_loadOffset( pointer_char_3, 3 ), 0, "D" )


print( "" )
print( "pointer_char_3[0] == " .. tostring( CS_loadChar( CS_loadOffset( pointer_char_3, 0 ), 0 ) ) )
print( "pointer_char_3[1] == " .. tostring( CS_loadChar( CS_loadOffset( pointer_char_3, 1 ), 0 ) ) )
print( "pointer_char_3[2] == " .. tostring( CS_loadChar( CS_loadOffset( pointer_char_3, 2 ), 0 ) ) )
print( "pointer_char_3[3] == " .. tostring( CS_loadChar( CS_loadOffset( pointer_char_3, 3 ), 0 ) ) )
print( "" )


CS_free( pointer_char_3 )


print( "----------------------------------" )
print( "" )




CS_free( pointer_char )
CS_free( pointer_int )
CS_free( pointer_double )
CS_free( pointer_bool )







