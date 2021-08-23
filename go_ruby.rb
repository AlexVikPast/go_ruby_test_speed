
require 'ffi'

module MegaSum
  extend FFI::Library
  ffi_lib File.dirname(__FILE__) + '/libadd.so'
  attach_function :add, [:int, :int], :int

  def self.add_ruby(x,y)
    c = 0
    i = 0
    while i<50000
      c += x + y + 1
      i = i+1
    end
    c
  end

end

time_begin_go = Time.now

1000.times do |n|
  MegaSum.add(3, 2)
end

time_go = Time.now - time_begin_go

time_begin_ruby = Time.now
1000.times do |n|
  MegaSum.add_ruby(3, 2)
end

time_ruby = Time.now - time_begin_ruby

puts "Время работы Go.. #{time_go}"
puts "Время работы Ruby #{time_ruby}"

puts "Go быстрее Ruby в #{time_ruby/time_go}"