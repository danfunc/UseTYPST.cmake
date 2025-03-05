## Purpose

This tool aims to integrate Typst documents into a CMake project, making it easier to manage documentation alongside the source code. By leveraging CMake or other build systems (such as Makefiles and Cargo), we can automate the Typst document build process, reducing the burden on developers.

## Sample Project Structures

We propose a clear project structure that organizes Typst documents and related source code coherently. For example:

```
MyProject/
├── CMakeLists.txt
├── doc.typ 
├── main.cpp
├── main.hpp
└── UseTYPST.cmake (if it is the root directory)
```

A 'Sample Project' can be found [here](https://github.com/danfunc/UseTYPST.cmake/tree/main/SampleProject)

## Build Process Integration

To automate the Typst document build process, we propose using CMake with a custom module (`UseTYPST.cmake`). This module provides functions to add Typst document targets to the build process.
The `UseTYPST.cmake` module can be found [here](https://github.com/danfunc/UseTYPST.cmake/blob/main/UseTYPST.cmake).
A 'Sample Project' is [here](https://github.com/danfunc/UseTYPST.cmake/tree/main/SampleProject)

## Example `CMakeLists.txt`

```cmake
cmake_minimum_required(VERSION 3.20)
project(MyProject)
include(UseTYPST.cmake)
add_typst_document(document doc.typ)
add_executable(main main.cpp)
```

## Usage Example

Here is an example of how to use the UseTYPST.cmake module in a CMake project:

```cmake
add_typst_document(my_document root.typ)
```

This will create a custom target `my_document` that compiles `root.typ` into a PDF named `my_document.pdf`.
