// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LanguageTranslation {
  LanguageTranslation();

  static LanguageTranslation? _current;

  static LanguageTranslation get current {
    assert(_current != null,
        'No instance of LanguageTranslation was loaded. Try to initialize the LanguageTranslation delegate before accessing LanguageTranslation.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LanguageTranslation> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LanguageTranslation();
      LanguageTranslation._current = instance;

      return instance;
    });
  }

  static LanguageTranslation of(BuildContext context) {
    final instance = LanguageTranslation.maybeOf(context);
    assert(instance != null,
        'No instance of LanguageTranslation present in the widget tree. Did you add LanguageTranslation.delegate in localizationsDelegates?');
    return instance!;
  }

  static LanguageTranslation? maybeOf(BuildContext context) {
    return Localizations.of<LanguageTranslation>(context, LanguageTranslation);
  }

  /// `Nosh`
  String get nosh {
    return Intl.message(
      'Nosh',
      name: 'nosh',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get recipes {
    return Intl.message(
      'Recipes',
      name: 'recipes',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Meal Plan`
  String get meal_plan {
    return Intl.message(
      'Meal Plan',
      name: 'meal_plan',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Dish of the day`
  String get dish_of_the_day {
    return Intl.message(
      'Dish of the day',
      name: 'dish_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Breakfasts for Champions`
  String get breakfasts_for_champions {
    return Intl.message(
      'Breakfasts for Champions',
      name: 'breakfasts_for_champions',
      desc: '',
      args: [],
    );
  }

  /// `Discover regional delights`
  String get discover_regional_delights {
    return Intl.message(
      'Discover regional delights',
      name: 'discover_regional_delights',
      desc: '',
      args: [],
    );
  }

  /// `"Oops! No internet connection.",`
  String get oops_no_internet {
    return Intl.message(
      '"Oops! No internet connection.",',
      name: 'oops_no_internet',
      desc: '',
      args: [],
    );
  }

  /// `"Please check your internet connection.",`
  String get please_check_your_internet {
    return Intl.message(
      '"Please check your internet connection.",',
      name: 'please_check_your_internet',
      desc: '',
      args: [],
    );
  }

  /// `"Pull down to refresh.",`
  String get pull_down_to_refresh {
    return Intl.message(
      '"Pull down to refresh.",',
      name: 'pull_down_to_refresh',
      desc: '',
      args: [],
    );
  }

  /// `20 minutes`
  String get minutes {
    return Intl.message(
      '20 minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian`
  String get vegetarian {
    return Intl.message(
      'Vegetarian',
      name: 'vegetarian',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<LanguageTranslation> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LanguageTranslation> load(Locale locale) =>
      LanguageTranslation.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
