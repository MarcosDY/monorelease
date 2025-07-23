package baztest

import (
	"fmt"
	"time"
)

func main(args []string) {
	if len(args) < 1 {
		fmt.Println("Usage: baztest <project>")
		return
	}
	fmt.Printf("baz-test projects: %v\n", time.Now().Format("2006-01-02 15:04:05"))
}
