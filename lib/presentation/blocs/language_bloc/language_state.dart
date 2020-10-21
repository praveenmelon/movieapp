part of 'language_bloc.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState{

  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  // TODO: implement props
  List<Object> get props => [locale.languageCode];
}
