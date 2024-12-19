import 'package:flutter/material.dart';

void printWarning(dynamic text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

void printError(dynamic text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}

void printSuccess(dynamic text) {
  debugPrint('\x1B[32m$text\x1B[0m');
}
