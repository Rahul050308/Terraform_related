# Terraform Workspaces

Terraform workspaces allow you to manage multiple states within a single configuration. This is useful for handling different environments (e.g., `dev`, `staging`, `prod`).

## Workspace Commands

### List Workspaces

```sh
terraform workspace list
```

Displays all available workspaces, highlighting the current workspace with an asterisk (`*`).

### Show Current Workspace

```sh
terraform workspace show
```

Prints the name of the currently active workspace.

### Create a New Workspace

```sh
terraform workspace new <workspace_name>
```

Creates and switches to a new workspace.

### Switch to an Existing Workspace

```sh
terraform workspace select <workspace_name>
```

Switches to an already created workspace.

### Delete a Workspace

```sh
terraform workspace delete <workspace_name>
```

Deletes the specified workspace (cannot delete the currently active workspace).

## Example Usage

```sh
terraform workspace new dev
terraform workspace select dev
terraform workspace list
terraform apply
```

## Notes

- Workspaces are mainly used for managing different environments.
- Some backends (e.g., `S3`, `Consul`) handle workspaces differently.

## License

This project is open-source and available under the MIT License.

