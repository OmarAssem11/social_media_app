import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_media_app/core/presentation/bloc/app_bloc_observer.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/core/presentation/resources/theme_manager.dart';
import 'package:social_media_app/di/injector.dart';
import 'package:social_media_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:social_media_app/features/settings/presentation/cubit/settings_state.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>()
        ..getCurrentTheme()
        ..getCurrentLocale(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (ctx, state) {
          final cubit = BlocProvider.of<SettingsCubit>(ctx);
          return MaterialApp(
            title: 'Hashtag',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: cubit.currentTheme(),
            locale: cubit.locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
