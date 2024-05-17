import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/change_local/change_local_state.dart';

class ChangeLocalCubit extends Cubit<ChangeLocalState>{
  ChangeLocalCubit(super.initialState);

  changeRadioButtonIndex({int? index}){
    emit(state.copyWith(index: index));
  }

  updateCountryCode({required String countryCode}){
    emit(state.copyWith(countryCode: countryCode));
  }

}