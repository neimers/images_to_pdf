from cx_Freeze import setup, Executable

# use cx_freeze to make a windows executable suitable for deployment

build_exe_options = { "excludes": ["tkinter", "PyQt4", "PyQt5"]
                        }

setup(name = "ImageToPdfTool" ,
      version = "0.1" ,
      description = "" ,
      options = {"build_exe": build_exe_options},
      executables = [Executable("images_to_pdf.py")])
