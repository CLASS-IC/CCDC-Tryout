import os
import subprocess

def fix_file_permissions():
    try:
        # Correct permissions for sensitive files and directories
        subprocess.run(['sudo', 'chmod', '700', '/etc/shadow'])
        subprocess.run(['sudo', 'chmod', '700', '/etc/gshadow'])
        subprocess.run(['sudo', 'chmod', '700', '/etc/passwd'])
        subprocess.run(['sudo', 'chmod', '600', '/etc/sudoers'])
        print("File permissions fixed successfully.")
    except Exception as e:
        print("Failed to fix file permissions:", str(e))

if __name__ == "__main__":
    fix_file_permissions()
