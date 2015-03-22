require "pl"
require "pl.stringx"
require "pl.list"

stringx.import()

local stringcalculator = {}

function stringcalculator.add(input)  
  if input:len() == 0 then
    return 0
  else
    return input:split(","):map(tonumber):reduce("+")  
  end
end

return stringcalculator