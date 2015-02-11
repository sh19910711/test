package codeforces

import "testing"

func TestHello(t *testing.T) {
  ret := Hello()
  if ret != "Hello" {
    t.Fail()
  }
}

