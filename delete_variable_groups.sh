#!/bin/bash

# Define the input JSON file
INPUT_FILE="repo_groups.json"

# Organisation and project details
ORG_URL="https://dev.azure.com/quadcorpslimited"
PROJECT="CSM"

# Read the JSON file and process each entry
jq -c '.[]' "$INPUT_FILE" | while read -r entry; do
  # Extract repo name and group ID
  REPO_NAME=$(echo "$entry" | jq -r '.repoName')
  GROUP_ID=$(echo "$entry" | jq -r '.groupId')

  # Print the repo name and group ID (for logging purposes)
  echo "Deleting variable group for repo: $REPO_NAME (Group ID: $GROUP_ID)"

  # Execute the Azure CLI command to delete the variable group
  az pipelines variable-group delete \
    --group-id "$GROUP_ID" \
    --org "$ORG_URL" \
    --project "$PROJECT" \
    --yes
done
