import os
import shutil
import Tkinter as tkinter
import tkFileDialog

def organize_files(folder_path):
    for root, _, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            file_extension = os.path.splitext(file)[1].lstrip(".")
            destination_folder = os.path.join(folder_path, file_extension)

            if not os.path.exists(destination_folder):
                os.makedirs(destination_folder)

            shutil.move(file_path, os.path.join(destination_folder, file))

def main():
    root = tkinter.Tk()
    root.withdraw()
    folder_path = tkFileDialog.askdirectory(title="Select folder")
    if folder_path:
        organize_files(folder_path)

if __name__ == "__main__":
    main()
