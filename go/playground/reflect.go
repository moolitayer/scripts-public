package main

import "reflect"

func main() {
	var ptt *string
	println(reflect.Indirect(reflect.ValueOf(ptt)))
}
