#!/bin/bash

# Apply Terraform configuration
terraform apply -auto-approve

# Output the SSH private key to a text file
terraform output -raw private_key_data > ~/.ssh/azkey
echo "SSH private key has been saved to ~/.ssh/azkey"