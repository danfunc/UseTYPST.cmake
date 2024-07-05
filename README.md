# What is UseTYPST.cmake?
UseTYPST.cmake is cmake extension to use typst  like UseLATEX.cmake.
# How to use?


You should include UseTYPST.cmake!!!


You can make pdf document from typst files with only one command like add_executable(). You use add_typst_document(${DOCUMENT_NAME} ${ROOT_typst_file}) to make it. If you want to add extra typst file, you can use typst_document_sources(${DOCUMENT_NAME} ${ADDITIONAL_FILES} ...) to make a document to detect changed ADDITIONAL_FILES then build.
./CMakeLists.txt, ./example.typ, ./subdir/CMakeLists.txt, and ./subdir/subdir_example.typ is to make example document. Read them!

Enjoy typst with cmake!
