# UseTYPST.cmake

This CMake module provides functions to integrate Typst document compilation into your CMake build process.

## Functions

### `add_typst_document`

This function adds a custom target to compile a Typst document into a PDF.

#### Usage

```cmake
add_typst_document(DOC_NAME ROOT_TYP_DOCUMENT)