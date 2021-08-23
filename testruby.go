package main

import "C"

//export add
func add(x, y int) int {
	c := 0
	for i := 0; i < 50000; i++ {
		c += x + y + 1
	}
	return c
}

func main() {}
