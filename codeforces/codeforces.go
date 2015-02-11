package codeforces

import "log"
import "net/http"
import "io"
import "net/url"
import "encoding/json"

const ENDPOINT = "http://codeforces.com/api"

type Client struct {
  client *http.Client
}

type Contest struct {
  Id int `json:"id"`
  Name string `json:"name"`
}

func api(path string) *url.URL {
  res, _ := url.Parse(ENDPOINT + path)
  return res
}

type ResultContest struct {
  Status string `json:"status"`
  Contests []Contest `json:"result"`
}

func result(r io.Reader) []Contest {
  ret := new(ResultContest)
  decoder := json.NewDecoder(r)
  err := decoder.Decode(&ret)
  if err != nil {
    log.Fatalf("Error on parsing result")
  }
  if ret.Status != "OK" {
    log.Fatalf("Error on calling web api: %s", ret.Status)
  }
  return ret.Contests
}

func ContestList() []Contest {
  req, err := http.Get(api("/contest.list").String())
  if err != nil {
    log.Fatalf("Error on HTTP request")
  }
  defer req.Body.Close()
  return result(req.Body)
}

func Hello() string {
  return "Hello"
}

