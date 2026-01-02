package main

import (
	"os"
	"strings"
)

func ReadShortInput() []string {
	return []string{
		"..@@.@@@@.", "@@@.@.@.@@", "@@@@@.@.@@", "@.@@@@..@.", "@@.@@@@.@@", ".@@@@@@@.@", ".@.@.@.@@@", "@.@@@.@@@@", ".@@@@@@@@.", "@.@.@@@.@.",
	}
}

func ReadInputFile() []string {
	dat, _ := os.ReadFile("../../inputs/day4.txt")
	return strings.Split(string(dat), "\n")
}

func AdjacentPositions() [8][2]int {
	return [8][2]int{
		{-1, -1},
		{-1, 0},
		{-1, 1},
		{0, -1},
		{0, 1},
		{1, -1},
		{1, 0},
		{1, 1},
	}
}

// I used Copilot pretty extensively on this solution, as well as some unrelated Go repo code,
// and one random AoC day 4 Go solution from GitHub for reference.
// Usually I adhere to the "No one can learn for you" rule but this would have taken me a lot longer without it,
// since I don't know Go much at all. I try to write as much as possible myself, proofread any generated code,
// and made sure I knew what I was doing.

func Part1(rows []string) int {
	grid := [][]string{}
	for _, row := range rows {
		grid = append(grid, strings.Split(row, ""))
	}

	accessibleRolls := 0
	for row := range grid {
		for col := range grid[row] {
			if grid[row][col] != "@" {
				continue
			}

			adjacentRolls := 0
			for _, pos := range AdjacentPositions() {
				x := row + pos[0]
				y := col + pos[1]
				posIsOutOfBounds := x < 0 || x >= len(grid) || y < 0 || y >= len(grid[row])
				if posIsOutOfBounds {
					continue
				}
				if grid[x][y] == "@" {
					adjacentRolls++
				}
			}
			if adjacentRolls < 4 {
				accessibleRolls++
			}
		}
	}

	return accessibleRolls
}

func Part2(rows []string) int {
	grid := [][]string{}
	for _, row := range rows {
		grid = append(grid, strings.Split(row, ""))
	}

	allDone := false
	accessibleRolls := 0

	for !allDone {
		markedForDeletion := [][2]int{}

		for row := range grid {
			for col := range grid[row] {
				if grid[row][col] != "@" {
					continue
				}

				adjacentRolls := 0
				for _, pos := range AdjacentPositions() {
					x := row + pos[0]
					y := col + pos[1]
					posIsOutOfBounds := x < 0 || x >= len(grid) || y < 0 || y >= len(grid[row])
					if posIsOutOfBounds {
						continue
					}
					if grid[x][y] == "@" {
						adjacentRolls++
					}
				}
				if adjacentRolls < 4 {
					accessibleRolls++
					markedForDeletion = append(markedForDeletion, [2]int{row, col})
				}
			}
		}

		if len(markedForDeletion) == 0 {
			allDone = true
		} else {
			for _, pos := range markedForDeletion {
				grid[pos[0]][pos[1]] = "."
			}
		}
	}
	return accessibleRolls
}

func main() {
	resultPart1 := Part1(ReadInputFile())
	println("Part 1:", resultPart1)

	resultPart2 := Part2(ReadInputFile())
	println("Part 2:", resultPart2)
}
