import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:social_media_app/generated/l10n.dart';

class LocaleDropDownButton extends StatefulWidget {
  const LocaleDropDownButton();

  @override
  State<LocaleDropDownButton> createState() => _LocaleDropDownButtonState();
}

class _LocaleDropDownButtonState extends State<LocaleDropDownButton> {
  late SettingsCubit cubit;
  late Lang lang;
  List<Lang> langs = [
    Lang(langName: S.current.english, locale: KeyConstants.englishLocale),
    Lang(langName: S.current.arabic, locale: KeyConstants.arabicLocale),
  ];

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<SettingsCubit>(context);
    lang = Lang(
      langName: _getLangName(cubit.locale),
      locale: cubit.locale,
    );
  }

  String _getLangName(Locale lc) => langs
      .firstWhere(
        (lang) => lang.locale == lc,
        orElse: () => langs.first,
      )
      .langName;

  Locale _getLocale(String langName) => langs
      .firstWhere(
        (lang) => lang.langName == langName,
        orElse: () => langs.first,
      )
      .locale;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: langs
          .map(
            (lang) => DropdownMenuItem<String>(
              value: lang.langName,
              child: Text(lang.langName),
            ),
          )
          .toList(),
      value: lang.langName,
      onChanged: (selectedLangName) {
        if (selectedLangName != null) {
          lang = Lang(
            langName: selectedLangName,
            locale: _getLocale(selectedLangName),
          );
          cubit.changeLocale(lang.locale);
          setState(() {});
        }
      },
      isExpanded: true,
    );
  }
}

class Lang {
  final String langName;
  final Locale locale;

  const Lang({
    required this.langName,
    required this.locale,
  });
}
