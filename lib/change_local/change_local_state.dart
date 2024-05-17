import 'package:equatable/equatable.dart';

class ChangeLocalState extends Equatable{

  final List listOfLanguage;
  final int index;
  final String countryCode;

  const ChangeLocalState({
    this.listOfLanguage = const [],
    this.index = 0,
    this.countryCode = "en"
  });

  @override
  List<Object?> get props => [
    listOfLanguage,
    index,
    countryCode
  ];

  ChangeLocalState copyWith({
      List? listOfLanguage,
      int? index,
      String? countryCode
  }){
    return ChangeLocalState(
        listOfLanguage: listOfLanguage ?? this.listOfLanguage,
        index: index ?? this.index,
        countryCode: countryCode ?? this.countryCode
    );
  }

}