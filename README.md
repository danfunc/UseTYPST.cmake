
# UseTYPST.cmake

This CMake module provides functions to integrate Typst document compilation into your CMake build process.

## Functions

### `add_typst_document`

This function adds a custom target to compile a Typst document into a PDF.

#### Usage

```cmake
add_typst_document(DOC_NAME ROOT_TYP_DOCUMENT)
```

- `DOC_NAME`: The name of the custom target.
- `ROOT_TYP_DOCUMENT`: The path to the root Typst document.

#### Example

```cmake
add_typst_document(my_document doc.typ)
```

This will create a custom target `my_document` that compiles `doc.typ` into `my_document.pdf`.

## Options

### `USETYPST_DEFAULT_ALL_TARGET`

This option controls whether the Typst document targets are added to the `ALL` target.

- Default: `OFF`

#### Usage

```cmake
option(USETYPST_DEFAULT_ALL_TARGET OFF)
```

## Example CMakeLists.txt

Here is an example of how to use UseTYPST.cmake in your CMakeLists.txt:

```cmake
cmake_minimum_required(VERSION 3.20)
project(UseTYPST)
include(UseTYPST.cmake)
add_typst_document(example example.typ)
add_subdirectory(subdir)
add_subdirectory(SampleProject)
```

## Project Structure

The project has the following structure:

```
UseTYPST.cmake/
├── CMakeLists.txt
├── UseTYPST.cmake
├── example.typ
├── subdir/
│   ├── CMakeLists.txt
│   └── subdir_example.typ
└── SampleProject/
    ├── CMakeLists.txt
    ├── doc.typ
    ├── main.cpp
    ├── main.hpp
    └── UseTYPST.cmake
```

## Error Messages

- `Can not find root document file ${ROOT_TYP_DOCUMENT}`: The specified root Typst document does not exist.
- `typst_document must have only a root *.typ file.`: The `add_typst_document` function must be called with exactly two arguments.

## License

This project is licensed under the MIT License.

---

# UseTYPST.cmake

このCMakeモジュールは、TypstドキュメントのコンパイルをCMakeビルドプロセスに統合するための関数を提供します。

## 関数

### `add_typst_document`

この関数は、TypstドキュメントをPDFにコンパイルするカスタムターゲットを追加します。

#### 使用方法

```cmake
add_typst_document(DOC_NAME ROOT_TYP_DOCUMENT)
```

- `DOC_NAME`: カスタムターゲットの名前。
- `ROOT_TYP_DOCUMENT`: ルートTypstドキュメントのパス。

#### 例

```cmake
add_typst_document(my_document doc.typ)
```

これにより、`doc.typ`を`my_document.pdf`にコンパイルするカスタムターゲット`my_document`が作成されます。

## オプション

### `USETYPST_DEFAULT_ALL_TARGET`

このオプションは、Typstドキュメントターゲットが`ALL`ターゲットに追加されるかどうかを制御します。

- デフォルト: `OFF`

#### 使用方法

```cmake
option(USETYPST_DEFAULT_ALL_TARGET OFF)
```

## 例 CMakeLists.txt

以下は、`UseTYPST.cmake`を`CMakeLists.txt`で使用する例です：

```cmake
cmake_minimum_required(VERSION 3.20)
project(UseTYPST)
include(UseTYPST.cmake)
add_typst_document(example example.typ)
add_subdirectory(subdir)
add_subdirectory(SampleProject)
```

## プロジェクト構造

プロジェクトは以下の構造を持っています：

```
UseTYPST.cmake/
├── CMakeLists.txt
├── UseTYPST.cmake
├── example.typ
├── subdir/
│   ├── CMakeLists.txt
│   └── subdir_example.typ
└── SampleProject/
    ├── CMakeLists.txt
    ├── doc.typ
    ├── main.cpp
    ├── main.hpp
    └── UseTYPST.cmake
```

## エラーメッセージ

- `Can not find root document file ${ROOT_TYP_DOCUMENT}`: 指定されたルートTypstドキュメントが存在しません。
- `typst_document must have only a root *.typ file.`: `add_typst_document`関数は正確に2つの引数で呼び出される必要があります。

## ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。

