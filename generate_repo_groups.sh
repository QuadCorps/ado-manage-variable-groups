#!/bin/bash

# Define variables
ORG_URL="https://dev.azure.com/<yourorgname>"
PROJECT="<your_project_name>"
OUTPUT_FILE="repo_groups.json"

# Run Azure CLI command to get variable groups
echo "Fetching variable groups from Azure DevOps..."
az pipelines variable-group list --org "$ORG_URL" --project "$PROJECT" --query '[].{repoName: name, groupId: id}' > "$OUTPUT_FILE"

# Inform the user
if [[ $? -eq 0 ]]; then
  echo "The list has been saved to $OUTPUT_FILE"
else
  echo "Failed to fetch variable groups. Please check your Azure CLI configuration."
fi
