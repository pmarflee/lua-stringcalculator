require "pl"
require "pl.stringx"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)
  if string.len(input) == 0 then
    return 0      
  else
    tokens = input:split(",")    
    sum = 0
    for k, v in pairs(tokens) do
      sum = sum + tonumber(v)
    end
    return sum
  end
end

return stringcalculator