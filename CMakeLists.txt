cmake_minimum_required(VERSION 3.10)
project(AutoRemesher)

set(CMAKE_CXX_STANDARD 11)

# Add -O, O2, O3, etc. for optimization
if (CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
else ()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Od")
endif ()

# Add NOMINMAX
add_definitions(-DNOMINMAX)
add_definitions(-D_USE_MATH_DEFINES)

set(CGAL_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1")
set(CGAL_INCLUDE_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1/include")
set(BOOST_INCLUDE_DIR "X:/Samolet/boost_1_66_0")
set(GMP_INCLUDE_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/include")
set(MPFR_INCLUDE_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/include")
set(GMP_LIB_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/lib")
set(MPFR_LIB_DIR "X:/Samolet/autoremesher/thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/lib")

# Include directories
include_directories(
        "thirdparty/libigl/include"
        "thirdparty/eigen"
        "thirdparty/openvdb/openvdb-7.0.0"
        "thirdparty/openexr/openexr-2.4.1"
        "thirdparty/geogram/geogram-1.7.5/src/lib"
        "thirdparty/geogram"
        "thirdparty/tbb/include"
        "X:/Samolet/boost_1_66_0"
        "thirdparty/cgal/CGAL-5.1-beta1/include"
        "thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/include"
        "include"
)

# Link directories
link_directories(
        "thirdparty/blosc/c-blosc-1.18.1/build/blosc/Release"
        "thirdparty/tbb/build/Release"
        "thirdparty/openvdb/openvdb-7.0.0/build/openvdb/Release"
        "thirdparty/openexr/openexr-2.4.1/build/IlmBase/Half/Release"
        "thirdparty/zlib/zlib-1.2.11/build/Release"
        "thirdparty/cgal/CGAL-5.1-beta1/"
        "thirdparty/cgal/CGAL-5.1-beta1/auxiliary/gmp/lib"
)

# Add the source files
set(SOURCE_FILES src/main.cpp)

set(HEADER_FILES ${HEADER_FILES} src/quadmeshgenerator.h)
set(SOURCE_FILES ${SOURCE_FILES} src/quadmeshgenerator.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/autoremesher.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/autoremesher.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/isotropicremesher.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/isotropicremesher.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/vdbremesher.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/vdbremesher.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/parameterizer.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/parameterizer.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/quadextractor.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/quadextractor.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/positionkey.h)
set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/positionkey.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/meshseparator.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/meshseparator.cpp)

set(HEADER_FILES ${HEADER_FILES} src/AutoRemesher/relativeheight.h)
set(SOURCE_FILES ${SOURCE_FILES} src/AutoRemesher/relativeheight.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/algorithm.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/algorithm.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/command_line.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/command_line.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/environment.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/environment.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/geometry.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/geometry_nd.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/geometry.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/packed_arrays.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/packed_arrays.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/progress.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/progress.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/assert.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/assert.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/command_line_args.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/command_line_args.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/factory.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/factory.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/line_stream.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/line_stream.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/process.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/process_private.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/process.cpp)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/process_unix.cpp)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/process_win.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/quaternion.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/quaternion.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/attributes.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/attributes.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/common.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/common.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/file_system.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/file_system.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/logger.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/logger.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/stopwatch.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/stopwatch.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/b_stream.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/b_stream.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/counted.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/counted.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/geofile.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/geofile.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/numeric.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/numeric.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/string.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/string.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/smart_pointer.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/android_wrapper.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/matrix.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/argused.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/memory.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/psm.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/thread_sync.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/atomics.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/vecg.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/permutation.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/basic/range.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_3d.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_3d.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_tetgen.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_tetgen.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/LFS.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/LFS.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/periodic.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/periodic.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_2d.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_2d.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_nn.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_nn.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_triangle.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/delaunay_triangle.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/parallel_delaunay_3d.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/parallel_delaunay_3d.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/periodic_delaunay_3d.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/periodic_delaunay_3d.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/delaunay/cavity.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/bibliography/bibliography.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/bibliography/bibliography.cpp)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/bibliography/embedded_references.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/parameterization/mesh_global_param.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/parameterization/mesh_global_param.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_AABB.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_AABB.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_frame_field.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_frame_field.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_fill_holes.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_fill_holes.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_geometry.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_geometry.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_halfedges.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_halfedges.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_io.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_io.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_topology.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_topology.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_partition.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_partition.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_preprocessing.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_preprocessing.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_reorder.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_reorder.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_repair.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh_repair.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/mesh/mesh.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/co3ne.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/co3ne.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/colocate.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/colocate.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/kd_tree.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/kd_tree.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/nn_search.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/nn_search.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/principal_axes.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/points/principal_axes.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/expansion_nt.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/expansion_nt.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/lbfgs_optimizers.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/lbfgs_optimizers.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/matrix_util.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/matrix_util.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/multi_precision.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/multi_precision.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/optimizer.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/optimizer.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/predicates.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/numerics/predicates.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_api.cpp)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_os.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_arpack.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_arpack.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_cholmod.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_cholmod.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_cuda.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_cuda.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_iterative_solvers.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_iterative_solvers.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_matrix.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_matrix.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_preconditioners.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_preconditioners.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_superlu.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_superlu.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_64.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_blas.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_blas.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_context.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_context.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_ext.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_linkage.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_mkl.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_mkl.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/NL/nl_private.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_library.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_library.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_stb.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_stb.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/morpho_math.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/morpho_math.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_rasterizer.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_rasterizer.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_pgm.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_pgm.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_xpm.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/image_serializer_xpm.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/color.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/colormap.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/image/colormap.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_vertex.h)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_utils.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/convex_cell.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/convex_cell.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_cell.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_cell.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_polygon.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/generic_RVD_polygon.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/integration_simplex.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/integration_simplex.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD_callback.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD_callback.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/CVT.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/CVT.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD_mesh_builder.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/voronoi/RVD_mesh_builder.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/third_party/LM7/libmeshb7.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/third_party/LM7/libmeshb7.c)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/third_party/rply/rply.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/third_party/rply/rply.c)
set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/geogram/third_party/rply/rplyfile.h)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/basic.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/basic.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/frame.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/frame.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/spherical_harmonics_l4.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/spherical_harmonics_l4.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/polygon.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/polygon.cpp)

set(HEADER_FILES ${HEADER_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/quad_cover.h)
set(SOURCE_FILES ${SOURCE_FILES} thirdparty/geogram/geogram-1.7.5/src/lib/exploragram/hexdom/quad_cover.cpp)

# Add the executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES})

# Link the necessary libraries
target_link_libraries(${PROJECT_NAME} openvdb Half-2_4 zlib libblosc tbb libgmp-10 libmpfr-4)