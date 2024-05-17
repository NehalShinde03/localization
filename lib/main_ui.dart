import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/change_local/change_local_ui.dart';
import 'package:mixes/home/home_ui.dart';
import 'package:mixes/l10n/l10n.dart';
import 'package:mixes/main_cubit.dart';
import 'package:mixes/main_state.dart';
import 'package:mixes/setting/setting_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:mixes/splash/splash_ui.dart';

class MainUi extends StatefulWidget {
  const MainUi({super.key});

  static const String routeName = "/main_ui";

  static Widget builder(BuildContext context) =>
      BlocProvider(
        create: (context) => MainCubit(const MainState()),
        child: const MainUi(),
      );

  @override
  State<MainUi> createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(const MainState()),
      child: BlocSelector<MainCubit, MainState, String>(
        selector: (state) => state.localizationName,
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            supportedLocales: L10n.all,
            localizationsDelegates: const[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            locale: Locale(state),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: SplashUi.routeName,
            routes: routes,
          );
        },
      ),
    );
  }

  Map<String, WidgetBuilder> get routes =>
      <String, WidgetBuilder>{
       SplashUi.routeName: SplashUi.builder,
        MainUi.routeName: MainUi.builder,
        HomeUi.routeName: HomeUi.builder,
        SettingUi.routeName: SettingUi.builder,
        ChangeLocalUi.routeName: ChangeLocalUi.builder
      };

}
