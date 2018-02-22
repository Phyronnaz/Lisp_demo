project(lisp)

include_directories(core Object Parser toplevel)

set(SOURCE_FILES
        core/core.h
        core/Private/core.cpp
        core/Private/apply.h
        core/Private/apply.cpp
        core/Private/eval.cpp
        core/Private/subr.h
        core/Private/subr.cpp
        core/Private/environment.h
        core/Private/environment.cpp
        core/Private/set_q.cpp

        Object/object.h
        Object/Private/cell.h
        Object/Private/cell.cpp
        Object/Private/object.cpp

        Parser/read.h
        Parser/Private/lisp.tab.h
        Parser/Private/lisp.tab.cpp
        Parser/Private/lisp.yy.cpp
        Parser/Private/read.cpp

        toplevel/toplevel.h
        toplevel/Private/toplevel.cpp
        )

add_library(lisp ${SOURCE_FILES})