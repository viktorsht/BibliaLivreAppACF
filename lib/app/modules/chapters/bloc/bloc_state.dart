part of 'bloc_chapter.dart';

@immutable
sealed class BlocState {}

final class ShowChapterInitial extends BlocState {}

class ShowChapterErrorState extends BlocState {
  final String message;

  ShowChapterErrorState({required this.message});
}

class ShowChapterSucessState extends BlocState {
  final ChapterModel data;

  ShowChapterSucessState({required this.data});
}

class ShowChapterLoadingState extends BlocState {
  ShowChapterLoadingState();
}

