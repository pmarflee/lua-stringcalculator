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
  
  function TestStringCalculator:test_shouldReturn3WhenInputIs1And2()
    assertEquals(stringcalculator.add("1,2"), 3)
  end
  
  function TestStringCalculator:test_shouldReturn6WhenInputIs1And2And3()
    assertEquals(stringcalculator.add("1,2,3"), 6)
  end

  function TestStringCalculator:test_shouldReturn10WhenInputIs1And2And3And4()
    assertEquals(stringcalculator.add("1,2,3,4"), 10)
  end
  
  function TestStringCalculator:test_shouldHandleNewLinesBetweenNumbers()
    assertEquals(stringcalculator.add("1\n2,3"), 6)
  end
  
  function TestStringCalculator:test_shouldHandleDifferentDelimiters()
    assertEquals(stringcalculator.add("//;\n1;2;3"), 6)
  end
  
  function TestStringCalculator:test_shouldThrowAnExceptionForASingleNegativeNumber()
    assertErrorMsgContains("negatives not allowed: -1", stringcalculator.add, "-1,2,3")
  end
    
  function TestStringCalculator:test_shouldThrowAnExceptionForAMultipleNegativeNumbers()
    assertErrorMsgContains("negatives not allowed: -1 -2", stringcalculator.add, "-1,-2,3")
  end
  
  function TestStringCalculator:test_shouldIgnoreNumbersGreaterThan1000()
    assertEquals(stringcalculator.add("1001,2"), 2)
  end
  
  function TestStringCalculator:test_shouldHandleDelimitersOfAnyLength()
    assertEquals(stringcalculator.add("//[***]\n1***2***3"), 6)
  end
  
lu = LuaUnit.new()
lu:setOutputType("tap")
os.exit( lu:runSuite() )