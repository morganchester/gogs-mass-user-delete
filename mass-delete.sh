#!/bin/bash

USERFILE="users"
GOGS_CLI="./gogs"

if [ ! -f "$USERFILE" ]; then
  echo "File $USERFILE not found"
  exit 1
fi

while IFS= read -r USERNAME || [ -n "$USERNAME" ]; do
  if [ -z "$USERNAME" ]; then
    continue
  fi

  echo "🔍 Now working on user: $USERNAME"

  REPOS=$($GOGS_CLI list-user-repos "$USERNAME")
  if [ $? -ne 0 ]; then
    echo "  ⚠️ Can't get repos of $USERNAME"
    continue
  fi

  if [ -z "$REPOS" ]; then
    echo "  ℹ️ No repos found for $USERNAME"
  else
    echo "$REPOS" | while read -r REPO_ID; do
      echo "  🗑 Removing repo ID: $REPO_ID"
      $GOGS_CLI delete-repo "$USERNAME" "$REPO_ID"
    done
  fi

  echo "  🚷 Removing user: $USERNAME"
  $GOGS_CLI delete-user "$USERNAME"

  echo "✅ User $USERNAME deleted"
  echo
done < "$USERFILE"
