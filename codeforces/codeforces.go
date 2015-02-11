package codeforces

import "log"
import "net/http"
import "io"
import "net/url"
import "encoding/json"
import "fmt"

var Endpoint = "http://codeforces.com/api"

type Client struct {
  client *http.Client
}

type Contest struct {
  Id int `json:"id"`
  Name string `json:"name"`
}

type Result struct {
  Status string `json:"status"`
}

type ResultContest struct {
  Result
  Contests []Contest `json:"result"`
}

func api(path string) (*http.Response, error) {
  apiUrl, _ := url.Parse(Endpoint + path)
  req, err := http.Get(apiUrl.String())
  return req, err
}

func result(ret Result, r io.Reader) {
  decoder := json.NewDecoder(r)
  err     := decoder.Decode(ret)

  if err != nil {
    log.Fatalf("Error on parsing result")
  }

  if ret.Status != "OK" {
    log.Fatalf("Error on calling web api: %s", ret.Status)
  }
}

func ContestList() []Contest {
  req, err := api("/contest.list")

  if err != nil {
    log.Fatalf("Error on HTTP request")
  }

  defer req.Body.Close()
  res := ResultContest {}
  p1 := ResultContest {
    Status: "aa",
  }
  fmt.Println(p1.Status)
  // result(res, req.Body)
  return res.Contests
}

func Hello() string {
  return "Hello"
}

