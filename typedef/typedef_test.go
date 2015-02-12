package typedef

import "testing"

func TestType(t *testing.T) {
  var x Int
  x = 1
  if x != 1 {
    t.Fail()
  }
}

