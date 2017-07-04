#!/usr/bin/env ruby

def find_subgroup(str, word)
  return [str] if word.empty?
  res = []
  word.each_with_index do |val, index|
    res << find_subgroup("#{str}#{val}", word[index+1..-1])
    res << find_subgroup("#{str}", word[index+1..-1])
  end
  res.uniq
end

def find_permutations(word)
  dict = load_dict
  word.permutation.map(&:join).each do |perm|
    puts perm if dict.include?("#{perm}\n")
  end


end

def load_dict
  File.readlines('/usr/share/dict/words')
end


puts find_subgroup '', ARGV[0].split("")




