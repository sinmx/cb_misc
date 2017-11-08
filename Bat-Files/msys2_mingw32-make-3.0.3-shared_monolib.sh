# This file is designed to be ran from (git for Windows) bash shell


# Change to git folder
cd ~/devel/open_source_code/version_control/wxWidgets_3_0_branch || exit 1
# pwd

# Change to correct wxWidgets Git branch
# git lfs install
git checkout wxwidgets3.0.3+git-lfs || exit 2
# git status -uno

if [ "$PROCESSOR_ARCHITECTURE" = "x86" ]; then
  export PATH=/C/Apps32/MSys2/mingw32/bin:$PATH
else
  export PATH=/C/Apps64/MSys2/mingw32/bin:$PATH
fi

# echo $PATH

export _COMPILER_VERSION=720MSYS2

# echo $_COMPILER_VERSION

cd build/msw || exit 3

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  LDFLAGS=-Wl,--allow-multiple-definition \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=debug

mingw32-make -f makefile.gcc \
  CFG=mono \
  VENDOR=$_COMPILER_VERSION \
  COMPILER_VERSION=$_COMPILER_VERSION \
  CXXFLAGS=-std=gnu++11 \
  LDFLAGS=-Wl,--allow-multiple-definition \
  MONOLITHIC=1 SHARED=1 UNICODE=1 BUILD=release

echo "Finished"
