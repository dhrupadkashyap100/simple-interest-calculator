#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input
echo "=========================================="
echo "    Simple Interest Calculator"
echo "=========================================="
echo ""

# Prompt user for principal amount
read -p "Enter the Principal Amount (\$): " principal

# Validate principal input
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Principal must be a valid positive number."
    exit 1
fi

# Prompt user for rate of interest
read -p "Enter the Rate of Interest (% per annum): " rate

# Validate rate input
if ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Rate must be a valid positive number."
    exit 1
fi

# Prompt user for time period
read -p "Enter the Time Period (in years): " time

# Validate time input
if ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Time must be a valid positive number."
    exit 1
fi

echo ""
echo "=========================================="

# Calculate simple interest using the formula: SI = (P * R * T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate amount (Principal + Simple Interest)
amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo "Calculation Results:"
echo "=========================================="
echo "Principal Amount:    \$$principal"
echo "Rate of Interest:    $rate% per annum"
echo "Time Period:         $time years"
echo "=========================================="
echo "Simple Interest:     \$$simple_interest"
echo "Total Amount:        \$$amount"
echo "=========================================="
echo ""
