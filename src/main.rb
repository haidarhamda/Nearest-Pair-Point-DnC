require_relative 'Algorithm.rb'
require "numo/gnuplot"

puts "number of points:"
n=gets.to_i
puts "number of dimension:"
d=gets.to_i
points= []
i=0
while i<n
    points.append([d.times.map{rand(-100..100)},i])
    i+=1
end
points=points.sort_by{|item| item[0][0]}
puts "divide"
startdq=Time.now
pairs = divideNConquer(points)
finishdq=Time.now
print pairs
puts "pairs"
puts "p1"
print getPointById(points,pairs[1])
puts "p2"
print getPointById(points,pairs[2])
puts "bf"
puts finishdq-startdq

startbf=Time.now
bf=findNearest(points)
finishbf=Time.now
print bf
puts "pairs"
puts "p1"
print getPointById(points,bf[1])
puts "p2"
print getPointById(points,bf[2]),"\n"
puts finishbf-startbf