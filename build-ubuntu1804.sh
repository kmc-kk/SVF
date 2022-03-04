export CXX=/usr/bin/clang++-10
export CC=/usr/bin/clang-10

export LLVM_DIR=/usr/lib/llvm-10/cmake
# export LLVM_DIR=/mnt/sda1/NeXtream/kmckk/svf/llvm-10.0.0.obj
# export Z3_DIR=/mnt/sda1/NeXtream/kmckk/svf/z3.obj
export Z3_DIR=$(pwd)/z3.obj
export CMAKE_COMPILER_IS_GNUCC=1
export CMAKE_COMPILER_IS_GNUCXX=1

rm -rf build
# cmake-gui &

# Debug-build
./build.sh debug

# Release-build
./build.sh

