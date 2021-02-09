library bottom_rs_dart;

import 'dart:ffi';
import 'dart:typed_data';
import 'package:bottom_rs_dart/helper.dart';
import 'package:ffi/ffi.dart';

class Bottom {
  static DynamicLibrary _lib;

  Bottom() {
    _lib = universalLoad();
  }

  String encode_byte(int byte) {
    final pointer = _lib.lookup<NativeFunction<ENCODE_BYTE>>("encode_byte");
    final Pointer<Utf8> Function(int val) function = pointer.asFunction();

    return function(byte).toString();
  }

  int decode_byte(String byte) {
    final pointer = _lib.lookup<NativeFunction<DECODE_BYTE>>("decode_byte");
    final int Function(Pointer<Utf8> val) function = pointer.asFunction();

    return function(Utf8.toUtf8(byte));
  }

  String encode_string(String string) {
    final pointer = _lib.lookup<NativeFunction<CODE_STRING>>("encode_string");
    final Pointer<Utf8> Function(Pointer<Utf8> val) function = pointer.asFunction();

    return Utf8.fromUtf8(function(Utf8.toUtf8(string)));
  }

  String decode_string(String string) {
    final pointer = _lib.lookup<NativeFunction<CODE_STRING>>("decode_string");
    final Pointer<Utf8> Function(Pointer<Utf8> val) function = pointer.asFunction();

    return Utf8.fromUtf8(function(Utf8.toUtf8(string)));
  }

}
