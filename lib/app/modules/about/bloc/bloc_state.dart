part of 'bloc_about.dart';

@immutable
sealed class BlocState {}

final class AboutInitial extends BlocState {}

class AboutErrorState extends BlocState {
  final String message;

  AboutErrorState({required this.message});
}

class AboutSucessState extends BlocState {
  final AboutModel data;

  AboutSucessState({required this.data});
}

class AboutLoadingState extends BlocState {
  AboutLoadingState();
}

