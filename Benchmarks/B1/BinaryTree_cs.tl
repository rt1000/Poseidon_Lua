struct Node

	subtree_left : ptr Node
	subtree_right : ptr Node

end --end struct



local BT_cs = {}

local function build_tree ( tree_height )

	local tree_node : ptr Node 
	tree_node = malloc( ptr Node )



	if tree_height == -1 then
		return cs.NULL
	else

		local sub_left : any = build_tree( tree_height - 1 )
		tree_node.subtree_left = sub_left
		local sub_right : any = build_tree( tree_height - 1 )
		tree_node.subtree_right = sub_right
		return tree_node
	end --end else

end --end build_tree


function BT_cs.run ( tree_height )

	local tree_root_any : any = build_tree( tree_height )

	local tree_root : ptr Node = tree_root_any

	local queue : any = {}


	table.insert( queue, tree_root )

	while #queue ~= 0 do

		local curr_node_any : any = table.remove( queue )

		local curr_node : ptr Node = curr_node_any
		local curr_node_subtree_left : any = curr_node.subtree_left
		local curr_node_subtree_right : any = curr_node.subtree_right


		if curr_node_subtree_left ~= cs.NULL then

			table.insert( queue, curr_node_subtree_left )

		end --end if

		if curr_node_subtree_right ~= cs.NULL then

			table.insert( queue, curr_node_subtree_right )

		end --end if
 print( "QUEUE SIZE = " .. tostring(#queue) )
	end --end while

	print( "         !!!!!! >>>>>>>>>>>>>>> DONE BT_CS" )

	return 1

end --end BT_cs.run


return BT_cs
