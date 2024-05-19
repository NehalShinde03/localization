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
  State<ChangeLocalUi> createState() => _ChangeLocalUiState();
}

class _ChangeLocalUiState extends State<ChangeLocalUi> {

  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  ChangeLocalCubit get cubit => context.read<ChangeLocalCubit>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Language"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          actions: const[
            /*  PopupMenuButton(
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
            )*/
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Please Select Language", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const Gap(20),
              Flexible(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: LanguagePicker.values.length,
                    separatorBuilder: (context, index){
                      return Gap(10.0);
                    },
                    itemBuilder: (context, index){
                      return BlocBuilder<ChangeLocalCubit, ChangeLocalState>(
                      builder: (context, state) {

                        return RadioListTile(
                          // activeColor: Theme.of(context).,
                          // tileColor: Theme.of(context).colorScheme.secondary,
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
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10.0, vertical: 6.0,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () async {
                         SharedPreferences preferences = await SharedPreferences.getInstance();
                         preferences.setString('local',LanguageCode.values[cubit.state.index].name.toString());
                         context.read<MainCubit>().getLocal();
                         Navigator.pushNamed(context, HomeUi.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10.0)
                        )
                      ),
                      // style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text("Next", /*style: TextStyle(color: Theme.of(context).primaryColor)*/),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
