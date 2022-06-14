require_relative "knight's_trevails"
require_relative "00_tree_node"

kpf = KnightPathFinder.new([0, 0])
p kpf.self_root_node.children
kpf.build_move_tree
p kpf.self_root_node.children[1].children[1].children
#p kpf.self_root_node
#kpf.end_path([5,4])

