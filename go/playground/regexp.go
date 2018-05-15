package main

import (
	"fmt"
	"regexp"
)

func main() {
	var passwordFilterRegex = regexp.MustCompile("(?i:password|token|authorization|key)")
	fmt.Println(passwordFilterRegex.MatchString("PassWord"))
	var a map[string]string
	fmt.Println(len(a))
}
