package main

import (
	"testing"
)

func TestPart1(t *testing.T) {
	var tests = []struct {
		name     string
		input    []string
		expected int
	}{
		{"Small example", ReadShortInput(), 13},
		{"Full example", ReadInputFile(), 1346},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := Part1(tt.input)
			if result != tt.expected {
				t.Errorf("expected %d got %d", tt.expected, result)
			}
		})
	}
}

func TestPart2(t *testing.T) {
	var tests = []struct {
		name     string
		input    []string
		expected int
	}{
		{"Small example", ReadShortInput(), 43},
		{"Full example", ReadInputFile(), 8493},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := Part2(tt.input)
			if result != tt.expected {
				t.Errorf("expected %d got %d", tt.expected, result)
			}
		})
	}
}
