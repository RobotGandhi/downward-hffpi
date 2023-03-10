# Find the DLPlan package. This includes the libraries and include
# files.
#
# This code defines the following variables:
#
#  DLPLAN_FOUND          - TRUE if all components are found.
#  DLPLAN_INCLUDE_DIRS   - Full paths to all include dirs.
#  DLPLAN_LIBRARIES      - Full paths to all libraries.
#
# Example Usages:
#  find_package(DLPLAN)
#
# The location of DLPLAN can be specified using the environment variable
# or cmake parameter PATH_DLPLAN. If different installations
# are available, they can be specified with
#   PATH_DLPLAN
#   PATH_DLPLAN_RELEASE
#   PATH_DLPLAN_DEBUG
# More specific paths are preferred over less specific ones.
#
# Note that the standard FIND_PACKAGE features are supported
# (QUIET, REQUIRED, etc.).

#set(DLPLAN_SUPPRESS_WARNINGS "FLAG_SUPPRESS_WARNINGS")

foreach(BUILDMODE "RELEASE" "DEBUG")
    set(DLPLAN_HINT_PATHS_${BUILDMODE}
        ${PATH_DLPLAN_${BUILDMODE}}
        #$ENV{PATH_DLPLAN_${BUILDMODE}}
        #${PATH_DLPLAN}
        #$ENV{PATH_DLPLAN}
    )
endforeach()

find_path(DLPLAN_INCLUDE_DIRS
    NAMES dlplan
    HINTS ${DLPLAN_HINT_PATHS_RELEASE} ${DLPLAN_HINT_PATHS_DEBUG}
    PATH_SUFFIXES include
)

find_library(DLPLAN_GENERATOR_LIBRARY_RELEASE
    NAMES dlplangenerator
    HINTS ${DLPLAN_HINT_PATHS_RELEASE}
    PATH_SUFFIXES lib/dlplan
)

find_library(DLPLAN_GENERATOR_LIBRARY_DEBUG
        NAMES dlplangenerator
        HINTS ${DLPLAN_HINT_PATHS_RELEASE}
        PATH_SUFFIXES lib/dlplan
)

find_library(DLPLAN_CORE_LIBRARY_RELEASE
        NAMES dlplancore
        HINTS ${DLPLAN_HINT_PATHS_RELEASE}
        PATH_SUFFIXES lib/dlplan
        )

find_library(DLPLAN_CORE_LIBRARY_DEBUG
        NAMES dlplancore
        HINTS ${DLPLAN_HINT_PATHS_RELEASE}
        PATH_SUFFIXES lib/dlplan
        )


set(DLPLAN_LIBRARIES
    optimized ${DLPLAN_GENERATOR_LIBRARY_RELEASE}
    optimized ${DLPLAN_CORE_LIBRARY_RELEASE}
    debug ${DLPLAN_GENERATOR_LIBRARY_DEBUG}
    debug ${DLPLAN_CORE_LIBRARY_DEBUG})


# Check for consistency and handle arguments like QUIET, REQUIRED, etc.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    DLPLAN
    REQUIRED_VARS DLPLAN_INCLUDE_DIRS DLPLAN_LIBRARIES
)

# Do not show internal variables in cmake GUIs like ccmake.
mark_as_advanced(DLPLAN_INCLUDE_DIRS
                 DLPLAN_LIBRARY_RELEASE DLPLAN_LIBRARY_DEBUG
                 DLPLAN_LIBRARIES
                 DLPLAN_HINT_PATHS_RELEASE DLPLAN_HINT_PATHS_DEBUG)


