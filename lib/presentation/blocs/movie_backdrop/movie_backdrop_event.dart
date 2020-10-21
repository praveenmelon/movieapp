import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movie;

  const MovieBackdropChangedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
