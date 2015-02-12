// @snip <./input.go>
// @snip <./output.go>

type Solver struct {
  in *Input
  out *Output
}

func (s *Solver) input() *Input {
  return s.in
}

func CreateSolver() *Solver {
  s := new(Solver)
  s.in = new(Input)
  s.out = new(Output)
  return s
}
