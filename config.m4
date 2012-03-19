
dnl FUNCTIONS ------------------------------------------------------------------
AC_DEFUN([PHP_MUSTACHE_ADD_SOURCES], [
  PHP_MUSTACHE_SOURCES="$PHP_MUSTACHE_SOURCES $1"
])

dnl MUSTACHE -------------------------------------------------------------------
PHP_ARG_ENABLE(mustache, whether to enable mustache support,
dnl Make sure that the comment is aligned:
[ --enable-mustache Enable mustache support])

dnl TCMALLOC -------------------------------------------------------------------
AC_MSG_CHECKING(whether tcmalloc support is present and requested)
AC_ARG_ENABLE(mustache-tcmalloc,
[  --enable-mustache-tcmalloc     Enable mustache tcmalloc], 
[
  PHP_MUSTACHE_TCMALLOC=$enableval
  AC_MSG_RESULT($enableval)
], 
[
  PHP_MUSTACHE_TCMALLOC=no
  AC_MSG_RESULT(no)
])

if test "$PHP_MUSTACHE_TCMALLOC" == "yes"; then
  PHP_ADD_LIBRARY(tcmalloc, 1, MUSTACHE_SHARED_LIBADD)
  AC_DEFINE(HAVE_TCMALLOC, 1, [Whether tcmalloc support is present and requested])
fi

dnl MAIN -----------------------------------------------------------------------
if test "$PHP_MUSTACHE" != "no"; then

  PHP_MUSTACHE_ADD_SOURCES([
    php_mustache.cpp
    mustache_mustache.cpp
    mustache_data.cpp
    mustache_template.cpp
    mustache/mustache.cpp
    mustache/data.cpp
    mustache/node.cpp
    mustache/renderer.cpp
    mustache/tokenizer.cpp
    mustache/utils.cpp
  ])
  
  AC_DEFINE(HAVE_MUSTACHE, 1, [Whether you have mustache support]) 
  PHP_REQUIRE_CXX()
  
  PHP_ADD_INCLUDE(mustache)
  PHP_ADD_BUILD_DIR(mustache)

  PHP_ADD_LIBRARY(stdc++, 1, MUSTACHE_SHARED_LIBADD)
  PHP_SUBST(MUSTACHE_SHARED_LIBADD)
  PHP_NEW_EXTENSION(mustache, $PHP_MUSTACHE_SOURCES, $ext_shared)
fi
