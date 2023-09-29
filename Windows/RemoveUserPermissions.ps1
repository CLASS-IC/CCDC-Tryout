# Removes User Permissions, then prompts for a new Root Pass. 

# Get the current username
$currentUsername = $env:USERNAME

# Get all user profiles on the system except the root profile
$userProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false -and $_.LocalPath -notmatch "C:\\Users\\$currentUsername" }

# Loop through each user profile and remove permissions
foreach ($profile in $userProfiles) {
    try {
        # Remove all permissions from the user profile folder
        $acl = Get-Acl $profile.LocalPath
        $acl.SetAccessRuleProtection($true, $false)
        Set-Acl -Path $profile.LocalPath -AclObject $acl

        # Log the action
        Write-Output "Removed all permissions from $($profile.LocalPath)"
    }
    catch {
        Write-Output "Failed to remove permissions from $($profile.LocalPath): $_"
    }
}

# Prompt the root profile to change the password
Read-Host -Prompt "Press Enter to change the password for $currentUsername"

# Code to change the root profile password can be added here
# For example, you can use net user command to change the password:
# net user $currentUsername *
