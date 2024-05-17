import 'package:equatable/equatable.dart';

class MainState extends Equatable{

  final String  localizationName;

  const MainState({
    this.localizationName = "en"
  });

  @override
  List<Object?> get props => [localizationName];

  MainState copyWith({
         String? localizationName
  }){
  return MainState(localizationName: localizationName ?? this.localizationName);
  }

}
