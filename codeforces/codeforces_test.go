package codeforces

import "testing"
import "net/http"
import "net/http/httptest"
import "fmt"
import "log"

var fakeServer *httptest.Server = setupServer()

func setupServer() *httptest.Server {
  handler := http.HandlerFunc(func (w http.ResponseWriter, r *http.Request) {
    log.Printf("%s: %s", r.Method, r.URL.Path)
    if r.Method == "GET" {
      switch r.URL.Path {
        case "/contest.list":
          fmt.Fprintln(w, "{\"status\": \"OK\", \"result\": []}")

        default:
          log.Fatalf("Unknown Request")

      }
    }
  })

  server := httptest.NewServer(handler)
  Endpoint = server.URL
  return server
}

func TestContestList(t *testing.T) {
  ret := ContestList()
  if len(ret) != 0 {
    t.Fail()
  }
}

