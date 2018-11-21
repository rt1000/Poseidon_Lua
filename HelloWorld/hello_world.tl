local hello_char_list : ptr char = malloc( 5 * sizeof( char ) )
local world_char_list : ptr char = malloc( 5 * sizeof( char ) )

hello_char_list[ 0 ] = "H"
hello_char_list[ 1 ] = "e"
hello_char_list[ 2 ] = "l"
hello_char_list[ 3 ] = "l"
hello_char_list[ 4 ] = "o"

world_char_list[ 0 ] = "W"
world_char_list[ 1 ] = "o"
world_char_list[ 2 ] = "r"
world_char_list[ 3 ] = "l"
world_char_list[ 4 ] = "d"


local print_string = ""

print_string = print_string .. hello_char_list[ 0 ]
print_string = print_string .. hello_char_list[ 1 ]
print_string = print_string .. hello_char_list[ 2 ]
print_string = print_string .. hello_char_list[ 3 ]
print_string = print_string .. hello_char_list[ 4 ]

print_string = print_string .. " "

print_string = print_string .. world_char_list[ 0 ]
print_string = print_string .. world_char_list[ 1 ]
print_string = print_string .. world_char_list[ 2 ]
print_string = print_string .. world_char_list[ 3 ]
print_string = print_string .. world_char_list[ 4 ]


print( print_string )




free( hello_char_list )
free( world_char_list )




