del /q "build\*"
FOR /D %%p IN ("build\*.*") DO rmdir "%%p" /s /q

python setup.py build

if not exist "build\exe.win-amd64-3.6\sample\" mkdir build\exe.win-amd64-3.6\sample

robocopy /MIR "D:\Python\Image 2 PDF\sample" "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\sample"

robocopy "D:\Python\Image 2 PDF" "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6" license.txt

MKDIR "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\source"
MKDIR "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\source\dependencies"

robocopy "D:\Python\Image 2 PDF" "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\source" images_to_pdf.py
robocopy "D:\Python\Image 2 PDF" "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\source" setup.py

robocopy /MIR "D:\Python\Image 2 PDF\dependency_source" "D:\Python\Image 2 PDF\build\exe.win-amd64-3.6\source\dependencies"

pause