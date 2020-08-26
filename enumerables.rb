require "byebug"
class Array
    def my_each(&block)
        i = 0
        while i < self.length
            block.call(self[i])
            i += 1
        end
        self
    end
    def my_select(&block)
        new_array = []
        self.my_each do |ele|
            if block.call(ele)
                new_array << ele
            end
        end
        new_array

    end

    def my_reject(&block)
        new_array = []
        self.my_each do |ele|
            if !block.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_any?(&block)
        self.my_each do |ele|
            if block.call(ele)
                return true
            end
        end
        false
    end

    def my_all?(&block)
        self.my_each do |ele|
            if !block.call(ele)
                return false
            end
        end
        true
    end

    def my_flatten
        if self.my_all?{|ele| !ele.kind_of?(Array)}
            return self
        end
        flat = []
        self.my_each do |ele| 
            if !ele.kind_of?(Array)
                flat << ele
            else
                flat += ele.my_flatten 
            end
        end
        flat
    end

    def my_zip(*args)
        new_array = []
        (0...self.length).each do |i|
            inner = []
            inner << self[i]
            args.my_each do |el|
                inner << el[i]
            end
            new_array << inner
        end
        new_array
    end

    def my_rotate(val = 1)
        if val > 0 
            while val > 0 
                    temp = self.shift
                    self.push(temp)
                val -= 1
            end
        elsif val < 0
            while val < 0 
                temp = self.pop
                self.unshift(temp)
                val += 1
            end
        end
        self
    end

    def my_join(str = "")
        join = ""
        self.each{|el| join += (el + str)}
        if str.length == 0
        return join
        else
            return join[0...-1]
        end
    end

    def my_reverse
        length = self.length
        i = 0
        while i < (length / 2)
            
            self[i], self[length - 1 - i] = self[length - 1 - i], self[i]
            i += 1
        end
        self
    end
end 

