#!/bin/bash

# Define the folder path
folder_path="themes/aaj-theme"
theme_name="aaj-theme"
providers_dir="providers"

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Error: $folder_path does not exist."
  exit 1
fi

# Check if the providers directory exists, if not, create it
if [ ! -d "$providers_dir" ]; then
  mkdir "$providers_dir"
fi

# Prompt for the JAR file name or use a default name
read -p "Enter the theme name (default: $theme_name): " jar_name

# Use the default name if no input provided
jar_name=${jar_name:-$theme_name}

# Add the .jar extension if not already present
if [[ $jar_name != *".jar" ]]; then
  jar_name="$jar_name.jar"
fi

# Create a temporary directory for JAR packaging
temp_dir=$(mktemp -d)

# Copy the contents of the folder to the temporary directory
cp -R "$folder_path"/* "$temp_dir"

# Create the JAR file inside the providers directory
jar cf "$providers_dir/$jar_name" -C "$temp_dir" .

# Cleanup the temporary directory
rm -rf "$temp_dir"

echo "Theme created: $providers_dir/$jar_name"
