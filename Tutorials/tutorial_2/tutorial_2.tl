--[[

	Tutorial 2: The Modified LuaFFI Library

	This tutorial introduces the workings of the Modified LuaFFI library.

]]


--[[

	The Modified LuaFFI Library
	=====================================

	The Modified LuaFFI library allows a Poseidon Lua program to call an external C function.

	This library can be loaded using 'require( "ffi_cs" )'.

	If the external C function returns a pointer, it can be stored in a variable of a C pointer type and used in the rest of the Poseidon Lua program. The returned pointer will behave the same way as any other C pointer that is created from within the Poseidon Lua program. 

]]




local ffi_cs = require( "ffi_cs" )

ffi_cs.cdef[[

	void *memcpy( void *copy_to_area, const void *copy_from_area, size_t num_bytes_to_copy );

]]



local display_string : string = "10 oranges"
local counter_string : string = "25"


print( "" )
print( "display_string == " .. display_string )



local display_string_length = string.len( display_string ) + 1
local counter_string_length = string.len( counter_string ) + 1


local display_string_holder : ptr char = malloc( display_string_length * sizeof( char ) )
local counter_string_holder : ptr char = malloc( counter_string_length * sizeof( char ) )


display_string_holder = display_string
counter_string_holder = counter_string


local result_string_holder : ptr char = ffi_cs.C.memcpy( display_string_holder, counter_string_holder, 2 * sizeof( char ) )


local result_string : string = "Initial value of result_string."


result_string = result_string_holder



print( "result_string == " .. result_string )
print( "" )


free( display_string_holder )
free( counter_string_holder )




