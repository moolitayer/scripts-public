package main

import "fmt"

func main() {
	// list := make([]string, 0)
	var list []string
	if list == nil {
		fmt.Println(len(list))
	}
	fmt.Println("%T: %v", list, list)
	return
}
