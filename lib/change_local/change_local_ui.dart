import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mixes/change_local/change_local_cubit.dart';
import 'package:mixes/change_local/change_local_state.dart';
import 'package:mixes/enum/enum.dart';
import 'package:mixes/home/home_ui.dart';
import 'package:mixes/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLocalUi extends StatefulWidget {
  const ChangeLocalUi({super.key});

  static const String routeName = "/change_local_ui";
  static Widget builder(BuildContext context) => BlocProvider(
    create: (context) => ChangeLocalCubit(const ChangeLocalState()),
    child: const ChangeLocalUi(),
  );

  @override
  State<ChangeLocalUi> createState() => _SettingUiState();
}

class _SettingUiState extends State<ChangeLocalUi> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  ChangeLocalCubit get cubit => context.read<ChangeLocalCubit>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.language),
              itemBuilder: (context){
                return const[
                  PopupMenuItem(
                      value: 0,
                      child: Text("english")
                  ),
                  PopupMenuItem(
                      value: 1,
                      child: Text("gujarati")
                  ),
                ];
              },
              onSelected: (val) async{
                try{
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  if(val==0){
                    preferences.setString('local','en');
                    context.read<MainCubit>().getLocal();
                  }else{
                    preferences.setString('local','gu');
                    context.read<MainCubit>().getLocal();
                  }
                }catch(e){
                  print("exception ====> $e");
                }
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text("Please Select Language", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const Gap(20),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: LanguagePicker.values.length,
                    itemBuilder: (context, index){
                      return BlocBuilder<ChangeLocalCubit, ChangeLocalState>(
                      builder: (context, state) {
                        return RadioListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(LanguagePicker.values[index].name),
                          value: index,
                          groupValue: state.index,
                          onChanged: (val){
                            cubit.changeRadioButtonIndex(index: index);
                          }
                        );
                       },
                     );
                    }
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                     SharedPreferences preferences = await SharedPreferences.getInstance();
                     preferences.setString('local',LanguageCode.values[cubit.state.index].name.toString());
                     context.read<MainCubit>().getLocal();
                     Navigator.pushNamed(context, HomeUi.routeName);
                  },
                  child: const Text("Next")
              )
            ],
          )
        ),
      ),
    );
  }
}
