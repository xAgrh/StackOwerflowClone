#/!usr/bin/ruby
# -*- coding: utf-8 -*-


f = File.open('methodsfile')
arr = [] 
f.each_line do |line| # отправляем в массив каждую строку
  arr.push line
end
arr.map! do |a| # делим на части
  a = a.split(/\=/).collect!{|x| x.strip}
  a.map! do |b|
    b = b.split(/\./)
  end
end

arr.map! do |m| # переводим в хэш
  m[0].reverse.inject(m[1]) { |a, b| { b.to_sym => a } }
end

# соединяем

class Test 
  def self.do_merge(a, b)
    a.merge(b) {|k, xa, xb| do_merge(xa, xb) }
  end
end

a = arr[0]
b = Test.do_merge(a,arr[1])
c = Test.do_merge(b,arr[2])
d = Test.do_merge(c,arr[3])
e = Test.do_merge(d,arr[4])
f = Test.do_merge(e,arr[5])

hash = {config: f}

puts hash




