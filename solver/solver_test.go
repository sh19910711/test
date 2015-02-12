package solver

import "testing"

func TestSolver(t *testing.T) {
  s := CreateSolver()
  if s.input().eof {
    t.Fail()
  }
}

