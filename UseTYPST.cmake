option(USETYPST_DEFAULT_ALL_TARGET OFF)
function(add_typst_document DOC_NAME ROOT_TYP_DOCUMENT)

  if(${USETYPST_DEFAULT_ALL_TARGET})

    add_custom_target(${DOC_NAME} ALL SOURCES ${DOC_NAME}.pdf)
  else()

    add_custom_target(${DOC_NAME} SOURCES ${DOC_NAME}.pdf)
  endif()

  if(ARGC EQUAL 2)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${ROOT_TYP_DOCUMENT})
      add_custom_command(
        OUTPUT ${DOC_NAME}.pdf
        COMMAND typst compile ${CMAKE_CURRENT_SOURCE_DIR}/${ROOT_TYP_DOCUMENT} ${CMAKE_CURRENT_BINARY_DIR}/${DOC_NAME}.pdf --make-deps ${CMAKE_CURRENT_BINARY_DIR}/${DOC_NAME}.d
        DEPFILE ${CMAKE_CURRENT_BINARY_DIR}/${DOC_NAME}.d)
    else()
      message(SEND_ERROR "Can not find root document file ${ROOT_TYP_DOCUMENT}")
    endif()
  else()
    message(SEND_ERROR "typst_document must have only a root *.typ file.")
  endif()
endfunction()
