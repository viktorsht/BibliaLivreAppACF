abstract class IHolyBibleException{
  final String message;
  final StackTrace? stackTrace;

  IHolyBibleException(this.stackTrace, {required this.message});
}

class ErrorListBooks extends IHolyBibleException{
  ErrorListBooks(super.stackTrace, {required super.message}); 
}