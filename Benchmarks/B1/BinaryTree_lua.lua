local BT_lua = {}

local function build_tree ( tree_height )

	local tree_node = {}

	if tree_height == -1 then
		return nil
	else
		tree_node.subtree_left = build_tree( tree_height - 1 )
		tree_node.subtree_right = build_tree( tree_height - 1 )
		return tree_node
	end --end else

end --end build_tree


function BT_lua.run ( tree_height )

	local tree_root = build_tree( tree_height )

	local queue = {}

	table.insert( queue, tree_root )

	while #queue ~= 0 do

		local curr_node = table.remove( queue )

		if curr_node.subtree_left then

			table.insert( queue, curr_node.subtree_left )

		end --end if

		if curr_node.subtree_right then

			table.insert( queue, curr_node.subtree_right )

		end --end if
 print( "QUEUE SIZE = " .. #queue )
	end --end while

	print( "         >>>>>>>>>>>>>>> DONE BT_LUA" )

	return 1

end --end BT_lua.run


return BT_lua