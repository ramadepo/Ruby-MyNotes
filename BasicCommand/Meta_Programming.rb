puts
#---------------------------------------A----------------------------------------
class A
    def self.new_method(method_name, &block)
        define_method(method_name) do |method_arg|
            puts "Number #{method_name} : #{method_arg}"
            block.call(method_arg)
        end
    end
end

a = A.new

something = %W{one two three four}  #["one", "two", three", "four"]

something.each do |number|
    A.new_method(number) do |block_arg|
        puts "Hello ~ #{block_arg}"
        puts
    end
end

a.one("Frog")   #Number one : Grog \n Hello ~ Frog
a.two("Kappa")  #Number two : Kappa \n Hello ~ Kappa
