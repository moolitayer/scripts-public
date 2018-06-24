#!/usr/bin/env ruby
def oddNumbers(l, r)
    ret = []
    return ret if l>= r
    for i in l..r
        if i % 2 == 1
            puts i
            ret << i
        end
    end
    ret
end

def findNumber(arr, k)
  found = false
  arr.each { |item| return "YES" if item == k }
  "NO"
end

_arr_cnt = 0
_arr_cnt = Integer(gets)
_arr_i=0
_arr = Array.new(_arr_cnt)

while (_arr_i < _arr_cnt)
  _arr_item = Integer(gets);
  _arr[_arr_i] = (_arr_item)
  _arr_i+=1
end


_k = Integer(gets);

res = findNumber(_arr, _k);
puts res
