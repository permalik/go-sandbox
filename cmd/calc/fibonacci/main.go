package main

import "fmt"

func main() {
	fmt.Println("starting fib....")
	for n := range 10 {
		fmt.Printf("%d ", fibonacci(n))
	}
	fmt.Printf("\n")
}

func fibonacci(n int) int {
	if n == 0 {
		return n
	}
	if n == 1 {
		return n
	}
	return fibonacci(n-1) + fibonacci(n-2)
}
