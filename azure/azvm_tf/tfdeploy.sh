#!/bin/bash

# Apply Terraform configuration
terraform apply -auto-approve

# Output the SSH private key to a text file
terraform output -raw ssh_private_key > ~/.ssh/azkey

echo "SSH private key has been saved to ssh_private_key.txt"
