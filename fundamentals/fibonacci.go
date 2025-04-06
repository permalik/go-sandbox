package fundamentals

import "fmt"

type FibonacciVersion func(int) int

func Fibonacci(fn FibonacciVersion) {
	fmt.Println("starting fib....")
	for n := range 10 {
		fmt.Printf("%d ", fn(n))
	}
	fmt.Printf("\n")
}

func Recursive(n int) int {
	if n == 0 {
		return n
	}
	if n == 1 {
		return n
	}
	return Recursive(n-1) + Recursive(n-2)
}
