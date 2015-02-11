package tests

import "testing"
import "./codeforces"

func TestHello(t *testing.T) {
  ret := codeforces.Hello()
  if ret != "Hello" {
    t.Fail()
  }
}

