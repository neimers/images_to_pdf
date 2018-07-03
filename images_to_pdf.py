import img2pdf
import sys
import fitz
import os

if len(sys.argv) > 1:

    output_path = sys.argv[1]
    input_files = sys.argv[2::]
    
    with open(output_path, "wb") as f:
        f.write(img2pdf.convert(input_files))                       

    # try to do table of contents
    toc = []
    page_num = 1
    for file_path in sys.argv[2::]:

        file_name = os.path.splitext(os.path.basename(file_path))[0] # take without extension
        
        toc.append([1, file_name, page_num])
        page_num += 1

    doc = fitz.open(output_path)
    doc.setToC(toc)
    doc.save(doc.name, incremental=True)
