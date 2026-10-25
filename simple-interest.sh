#!/bin/bash
# Simple Interest Calculator
# This script computes simple interest based on user input.
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "=== Simple Interest Calculator ==="
echo ""

# Prompt the user for input fields
read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (in %): " rate
read -p "Enter the time period (in years): " time

# Validate that inputs are numeric
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Principal must be a valid number."
    exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Rate of interest must be a valid number."
    exit 1
fi

if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Time period must be a valid number."
    exit 1
fi

# Compute simple interest
# Simple Interest = (Principal * Rate * Time) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Compute total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "=== Results ==="
echo "Principal amount:      $principal"
echo "Rate of interest:      $rate%"
echo "Time period:           $time years"
echo "Simple Interest:       $simple_interest"
echo "Total Amount:          $total_amount"
echo ""

exit 0
