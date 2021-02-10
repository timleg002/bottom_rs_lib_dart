import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;
import 'dart:io' show Platform; //TODO add support for web?
import "package:system_info/system_info.dart";


typedef ENCODE_BYTE = ffi.Pointer<ffi.Utf8> Function(ffi.Uint8 value);
typedef DECODE_BYTE = ffi.Uint8 Function(ffi.Pointer<ffi.Utf8>value);
typedef CODE_STRING = ffi.Pointer<ffi.Utf8> Function(ffi.Pointer<ffi.Utf8>value); //one typedef because it shares the same function signature

typedef DART_ENCODE_BYTE = ffi.Pointer<ffi.Utf8> Function(int val);
typedef DART_DECODE_BYTE = int Function(ffi.Pointer<ffi.Utf8> val);
typedef DART_CODE_STRING = ffi.Pointer<ffi.Utf8> Function(ffi.Pointer<ffi.Utf8> val);

class _UnsupportedPlatform implements Exception {
  _UnsupportedPlatform(String s);
}

/// Loads the dynamic library, to be used in Dart bindings.

ffi.DynamicLibrary universalLoad() {
  if (Platform.isAndroid) {
    if(SysInfo.kernelArchitecture == "aarch64") {
      return ffi.DynamicLibrary.open(
          'native/bottom-rs-lib-ffi/target/aarch64-linux-android/debug/libbottom_rs_lib_ffi.so');
    } else if(SysInfo.kernelArchitecture == "armv7") {
      return ffi.DynamicLibrary.open(
          'native/bottom-rs-lib-ffi/target/armv7-linux-androideabi/debug/libbottom_rs_lib_ffi.so');
    } else if(SysInfo.kernelArchitecture.endsWith("64")) {
      return ffi.DynamicLibrary.open(
          'native/bottom-rs-lib-ffi/target/x86_64-linux-android/debug/libbottom_rs_lib_ffi.so');
    }
  }
  else if (Platform.isIOS) {
    // iOS is statically linked, so it is the same as the current process.
    return ffi.DynamicLibrary.process();
  }
  /* //TODO macOS
  else if (Platform.isMacOS) {
    return DynamicLibrary.open('${basePath}libbottom_rs_lib_ffi.dylib');
  }
  */
  else if (Platform.isWindows) {
    return ffi.DynamicLibrary.open('native/bottom-rs-lib-ffi/target/debug/bottom_rs_lib_ffi.dll');
  }
  else {
    throw _UnsupportedPlatform('${Platform.operatingSystem} is not supported!');
  }
  return null;
}