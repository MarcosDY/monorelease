package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: baztest <project>")
		return
	}
	fmt.Printf("baz-test projects: %v\n", time.Now().Format("2006-01-02 15:04:05"))
}
