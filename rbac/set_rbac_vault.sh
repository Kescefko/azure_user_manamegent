#!/bin/bash

read -p "Enter Subscription ID: " subscription_id
read -p "Enter Resource Group Name: " resource_group_name
read -p "Enter Key Vault Name: " keyvault_name
read -p "Enter User Object ID: " object_id
read -p "Enter Role (e.g., Key Vault Administrator, Key Vault Secrets User): " role

# set context
az account set -s $subscription_id

# Grant the specified role to the user
az role assignment create \
    --role "$role" \
    --scope "subscriptions/${subscription_id}/resourceGroups/${resource_group_name}/providers/Microsoft.KeyVault/vaults/${keyvault_name}" \
    --assignee-object-id "${object_id}"