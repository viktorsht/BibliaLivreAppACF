part of 'bloc_chapter.dart';

@immutable
sealed class BlocEvent {}

class ShowChapterEvent extends BlocEvent{
  final String book;
  final String chapter;

  ShowChapterEvent({required this.book, required this.chapter});
}