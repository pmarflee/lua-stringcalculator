require "pl"
require "pl.stringx"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)
  if string.len(input) == 0 then
    return 0      
  else
    tokens = input:split(",")    
    if tokens[2] ~= nil then      
      return tonumber(tokens[1]) + tonumber(tokens[2])
    else
      return tonumber(tokens[1])
    end
  end
end

return stringcalculator