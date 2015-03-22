local stringcalculator = {}

function stringcalculator.add(input)
  if string.len(input) == 0 then
    return 0      
  else
    start = input:find(",")
    if start ~= nil then
      first = input:sub(1, 1)
      second = input:sub(3, 3)
      return tonumber(first) + tonumber(second)
    else
      return tonumber(input)
    end
  end
end

return stringcalculator