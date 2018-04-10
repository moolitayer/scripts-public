package main

import (
	"crypto/x509"
	"fmt"
	"io/ioutil"
	"log"
)

func main() {
	// list := make([]string, 0)
	cert, err := ioutil.ReadFile("/tmp/pem.pem")
	if err != nil {
		log.Fatalf("Couldn't load file", err)
	}
	certStore, _ := x509.SystemCertPool()
	certStore.AppendCertsFromPEM(cert)
	fmt.Print(certStore)
}
