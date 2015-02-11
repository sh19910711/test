package codeforces

import "log"
import "net/http"
import "io"
import "net/url"
import "encoding/json"

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
  Contests []Contest `json:"result"`
}

func api(path string) (*http.Response, error) {
  apiUrl, _ := url.Parse(Endpoint + path)
  req, err := http.Get(apiUrl.String())
  return req, err
}

func result(r io.Reader) *Result {
  ret     := new(Result)
  decoder := json.NewDecoder(r)
  err     := decoder.Decode(&ret)

  if err != nil {
    log.Fatalf("Error on parsing result")
  }

  if ret.Status != "OK" {
    log.Fatalf("Error on calling web api: %s", ret.Status)
  }

  return ret
}

func ContestList() []Contest {
  req, err := api("/contest.list")

  if err != nil {
    log.Fatalf("Error on HTTP request")
  }

  defer req.Body.Close()
  return result(req.Body).Contests
}

func Hello() string {
  return "Hello"
}

