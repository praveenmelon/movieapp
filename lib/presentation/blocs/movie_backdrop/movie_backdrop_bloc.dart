import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_state.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial());

  @override
  Stream<MovieBackdropState> mapEventToState(
    MovieBackdropEvent event,
  ) async* {
    yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  }
}
