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
      set_property(TARGET ${DOC_NAME} PROPERTY USETYPST_ROOT_DOC ${CMAKE_CURRENT_SOURCE_DIR}/${ROOT_TYP_DOCUMENT})
      set_property(TARGET ${DOC_NAME} PROPERTY USETYPST_PDF_PATH ${CMAKE_CURRENT_BINARY_DIR}/${DOC_NAME}.pdf)
      set_property(TARGET ${DOC_NAME} PROPERTY USETYPST_DEPENDS ${ROOT_TYP_DOCUMENT})
    else()
      message(SEND_ERROR "Can not find root document file ${ROOT_TYP_DOCUMENT}")
    endif()
  else()
    message(SEND_ERROR "typst_document must have only a root *.typ file.")
  endif()
endfunction()

function(typst_document_sources DOC_NAME)
  list(REMOVE_DUPLICATES ARGV)
  list(REMOVE_AT ARGV 0)
  foreach(iterator IN LISTS ARGV)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${iterator})
      get_property(
        current_depends
        TARGET ${DOC_NAME}
        PROPERTY USETYPST_DEPENDS)
      set(next_depends ${current_depends} ${CMAKE_CURRENT_SOURCE_DIR}/${iterator})
      set_property(TARGET ${DOC_NAME} PROPERTY USETYPST_DEPENDS ${next_depends})
    else()
      message(SEND_ERROR "Can not find root document file ${iterator}")
    endif()
  endforeach()
endfunction()
