require "pl"
require "pl.stringx"
require "pl.list"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)  
  if input:len() == 0 then
    return 0
  else
    validate(input)
    list, pattern = getlistandpattern(input)
    return List{list:splitv(pattern)}
      :map(tonumber)
      :filter(function (n) return n <= 1000 end)
      :reduce("+")  
  end
end

function validate(input)
  t = {}  
  for n in string.gmatch(input, "%-%d+") do
    table.insert(t, n)    
  end
  if #t > 0 then
    error("negatives not allowed: " .. (" "):join(t))
  end
end  

function getlistandpattern(input)
  pattern = input:match("//(.)\n")
  if pattern ~= nil then    
    list = string.sub(input, 5)
  else
    pattern = input:match("//%[(.+)%]\n")
    if pattern ~= nil then      
      list = string.sub(input, 6 + #pattern)
    else
      pattern = "[\n,]"
      list = input
    end
  end
  
  return list, pattern
end

return stringcalculator