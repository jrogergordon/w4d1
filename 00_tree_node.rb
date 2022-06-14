require "byebug"
class PolyTreeNode


    def initialize(value, children = [])
        @value = value
        @parent = nil
        @children = children
    end

    attr_reader  :value
    attr_reader  :parent
    attr_reader  :children


    attr_writer :value
    attr_writer :parent
    attr_writer :children

    def parent=(node)
        if @parent != nil && @parent.children.include?(self)
            @parent.children.delete(self)
        end

        if node == nil
            @parent = nil
        else
            @parent = node
            if !node.children.include?(self)
                node.children << self
            end
        end
    end

    def add_child(child)
        child.parent=(self)
    end

    def remove_child(child)
        raise "error, arguement node is not a child of passed in parent node" if !self.children.include?(child)
        child.parent=(nil)
    end

    # def inspect
    #     "#{self.object_id} #{self.value}"
    # end

    def dfs(value)
        node_tree = [self]
        while !node_tree.empty?
            current_node = node_tree.shift
            if current_node.value == value
                return current_node
            end
            node_tree = current_node.children + node_tree
        end
        nil 
    end

    def bfs(value)
        node_tree = [self]

        while !node_tree.empty?
            current_node = node_tree.shift
            if current_node.value == value
                return current_node
            end
            node_tree = node_tree + current_node.children
        end
        nil 
    end


end

