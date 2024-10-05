echo "Creating symbolic links..."
# Read symlinks from the file and create them
while IFS= read -r symlink || [[ -n "$symlink" ]]; do
    # Execute the symlink command
    eval "$symlink"
done < symlinks.txt
echo "Symbolic links created."
