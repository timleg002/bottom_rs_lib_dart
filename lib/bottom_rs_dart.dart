library bottom_rs_dart;

import 'dart:ffi';
import 'package:bottom_rs_dart/helper.dart';
import 'package:ffi/ffi.dart';

class Bottom {
  static DynamicLibrary _lib;

  Bottom() {
    _lib = universalLoad();
  }

  String encode_byte(int byte) {
    final pointer = _lib.lookup<NativeFunction<ENCODE_BYTE>>("encode_byte");
    final DART_ENCODE_BYTE function = pointer.asFunction();

    return Utf8.fromUtf8(
        function(byte)
            .cast()
    );
  }

  int decode_byte(String byte) {
    final pointer = _lib.lookup<NativeFunction<DECODE_BYTE>>("decode_byte");
    final DART_DECODE_BYTE function = pointer.asFunction();

    return function(
        Utf8.toUtf8(byte)
            .cast()
    );
  }

  String encode_string(String string) {
    final pointer = _lib.lookup<NativeFunction<CODE_STRING>>("encode_string");
    final DART_CODE_STRING function = pointer.asFunction();

    return Utf8.fromUtf8(
        function(
            Utf8.toUtf8(string)
                .cast()
        )
    );
  }

  String decode_string(String string) {
    final pointer = _lib.lookup<NativeFunction<CODE_STRING>>("decode_string");
    final DART_CODE_STRING function = pointer.asFunction();

    return Utf8.fromUtf8(
        function(
            Utf8.toUtf8(string)
                .cast()
        )
    );
  }

}
