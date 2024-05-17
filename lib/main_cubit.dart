import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/main_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit(super.initialState){
    getLocal();
  }

  Future<void> getLocal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String localizationName = preferences.getString('local') ?? "";
    if(localizationName.isNotEmpty){
      emit(state.copyWith(localizationName: localizationName));
    }
  }

}