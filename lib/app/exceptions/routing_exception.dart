abstract class IHolyBibleException{
  final String message;
  final StackTrace? stackTrace;

  IHolyBibleException(this.stackTrace, {required this.message});
}