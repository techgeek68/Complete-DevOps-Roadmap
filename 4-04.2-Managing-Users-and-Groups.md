# 3. Managing Users and Groups

Managing users and groups is a core responsibility for DevOps engineers, ensuring secure, organized, and automated access across systems. Below are key concepts, explanations, and command examples (in individual code blocks for easy copy/paste).

---

## **1. Creating, Modifying, and Deleting Groups**

### **Primary Group**
- Each user has one primary group, set with `useradd -g` or automatically.
- Primary group GID is shown in `/etc/passwd`:
  ```
  alice:x:1001:100:Alice:/home/alice:/bin/bash
  ```
  *100 is the GID of the primary group for alice.*

### **Secondary Group**
- Assigned with `useradd -G` or `usermod -aG`.
- Listed in `/etc/group`.
- You can also edit group membership directly:
  ```
  vim /etc/group
  ```

### **Create a Group**

```
groupadd developer
```
```
groupadd operation
```
```
groupadd javadev
```
```
groupadd phpdev
```
```
groupadd -g 1009 admin
```

### **View Groups Information**

```
cat /etc/group
```

*Format: `<groupname>:x:<GID>:<members>`*

### **Modify a Group**

```
groupadd admin
```
```
groupmod -n administration admin
```
*(Renames 'admin' to 'administration')*

### **Delete a Group**

```
groupdel admin
```

---

## **2. Creating, Modifying, and Deleting Users**

### **Create a User**

```
useradd harry
```
```
cat /etc/passwd | grep harry
```
*Format: `<username>:x:<UID>:<GID>:<Comment>:<home_directory>:<shell>`*

### **Check User Groups**

```
groups harry
```

### **Create User with Primary and Secondary Groups**

```
useradd -g developer -G operation david
```
```
groups david
```
*developer = primary group, operation = secondary group*

### **Create User with Home Directory, Shell, and Secondary Group**

```
useradd -m -s /bin/bash -G wheel thomas
```
```
passwd thomas
```
```
su – thomas
```
```
sudo useradd natasha
```

---

### **Set or Change User Password**

```
passwd thomas
```
```
su – thomas
```
```
exit
```
```
passwd -l thomas
```
*(Lock thomas’s account)*
```
su – thomas
```
*(Should be denied)*
```
passwd -u thomas
```
*(Unlock thomas’s account)*
```
su – thomas
```

---

### **Modify an Existing User**

```
cat /etc/group | grep thomas
```
```
usermod -a -G operation thomas
```
```
cat /etc/group | grep thomas
```
```
usermod -g phpdev -G staff javadev thomas
```
```
groups thomas
```

---

### **Delete a User**

```
useradd david
```
```
useradd shyam
```
```
userdel shyam
```
```
userdel -r david
```
*(Removes home and mail spool)*

```
cat /etc/passwd | grep shyam
```
```
cd /
```
```
cd home
```
```
ls
```

---

## **3. Managing Sudo Permissions**

### **Edit Sudoers File Safely**

```
visudo
```

*Key directives:*
```
%wheel ALL=(ALL) ALL
```
*(Allow group "wheel" full sudo)*

```
david ALL=(ALL) NOPASSWD: ALL
```
*(Allow user 'david' passwordless sudo)*

---

## **4. User Authentication & DevOps Workflows**

- **Centralized Authentication:**  
  - LDAP, OpenLDAP, Active Directory (winbind, SSSD), Kerberos

- **Pluggable Authentication Modules (PAM):**  
  - `/etc/pam.d/common-auth`, `common-password`, `common-session`
  - Configure 2FA, LDAP, password policies

- **Automation Tools:**  
  - Ansible, Puppet, Chef, Terraform for user/group/cloud IAM management

*Example: Ansible user module for idempotent user creation:*
```yaml
- name: Ensure user exists
  ansible.builtin.user:
    name: devuser
    groups: developers
    password: "{{ vault_user_password }}"
```

- **Secrets Management:**  
  - HashiCorp Vault, AWS Secrets Manager, Azure Key Vault

- **Container & CI Integration:**  
  - Users in Dockerfile, Kubernetes RBAC, CI pipeline service accounts

---

## **5. Managing Permissions and Ownership**

### **Changing Ownership: chown**

```
touch htmlfile
```
```
mkdir htmldir
```
```
ls -l htmlfile
```
```
ls -ld htmldir
```
```
chown david:developer htmlfile
```
```
chown harry htmldir
```
```
chown -R harry htmldir
```
```
ls -l htmlfile
```
```
ls -ld htmldir
```

---

### **Changing Permissions: chmod**

#### **Ownership Classes**
- User (u): Owner
- Group (g): Group
- Others (o): Everyone else

#### **Permission Types**
| Type    | Symbol | Numeric |
|---------|--------|---------|
| Read    | r      | 4       |
| Write   | w      | 2       |
| Execute | x      | 1       |
| Full    | rwx    | 7       |
| None    | -      | 0       |

#### **Examples**

```
touch permissionfile
```
```
mkdir permissiondir
```
```
ls -l
```
```
ls -l permissionfile
```
```
ls -ld permissiondir
```

#### **Symbolic Notation**

```
chmod u+rwx file_name
```
```
chmod g-w file_name
```
```
chmod a=rw file_name
```
```
chmod u=rx, g= permissiondir
```
```
ls -ld permissiondir
```
```
cd permissiondir
```
```
touch file
```
```
chmod u=rwx, g=rx,o= permissiondir
```
```
ls -ld permissiondir
```
```
cd permissiondir
```
```
touch file
```
```
chmod u=rx, g= permfile
```
```
ls -l permfile
```
```
vim permfile
```
*(Try editing file to test permissions)*

#### **Octal Notation**

```
chmod 500 permissiondir
```
```
ls -ld permissiondir
```
```
cd permissiondir
```
```
touch file
```
```
chmod 750 permissiondir
```
```
ls -ld permissiondir
```
```
cd permissiondir
```
```
touch file
```

---

### **Changing Group Ownership: chgrp**

```
chgrp admins file
```
```
chgrp team shared_dir/
```

---

## **6. umask, Sticky Bit, and Special Permissions**

### **umask**

```
umask 022
```
*(Default: directories get 755, files get 644)*

*Set permanently:*
```
vim ~/.bashrc
```
*(or)*
```
vim /etc/profile
```

---

### **Sticky Bit**

```
mkdir stickytest
```
```
chmod +t directory_name
```
```
chmod 1777 directory_name
```
```
chmod +t /shared_tmp
```

---

### **Special Permissions**

#### **Setuid**

```
chmod u+s file_name
```
```
chmod 4755 file_name
```

#### **Setgid**

```
chmod g+s directory
```
```
chmod 2770 directory
```

---

## **7. Access Control Lists (ACLs)**

ACLs provide fine-grained permissions beyond the traditional user/group/other model.

### **View ACLs**

```
getfacl file
```

### **Modify ACLs**

```
setfacl -m u:david:rwx file
```
```
setfacl -m g:developer:r-- file
```
```
setfacl -x u:david file
```

### **Default ACLs for Directories**

```
setfacl -d -m u:david:rwx dir/
```

*Note: Filesystem must be mounted with acl support.*

---

## **Additional Knowledge**

- **Best Practices**: Always use a root account for these operations in test environments; use sudo in production.
- **Automation**: Use configuration management tools (Ansible, Puppet, Chef) for repeatable user/group/permission management.
- **Security**: Audit `/etc/passwd`, `/etc/group`, and `/etc/sudoers` regularly. Lock unused accounts and enforce password policies.
- **More Examples**: For container workflows, define users in Dockerfiles:
  ```
  USER appuser
  ```
  Or manage service accounts in Kubernetes:
  ```
  kubectl create serviceaccount buildbot
  ```
