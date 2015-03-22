local stringcalculator = {}

function stringcalculator.add(input)
  if string.len(input) == 0 then
    return 0
  else
    return tonumber(input)
  end
end

return stringcalculator