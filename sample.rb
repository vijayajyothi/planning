array =["a","b","c"]
arr = IO.readlines("tesing.txt")
position=arr[0]
writing= File.new("tesing.txt", "w")
if position.to_i <2
   writing.syswrite(position.to_i+1)
else
  writing.syswrite(0)
end

