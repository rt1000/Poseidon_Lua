local BT_lua = require( "BinaryTree_lua" )
local BT_cs = require( "BinaryTree_cs" )

local BT_lua_times = {}
local BT_cs_times = {}

--height = 10
local height_initial = 10
local num_data_points = 10


local height_list = {}

local multiplier = 1

while multiplier <= num_data_points do

	height_list[ multiplier ] = ( multiplier + height_initial )

	multiplier = multiplier + 1

end --end while


for k, v in ipairs( height_list ) do

	local time_start = os.time()

	BT_lua.run( v )

	local time_finish = os.time()


	BT_lua_times[ k ] = time_finish - time_start

end --end for


--[[
for k, v in ipairs( height_list ) do

	local time_start = os.time()

	BT_cs.run( v )

	local time_finish = os.time()


	BT_cs_times[ k ] = time_finish - time_start

end --end for

]]

--BT_lua.run( 10 )
io.output( "B1_results" )

--io.write( "RESULTS: \n", tostring( BT_lua_times[ 10 ] ) )

for k, v in ipairs( BT_lua_times ) do
	io.write( tostring( BT_lua_times[ k ] ), ",\n" )
--	io.write( tostring( BT_lua_times[ k ] ), ", ", tostring( BT_cs_times[ k ] ), "\n" )

end --end for
