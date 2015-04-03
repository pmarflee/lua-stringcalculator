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
    local list, delimiters = getlistanddelimiters(input)
    return split(list, delimiters)
      :map(tonumber)
      :filter(function (n) return n <= 1000 end)
      :reduce("+")  
  end
end

function validate(input)
  local t = {}  
  for n in string.gmatch(input, "%-%d+") do
    table.insert(t, n)    
  end
  if #t > 0 then
    error("negatives not allowed: " .. (" "):join(t))
  end
end  

function getlistanddelimiters(input)
  local patterns, list = input:match("//(.+)\n(.+)")
  if patterns == nil then    
    return input, {"\n",","}    
  else
    local delimiters = {}
    for delimiter in string.gmatch(patterns, "%[(.-)%]") do
      table.insert(delimiters, delimiter)
    end
    if #delimiters == 0 then
      for delimiter in patterns:gmatch(".") do
        table.insert(delimiters, delimiter)
      end
    end
    return list, delimiters  
  end  
end

function split(list, delimiters)
  local numbers = List()
  local init = 1  
  repeat        
    local minfrom = nil; local minto = nil
    for key, delimiter in pairs(delimiters) do
      local from, to = string.find(list, delimiter, init, true)
      if from ~= nil and (minfrom == nil or from < minfrom) then
        minfrom = from; minto = to
      end
    end  
    if minfrom == nil then
      numbers:append(string.sub(list, init))
    else
      numbers:append(string.sub(list, init, minfrom - 1))
      init = minto + 1      
    end
  until minfrom == nil
  return numbers
end  

return stringcalculator