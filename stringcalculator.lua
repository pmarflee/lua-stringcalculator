require "pl"
require "pl.stringx"
require "pl.list"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)  
  if input:len() == 0 then
    return 0
  else
    return split(input):map(tonumber):reduce("+")  
  end
end

function split(input)
  match = input:match("//(.)\n")  
  if match ~= nil then
    pattern = "[" .. match .. "]"
    input = string.sub(input, 5)
  else
    pattern = "[\n,]"
  end
  return List{input:splitv(pattern)}
end

return stringcalculator