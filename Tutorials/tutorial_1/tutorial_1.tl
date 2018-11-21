--[[

	Tutorial 1 : Poseidon Lua

	This tutorial introduces the language features of Poseidon Lua.

]]


--[[

	C types
	===========

	Poseidon Lua provides the following C types:

		1. Primitive C types: char, int, double, bool.

		   ( Assume that "bool" is a type that is defined in C )

		2. C pointer types ( ptr int ).

		3. C array types ( [2][10] int ).

		4. C struct types.

]]


--[[

	C struct type
	===================

	A C struct can have a member of the following types:

		1. The primitive C types ( char, int, double, bool ).

		2. C pointer types ( ptr int ).

		3. C array types ( [2][2] int ).

	The definition of a C struct type named Node is provided in the Poseidon Lua code below.

	This definition is equivalent to the following in C:

		struct Node {

			char val_char;
			int val_int;
			double val_double;
			bool val_bool;

			int *val_pointer;

			int val_array_1[2][2];
			int *val_array_2[2][2];
			

		};

]]


struct Node

	val_char : char
	val_int : int
	val_double : double
	val_bool : bool

	val_pointer : ptr int

	val_array_1 : [2][2] int
	val_array_2 : [2][2] ptr int

end --end Node


--[[

	Special operators
	======================

	Poseidon Lua provides the following special operators:

		1. sizeof: Returns the size, in number of bytes, of a given C type.

		2. malloc: Allocates a block of memory that is of a given size ( in number of bytes ) and returns a C pointer to it.

		3. free: Deallocates a block of memory that is pointed to by a given C pointer. 

]]


local node_1 : ptr Node = malloc( sizeof( Node ) )




print( "" )
print( "Primitive C types" )
print( "==================================" )

--[[

	Primitive C types
	=======================

	Poseidon Lua provides the following primitive C types:

		1. char
		2. int
		3. double
		4. bool   ( Assume that "bool" is a type that is defined in C )


	When a Lua value is assigned to a variable of a primitive C type, the Lua value is automatically converted to a corresponding C value of the primitive C type.

	When a C value of a primitive C type is accessed, the C value is automatically converted to a corresponding Lua value.

	The primitive C types correspond to Typed Lua types as follows:

		1. char corresponds to string
		2. int corresponds to integer
		3. double corresponds to number
		4. bool corresponds to boolean

]]


node_1.val_char = "A"
node_1.val_int = 100
node_1.val_double = 20.5
node_1.val_bool = true


print( "" )
print( "node_1.val_char == " .. tostring( node_1.val_char ) )
print( "node_1.val_int == " .. tostring( node_1.val_int ) )
print( "node_1.val_double == " .. tostring( node_1.val_double ) )
print( "node_1.val_bool == " .. tostring( node_1.val_bool ) )
print( "" )


print( "----------------------------------" )
print( "" )




print( "C pointer types" )
print( "==========================" )

--[[

	C pointer types
	====================

	In Poseidon Lua, a variable of a C pointer type is declared as follows:

		local pointer_name : ptr ptr ptr int

	This declaration is equivalent to the following declaration in C:

		int ***pointer_name;

	Note that the number of ptr's in the Poseidon Lua declaration is the same as the number of *'s in the C declaration.


	The base type of a C pointer type can be any of the following:

		1. Primitive C types ( char, int, double, bool ).

		2. C Struct types ( Node ).

		3. void

	A pointer of any C pointer type can be assigned to a variable of type "ptr void".

	A pointer of type "ptr void" can be assigned to a variable of any C pointer type.

	cs.NULL acts as the null pointer, equivalent to NULL in C.

]]




local initial_values_pointer : ptr int = malloc( 3 * sizeof( int ) )

initial_values_pointer[0] = 1
initial_values_pointer[1] = 2
initial_values_pointer[2] = 3

local some_void_pointer : ptr void = initial_values_pointer

node_1.val_pointer = some_void_pointer

print( "" )
print( "node_1.val_pointer[0] == " .. tostring( node_1.val_pointer[0] ) )
print( "node_1.val_pointer[1] == " .. tostring( node_1.val_pointer[1] ) )
print( "node_1.val_pointer[2] == " .. tostring( node_1.val_pointer[2] ) )
print( "" )


some_void_pointer = cs.NULL

if some_void_pointer == cs.NULL then

	print( "" )
	print( "some_void_pointer has been set to NULL." )
	print( "" )

end --end if


free( initial_values_pointer )


print( "----------------------------------" )
print( "" )




print( "C array types" )
print( "============================" )

--[[

	C array types
	====================

	In Poseidon Lua, a C array is declared as follows:

		array_name : [2][2] int

	This declaration is equivalent to the following declaration in C:

		int array_name[2][2];

	A C array can only be declared as a member of a C struct.

	The base type of a C array type can be any of the following:

		1. Primitive C types ( char, int, double, bool ).

		2. C pointer types

	A C array is physically stored as a flat array. Thus, a pointer to the flat array can be stored in a variable of a C pointer type.

	A C array can be assigned to a variable of a C pointer type as follows:

		1. Any C array can be assigned to a variable of type "ptr void".

		2. If the base type of the C array is a primitive C type ( int ), then the variable must have a type that is a pointer to that primitive C type ( ptr int ).

		3. If the base type of the C array is a C pointer type ( ptr ptr int ), then the variable must have a type that is a pointer to that type ( ptr ptr ptr int ). 

]]


node_1.val_array_1[0][0] = 1
node_1.val_array_1[0][1] = 2
node_1.val_array_1[1][0] = 3
node_1.val_array_1[1][1] = 4


print( "" )
print( "node_1.val_array_1[0][0] == " .. tostring( node_1.val_array_1[0][0] ) )
print( "node_1.val_array_1[0][1] == " .. tostring( node_1.val_array_1[0][1] ) )
print( "node_1.val_array_1[1][0] == " .. tostring( node_1.val_array_1[1][0] ) )
print( "node_1.val_array_1[1][1] == " .. tostring( node_1.val_array_1[1][1] ) )
print( "" )


local void_pointer_to_array_1 : ptr void = node_1.val_array_1

local pointer_to_array_1 : ptr int = node_1.val_array_1


print( "" )
print( "pointer_to_array_1[0] == " .. tostring( pointer_to_array_1[0] ) )
print( "pointer_to_array_1[1] == " .. tostring( pointer_to_array_1[1] ) )
print( "pointer_to_array_1[2] == " .. tostring( pointer_to_array_1[2] ) )
print( "pointer_to_array_1[3] == " .. tostring( pointer_to_array_1[3] ) )
print( "" )





node_1.val_array_2[0][0] = malloc( sizeof( int ) )
node_1.val_array_2[0][1] = malloc( sizeof( int ) )
node_1.val_array_2[1][0] = malloc( sizeof( int ) )
node_1.val_array_2[1][1] = malloc( sizeof( int ) )

node_1.val_array_2[0][0][0] = 1
node_1.val_array_2[0][1][0] = 2
node_1.val_array_2[1][0][0] = 3
node_1.val_array_2[1][1][0] = 4


print( "" )
print( "node_1.val_array_2[0][0][0] == " .. tostring( node_1.val_array_2[0][0][0] ) )
print( "node_1.val_array_2[0][1][0] == " .. tostring( node_1.val_array_2[0][1][0] ) )
print( "node_1.val_array_2[1][0][0] == " .. tostring( node_1.val_array_2[1][0][0] ) )
print( "node_1.val_array_2[1][1][0] == " .. tostring( node_1.val_array_2[1][1][0] ) )
print( "" )


local void_pointer_to_array_2 : ptr void = node_1.val_array_2

local pointer_to_array_2 : ptr ptr int = node_1.val_array_2


print( "" )
print( "pointer_to_array_2[0][0] == " .. tostring( pointer_to_array_2[0][0] ) )
print( "pointer_to_array_2[1][0] == " .. tostring( pointer_to_array_2[1][0] ) )
print( "pointer_to_array_2[2][0] == " .. tostring( pointer_to_array_2[2][0] ) )
print( "pointer_to_array_2[3][0] == " .. tostring( pointer_to_array_2[3][0] ) )
print( "" )


free( node_1.val_array_2[0][0] )
free( node_1.val_array_2[0][1] )
free( node_1.val_array_2[1][0] )
free( node_1.val_array_2[1][1] )


print( "----------------------------------" )
print( "" )




print( "C strings" )
print( "==========================" )

--[[

	C strings
	===============

	Poseidon Lua provides support for null-terminated C strings.

	When a value of the Typed Lua type "string" is assigned to a variable of type "ptr char", the original value is automatically converted to a null-terminated C string and stored in memory at the location that is pointed to by the variable.

	When a value of type "ptr char" is assigned to a variable of the Typed Lua type "string", the original value is automatically converted to a Lua string and stored in the variable.

]]


local string_A : string = "Initial value of string_A"
local string_B : string = "Initial value of string_B"


local string_A_length = string.len( string_A ) + 1

local string_holder : ptr char = malloc( string_A_length * sizeof( char ) )


string_holder = string_A
string_B = string_holder


print( "" )
print( "string_B == " .. string_B )
print( "" )


free( string_holder )


print( "----------------------------------" )
print( "" )




free( node_1 )






