require "pl"
require "pl.stringx"
require "pl.list"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)  
  if input:len() == 0 then
    return 0
  else
    return split(input)
      :map(tonumber)
      :filter(function (n) return n <= 1000 end)
      :reduce("+")  
  end
end

function split(input)
  validate(input)
  match = input:match("//(.)\n")  
  if match ~= nil then
    pattern = "[" .. match .. "]"
    input = string.sub(input, 5)
  else
    pattern = "[\n,]"
  end
  return List{input:splitv(pattern)}
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

return stringcalculator