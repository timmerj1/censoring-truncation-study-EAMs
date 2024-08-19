#!/bin/bash

# Check if the user provided a directory as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/run_files"
    exit 1
fi

# Get the directory containing the R script files from the first argument
input_dir="$1"

# Define the output directory by replacing 'run_files' with 'out_files' in the input directory path
output_dir="${input_dir%/*}/out_files"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop over all files in the input directory
for file in "$input_dir"/*; do
    # Extract the base name of the file (without the directory path)
    base_name=$(basename "$file")

    # Remove the 'run' prefix and replace it with 'out'
    output_name="out${base_name#run}"

    # Define the output file path with .Rout extension
    output_file="$output_dir/${output_name}.Rout"

    # Run R CMD BATCH in the background with nohup, redirecting output
    nohup R CMD BATCH "$file" "$output_file" &
done
