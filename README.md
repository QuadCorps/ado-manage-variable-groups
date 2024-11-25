# Manage ADO Variable Groups

## Generate variable group listing
Running the script `generate_repo_groups.sh`  lists the variable groups for a specific ADO org and project and outputs
the repo name and ID to `repo_groups.json`.


## Delete variable groups
Running the script `delete_variable_groups.sh` take the output from `repo_groups.json` and deletes each group in turn.

> [!CAUTION]
> _Be sure to edit `repo_groups.json` so that you only delete the groups you intend to._



