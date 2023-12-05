abstract class ClipboardEvent {}

class CopyToClipboardEvent extends ClipboardEvent {
  final String text;

  CopyToClipboardEvent(this.text);
}