import os
import shutil

def sort_downloads(downloads_folder):
    # List all files and directories in the downloads folder
    for item in os.listdir(downloads_folder):
        item_path = os.path.join(downloads_folder, item)
        
        # Skip directories
        if os.path.isdir(item_path):
            continue
        
        # Get the file extension
        file_extension = os.path.splitext(item)[1].lower().strip(".")
        if not file_extension:
            file_extension = "unknown"  # For files without extensions
        
        # Create a folder for the file extension
        target_folder = os.path.join(downloads_folder, file_extension)
        os.makedirs(target_folder, exist_ok=True)
        
        # Move the file to the respective folder
        shutil.move(item_path, os.path.join(target_folder, item))

if __name__ == "__main__":
    downloads_folder = os.path.expanduser("~/Downloads")  # Adjust if your downloads folder is elsewhere
    sort_downloads(downloads_folder)
    print("Files sorted by file type.")
