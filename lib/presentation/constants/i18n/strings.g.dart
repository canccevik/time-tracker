
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 48 (24.0 per locale)
 *
 * Built on 2022-03-10 at 18:01 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	tr, // 'tr'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsTr _translationsTr = _StringsTr.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.tr: return _translationsTr;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.tr: return _StringsTr.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.tr: return 'tr';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.tr: return const Locale.fromSubtags(languageCode: 'tr');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'tr': return AppLocale.tr;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get appName => 'Time Tracker';
	String get home => 'Home';
	String get history => 'History';
	String get symbolOfHour => 'h';
	late final _StringsCommonWeekdaysEn weekdays = _StringsCommonWeekdaysEn._(_root);
	late final _StringsCommonLanguagesEn languages = _StringsCommonLanguagesEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'Settings';
	String get firstDayOfTheWeek => 'First day of the week';
	String get workingPeriod => 'Working period';
	late final _StringsSettingsWorkingPeriodsEn workingPeriods = _StringsSettingsWorkingPeriodsEn._(_root);
	String get dailyWorkingHours => 'Daily working hours';
	String get iAmFreelancer => 'I am freelancer';
	String get appLanguage => 'Language';
	late final _StringsSettingsEditHistoryEn editHistory = _StringsSettingsEditHistoryEn._(_root);
}

// Path: common.weekdays
class _StringsCommonWeekdaysEn {
	_StringsCommonWeekdaysEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get monday => 'Monday';
	String get tuesday => 'Tuesday';
	String get wednesday => 'Wednesday';
	String get thursday => 'Thursday';
	String get friday => 'Friday';
	String get saturday => 'Saturday';
	String get sunday => 'Sunday';
}

// Path: common.languages
class _StringsCommonLanguagesEn {
	_StringsCommonLanguagesEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	late final _StringsCommonLanguagesEnglishEn english = _StringsCommonLanguagesEnglishEn._(_root);
	late final _StringsCommonLanguagesTurkishEn turkish = _StringsCommonLanguagesTurkishEn._(_root);
}

// Path: settings.workingPeriods
class _StringsSettingsWorkingPeriodsEn {
	_StringsSettingsWorkingPeriodsEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get weekly => 'Weekly';
	String get monthly => 'Monthly';
}

// Path: settings.editHistory
class _StringsSettingsEditHistoryEn {
	_StringsSettingsEditHistoryEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'Edit History';
}

// Path: common.languages.english
class _StringsCommonLanguagesEnglishEn {
	_StringsCommonLanguagesEnglishEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get name => 'English';
	String get code => 'en';
}

// Path: common.languages.turkish
class _StringsCommonLanguagesTurkishEn {
	_StringsCommonLanguagesTurkishEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get name => 'Turkish';
	String get code => 'tr';
}

// Path: <root>
class _StringsTr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsTr _root = this;

	// Translations
	@override late final _StringsCommonTr common = _StringsCommonTr._(_root);
	@override late final _StringsSettingsTr settings = _StringsSettingsTr._(_root);
}

// Path: common
class _StringsCommonTr implements _StringsCommonEn {
	_StringsCommonTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get appName => 'Zaman Takipçisi';
	@override String get home => 'Ana Sayfa';
	@override String get history => 'Geçmiş';
	@override String get symbolOfHour => 's';
	@override late final _StringsCommonWeekdaysTr weekdays = _StringsCommonWeekdaysTr._(_root);
	@override late final _StringsCommonLanguagesTr languages = _StringsCommonLanguagesTr._(_root);
}

// Path: settings
class _StringsSettingsTr implements _StringsSettingsEn {
	_StringsSettingsTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get title => 'Ayarlar';
	@override String get firstDayOfTheWeek => 'Haftanın ilk günü';
	@override String get workingPeriod => 'Çalışma periyodu';
	@override late final _StringsSettingsWorkingPeriodsTr workingPeriods = _StringsSettingsWorkingPeriodsTr._(_root);
	@override String get dailyWorkingHours => 'Günlük çalışılan saat';
	@override String get iAmFreelancer => 'Serbest çalışanım';
	@override String get appLanguage => 'Dil';
	@override late final _StringsSettingsEditHistoryTr editHistory = _StringsSettingsEditHistoryTr._(_root);
}

// Path: common.weekdays
class _StringsCommonWeekdaysTr implements _StringsCommonWeekdaysEn {
	_StringsCommonWeekdaysTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get monday => 'Pazartesi';
	@override String get tuesday => 'Salı';
	@override String get wednesday => 'Çarşamba';
	@override String get thursday => 'Perşembe';
	@override String get friday => 'Cuma';
	@override String get saturday => 'Cumartesi';
	@override String get sunday => 'Pazar';
}

// Path: common.languages
class _StringsCommonLanguagesTr implements _StringsCommonLanguagesEn {
	_StringsCommonLanguagesTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override late final _StringsCommonLanguagesEnglishTr english = _StringsCommonLanguagesEnglishTr._(_root);
	@override late final _StringsCommonLanguagesTurkishTr turkish = _StringsCommonLanguagesTurkishTr._(_root);
}

// Path: settings.workingPeriods
class _StringsSettingsWorkingPeriodsTr implements _StringsSettingsWorkingPeriodsEn {
	_StringsSettingsWorkingPeriodsTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get weekly => 'Haftalık';
	@override String get monthly => 'Aylık';
}

// Path: settings.editHistory
class _StringsSettingsEditHistoryTr implements _StringsSettingsEditHistoryEn {
	_StringsSettingsEditHistoryTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get title => 'Geçmişi Düzenle';
}

// Path: common.languages.english
class _StringsCommonLanguagesEnglishTr implements _StringsCommonLanguagesEnglishEn {
	_StringsCommonLanguagesEnglishTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get name => 'İngilizce';
	@override String get code => 'en';
}

// Path: common.languages.turkish
class _StringsCommonLanguagesTurkishTr implements _StringsCommonLanguagesTurkishEn {
	_StringsCommonLanguagesTurkishTr._(this._root);

	// ignore: unused_field
	@override final _StringsTr _root;

	// Translations
	@override String get name => 'Türkçe';
	@override String get code => 'tr';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'common.appName': 'Time Tracker',
			'common.home': 'Home',
			'common.history': 'History',
			'common.symbolOfHour': 'h',
			'common.weekdays.monday': 'Monday',
			'common.weekdays.tuesday': 'Tuesday',
			'common.weekdays.wednesday': 'Wednesday',
			'common.weekdays.thursday': 'Thursday',
			'common.weekdays.friday': 'Friday',
			'common.weekdays.saturday': 'Saturday',
			'common.weekdays.sunday': 'Sunday',
			'common.languages.english.name': 'English',
			'common.languages.english.code': 'en',
			'common.languages.turkish.name': 'Turkish',
			'common.languages.turkish.code': 'tr',
			'settings.title': 'Settings',
			'settings.firstDayOfTheWeek': 'First day of the week',
			'settings.workingPeriod': 'Working period',
			'settings.workingPeriods.weekly': 'Weekly',
			'settings.workingPeriods.monthly': 'Monthly',
			'settings.dailyWorkingHours': 'Daily working hours',
			'settings.iAmFreelancer': 'I am freelancer',
			'settings.appLanguage': 'Language',
			'settings.editHistory.title': 'Edit History',
		};
	}
}

extension on _StringsTr {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'common.appName': 'Zaman Takipçisi',
			'common.home': 'Ana Sayfa',
			'common.history': 'Geçmiş',
			'common.symbolOfHour': 's',
			'common.weekdays.monday': 'Pazartesi',
			'common.weekdays.tuesday': 'Salı',
			'common.weekdays.wednesday': 'Çarşamba',
			'common.weekdays.thursday': 'Perşembe',
			'common.weekdays.friday': 'Cuma',
			'common.weekdays.saturday': 'Cumartesi',
			'common.weekdays.sunday': 'Pazar',
			'common.languages.english.name': 'İngilizce',
			'common.languages.english.code': 'en',
			'common.languages.turkish.name': 'Türkçe',
			'common.languages.turkish.code': 'tr',
			'settings.title': 'Ayarlar',
			'settings.firstDayOfTheWeek': 'Haftanın ilk günü',
			'settings.workingPeriod': 'Çalışma periyodu',
			'settings.workingPeriods.weekly': 'Haftalık',
			'settings.workingPeriods.monthly': 'Aylık',
			'settings.dailyWorkingHours': 'Günlük çalışılan saat',
			'settings.iAmFreelancer': 'Serbest çalışanım',
			'settings.appLanguage': 'Dil',
			'settings.editHistory.title': 'Geçmişi Düzenle',
		};
	}
}
