 #!/bin/bash

# Rotate SSH keys periodically
old_key_path="/path/to/old_key"
new_key_path="/path/to/new_key"

# Generate new SSH key
ssh-keygen -t rsa -b 4096 -f $new_key_path -N ""

# Replace old key with new key
sed -i "s/$(cat $old_key_path.pub)/$(cat $new_key_path.pub)/g" ~/.ssh/authorized_keys

# Remove old keys
rm $old_key_path*
