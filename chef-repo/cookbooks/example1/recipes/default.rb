#
# Cookbook:: example1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

puts 'Hello World'

if `ps -ef | grep java | grep -v grep` != ""
    puts "Java Process Running"
else
    puts "Java Process Not Running"
end

