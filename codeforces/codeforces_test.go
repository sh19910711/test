package codeforces

import "testing"

func TestHello(t *testing.T) {
  ret := Hello()
  if ret != "Hello" {
    t.Fail()
  }
}

func TestContestList(t *testing.T) {
  ret := ContestList()
  if len(ret) != 501 {
    t.Fail()
  }
}

func TestApi(t *testing.T) {
  ret := api("/contest.list").String()
  if ret != ENDPOINT + "/contest.list" {
    t.Fail()
  }
}

func TestApiWithQuery(t *testing.T) {
  ret := api("/contest.list?q=foo").String()
  if ret != ENDPOINT + "/contest.list?q=foo" {
    t.Fail()
  }
}

