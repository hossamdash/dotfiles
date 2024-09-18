#!/bin/bash

# generate the necessary config
gcloud compute config-ssh

# Path to the SSH config file
SSH_CONFIG_FILE="$HOME/.ssh/config"

# Define the marker for the start and end of the Google Compute Engine section
START_MARKER="# Google Compute Engine Section"
END_MARKER="# End of Google Compute Engine Section"

# Flag to check if we are within the Google Compute Engine section
within_gce_section=false

# Temporary file to store the new SSH config
TEMP_FILE=$(mktemp)

# Process the SSH config file line by line
while IFS= read -r line; do
    # Check for the start and end markers
    if [[ "$line" == "$START_MARKER" ]]; then
        within_gce_section=true
    elif [[ "$line" == "$END_MARKER" ]]; then
        within_gce_section=false
    fi

    # If within the GCE section and this is a Host line, add the User ubuntu line
    if $within_gce_section && [[ "$line" =~ ^Host\ .* ]]; then
        echo "$line" >> "$TEMP_FILE"
        echo "    User ubuntu" >> "$TEMP_FILE"
    else
        echo "$line" >> "$TEMP_FILE"
    fi
done < "$SSH_CONFIG_FILE"

# Move the temporary file to replace the original SSH config file
mv "$TEMP_FILE" "$SSH_CONFIG_FILE"

echo "User ubuntu has been added to all hosts in the Google Compute Engine section."
