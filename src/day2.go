package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
	"sync"
)

func hasDoubleDigits(x string) bool {
	length := len(x)
	if length%2 != 0 {
		return false
	}

	firstHalf := x[:length/2]
	secondHalf := x[length/2:]
	return firstHalf == secondHalf
}

func findInvalidNumbers(rangeStr string) []int {
	numbers := strings.Split(rangeStr, "-")
	start, _ := strconv.Atoi(numbers[0])
	end, _ := strconv.Atoi(numbers[1])
	result := []int{}
	resultStr := ""
	for i := start; i <= end; i++ {
		if hasDoubleDigits(strconv.Itoa(int(i))) {
			fmt.Print(fmt.Sprint(i) + " ")
			result = append(result, i)
			resultStr += fmt.Sprint(i) + " "
		}
	}
	fmt.Println("Invalid for range " + fmt.Sprint(rangeStr) + ":\n" + resultStr + "\n--------------------")
	return result
}

func readInputFile() []string {
	dat, _ := os.ReadFile("../inputs/day2.txt")
	return strings.Split(string(dat), ",")
}

func sumArray(outputChan chan []int) int {
	result := 0
	for i := range outputChan {
		for _, num := range i {
			result += num
		}
	}
	return result
}

func main() {
	ranges := readInputFile()

	var wg sync.WaitGroup
	outputChan := make(chan []int)

	for _, i := range ranges {
		wg.Add(1)
		go func(rangeStr string) {
			defer wg.Done()
			outputChan <- findInvalidNumbers(rangeStr)
		}(i)
	}

	go func() {
		wg.Wait()
		close(outputChan)
		fmt.Println("All goroutines complete")
	}()

	sum := sumArray(outputChan)
	fmt.Println("Result: " + fmt.Sprint(sum))
}
