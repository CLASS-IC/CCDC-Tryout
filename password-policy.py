import subprocess

def enforce_password_policy():
    try:
        # Modify PAM configuration for strong passwords
        subprocess.run(['sudo', 'sed', '-i', 's/password\trequisite\t\tpam_cracklib.so/password\trequisite\t\tpam_cracklib.so minlen=12 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1/', '/etc/pam.d/common-password'])
        print("Password policy enforced successfully.")
    except Exception as e:
        print("Failed to enforce password policy:", str(e))

if __name__ == "__main__":
    enforce_password_policy()
