require_relative "00_tree_node"
require "byebug"
class KnightPathFinder
    attr_reader :new_move_positions
    def initialize(arr)
        @self_root_node = PolyTreeNode.new(arr)
        @considered_positions = [arr]
    end
    attr_reader :considered_positions
    attr :self_root_node

    def build_move_tree
        tree_arr = [@self_root_node]
        while tree_arr.length != 0
            current_node = tree_arr.shift
            children_arr = self.new_move_positions(current_node.value)
            children_arr.each do |ele|
                child_node = PolyTreeNode.new(ele)
                #current_node.children << child_node

                child_node.parent=(current_node)
                current_node.add_child(child_node)
                tree_arr.unshift(child_node)
            end
        end
    end

    def self.valid_moves(pos)  
        real_results = []
        result_arr = [[pos[0]-1,pos[1]-2],[pos[0]-1,pos[1]+2],[pos[0]+1,pos[1]-2],[pos[0]+1,pos[1]+2],[pos[0]+2,pos[1]+1],[pos[0]-2,pos[1]-1],[pos[0]-2,pos[1]+1],[pos[0]+2,pos[1]-1]] 
        #p result_arr
        result_arr.each do |ele|
            ele
            if ele[0] > -1 && ele[0] < 8 && ele[1] > -1 && ele[1] < 8
                real_results << ele
            end
        end
        real_results
    end

    def new_move_positions(pos)
        new_moves = []
        moves_arr = KnightPathFinder.valid_moves(pos)
        moves_arr.each do |ele|
            if !@considered_positions.include?(ele)
                new_moves << ele
                @considered_positions << ele
            end
        end
        new_moves
    end

    def end_path(pos)
        tree_arr = [@self_root_node]
        while tree_arr.length != 0
            current_node = tree_arr.shift
            current_node.children.each do |ele|
                if ele.value == pos
                    return ele
                end
                if current_node.children == []
                    
                    tree_arr << current_node.children
                end
            end
        end            
    end


end