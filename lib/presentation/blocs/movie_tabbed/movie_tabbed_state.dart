import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState({this.currentTabIndex});

  @override
  // TODO: implement props
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  // TODO: implement props
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  MovieTabLoadError({int currentTabIndex, this.errorType})
      : super(currentTabIndex: currentTabIndex);
}
