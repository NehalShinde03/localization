import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/change_local/change_local_cubit.dart';
import 'package:mixes/change_local/change_local_state.dart';
import 'package:mixes/home/home_ui.dart';
import 'package:mixes/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLocalUi extends StatefulWidget {
  const ChangeLocalUi({super.key});

  static const String routeName = "/change_local_ui";
  static Widget builder(BuildContext context) => BlocProvider(
    create: (context) => ChangeLocalCubit(ChangeLocalState()),
    child: const ChangeLocalUi(),
  );

  @override
  State<ChangeLocalUi> createState() => _SettingUiState();
}

class _SettingUiState extends State<ChangeLocalUi> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, HomeUi.routeName),
            child: const Text("go"),
          )
        ),
      ),
    );
  }
}
