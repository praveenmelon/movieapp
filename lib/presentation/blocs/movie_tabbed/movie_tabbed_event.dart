import 'package:equatable/equatable.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  // TODO: implement props
  List<Object> get props => [currentTabIndex];
}
