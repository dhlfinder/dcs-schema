#!/usr/bin/env bash

# Script to validate files contained in an sftp server against a given schema

# Author: Andres D. Pena
# Created 2023-11-22

# Root directory containing the logs generated from the schema validation
root_dir="schema_validation"

# Directory in which the imported files should be located.
files_dir="$root_dir/sftp_dump"

################
# File caching #
################

# Function to connect to an sftp server using an SSH configuration file and copy its files to a local directory.
function copy_files_from_sftp() {
    mkdir -p $files_dir
    scp -o "StrictHostKeyChecking no" -i "$1" -P 22 -r peCPSFmaster@edisaf.deutschepost.de:/peCPSF1* ./"$files_dir" || true
    scp -o "StrictHostKeyChecking no" -i "$1" -P 22 -r peCPSFmaster@edisaf.deutschepost.de:/peCPSF2* ./"$files_dir" || true
}

# Function to copy the desired xsd schema to a local directory
function copy_schema_to_local() {
  local schema_path
  schema_path="src/main/resources"

  if [ -d "$schema_path" ]; then
    import_schema=$(find "$schema_path" -type f -name "*Import schema.xsd")
    cp "$import_schema" "$root_dir"
  fi
}

###################
# Data Validation #
###################

# Function that triggers the validation mechanism of the downloaded files against a schema.
function validate_schema() {
  mkdir -p $root_dir/logs
  local current_date_only current_date log_file

  current_date_only=$(date +%Y%m%d)
  current_date=$(date +"%Y-%m-%d %T")
  log_file="$root_dir/logs/import-validation.log"

  ## Iterate through given directory, unzip files und validate using xmllint
  find "$files_dir" -type f | while read -r file; do
    parent_dir=$(dirname "$file")
    file_name=$(basename "$file")
    file_name="${file_name%.*}"
    if [[ $file == *psfimport* ]]; then
      gzip -d "$file"
      echo -n "$current_date | " >> "$log_file" &&
      xmllint --noout --schema "$1" "$parent_dir/$file_name" >> "$log_file" 2>&1
      echo >> "$log_file" # Redirect stderr to stdout (file)
    fi
  done
}

copy_files_from_sftp "$1"
copy_schema_to_local

if [[ -d "$files_dir" ]] && [[ -n $import_schema ]]; then
  validate_schema "$import_schema"
  rm -r "$files_dir"
fi











