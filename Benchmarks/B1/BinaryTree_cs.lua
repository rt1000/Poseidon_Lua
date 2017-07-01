








local BT_cs = {}

local function build_tree (tree_height) 

  local tree_node
  tree_node = CS_malloc(8)



  if tree_height == -(1) then 
    return cs.NULL
  else 

    local sub_left = build_tree(tree_height - 1)
    do 
CS_storePointer(tree_node,0,sub_left)     end

    local sub_right = build_tree(tree_height - 1)
    do 
CS_storePointer(tree_node,4,sub_right)     end

    return tree_node
  end
end



BT_cs.run = function (tree_height) 

  local tree_root_any = build_tree(tree_height)

  local tree_root = tree_root_any

  local queue = {}


  table.insert(queue,tree_root)

  while not (#(queue) == 0) do 

    local curr_node_any = table.remove(queue)

    local curr_node = curr_node_any
    local curr_node_subtree_left = CS_loadPointer(curr_node,0)
    local curr_node_subtree_right = CS_loadPointer(curr_node,4)


    if not (curr_node_subtree_left == cs.NULL) then 

      table.insert(queue,curr_node_subtree_left)
    end


    if not (curr_node_subtree_right == cs.NULL) then 

      table.insert(queue,curr_node_subtree_right)
    end

    print("QUEUE SIZE = " .. tostring(#(queue)))
  end

  print("         !!!!!! >>>>>>>>>>>>>>> DONE BT_CS")

  return 1
end



return BT_cs


