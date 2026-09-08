# No Qt in this build: pivy's SoQt bindings are not built, so there is no
# Qt5 EGL config to patch and no PIVY_USE_QT6 to pass.

Python_INCLUDE_DIR="$(python -c 'import sysconfig; print(sysconfig.get_path("include"))')"

cmake -G "Ninja" -B build \
      -D CMAKE_BUILD_TYPE:STRING="Release" \
      -D CMAKE_INSTALL_PREFIX:PATH=$PREFIX \
      -D Python_EXECUTABLE:PATH="$PYTHON" \
      -D Python_INCLUDE_DIR:PATH=${Python_INCLUDE_DIR}

ninja -C build install
