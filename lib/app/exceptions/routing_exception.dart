import 'dart:io';
import 'package:http/http.dart';

abstract class IHolyBibleException{
  final String message;
  final StackTrace? stackTrace;

  IHolyBibleException(this.stackTrace, {required this.message});
}

class ErrorListBooks extends IHolyBibleException{
  ErrorListBooks(super.stackTrace, {required super.message}); 
}

class ClientExceptionHolyBible extends ClientException{
  ClientExceptionHolyBible(super.message);
}

class PutAppException extends FormatException{
  PutAppException(super.message);
}

class SocketExceptionHolyBible extends SocketException{
  SocketExceptionHolyBible(super.message);
}