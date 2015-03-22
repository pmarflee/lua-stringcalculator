EXPORT_ASSERT_TO_GLOBALS = true
require('luaunit')
stringcalculator = require('stringcalculator')

TestStringCalculator = {}
  
  function TestStringCalculator:test_shouldReturnZeroForEmptyInput()
    assertEquals(stringcalculator.add(""), 0)
  end
  
  function TestStringCalculator:test_shouldReturn1WhenInputIs1()
    assertEquals(stringcalculator.add("1"), 1)
  end

lu = LuaUnit.new()
lu:setOutputType("tap")
os.exit( lu:runSuite() )