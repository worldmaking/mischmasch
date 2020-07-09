# the library is shipped with @rpath/libphonon.dylib, which won't work nice for Max externals
# this fixes it:
install_name_tool -id "@loader_path/../Frameworks/libphonon.dylib" steamaudio_api/lib/OSX/libphonon.dylib