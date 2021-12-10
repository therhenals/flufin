
/*
 * Generated file. Do not edit.
 * 
 * Locales: 2
 * Strings: 60 (30.0 per locale)
 * 
 * Built on 2021-11-22 at 21:19 UTC
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
	es, // 'es'
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
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.useDeviceLocale().languageTag
	static AppLocale useDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			return setLocaleRaw(deviceLocale);
		} else {
			return setLocale(_baseLocale);
		}
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
	static AppLocale setLocaleRaw(String localeRaw) {
		final selected = _selectLocale(localeRaw);
		return setLocale(selected ?? _baseLocale);
	}

	/// Gets current locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.currentLocale.languageTag
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.baseLocale.languageTag
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

// context enums

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _StringsEn._instance;
			case AppLocale.es: return _StringsEs._instance;
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.es: return 'es';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'es': return AppLocale.es;
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

class _StringsEn {
	_StringsEn._(); // no constructor

	static final _StringsEn _instance = _StringsEn._();

	String get about => 'About';
	String get addServer => 'Add server';
	String get appInformation => 'App information';
	String get cast => 'Cast';
	String get changeServer => 'Change server';
	String get connect => 'Connect';
	String get continueWatching => 'Continue watching';
	String get developerBy => 'Developer by';
	String get directors => 'Directors';
	String get genres => 'Genres';
	String get goTo => 'Go To';
	String get home => 'Home';
	String get latest => 'Latest';
	String get library => 'Library';
	String get login => 'Login';
	String get logout => 'Logout';
	String get nextUp => 'Next Up';
	String get password => 'Password';
	String get play => 'Play';
	String get privacyPolicy => 'Privacy Policy';
	String get seasons => 'Seasons';
	String get server => 'Server';
	String get serverAddress => 'Server address';
	String get servers => 'Servers';
	String get settings => 'Settings';
	String get sourceCodeMsg => 'Source code available at';
	String get username => 'Username';
	String get version => 'Version';
	String get wait => 'Wait';
	String get writers => 'Writers';

	/// A flat map containing all translations.
	dynamic operator[](String key) {
		return _translationMap[AppLocale.en]![key];
	}
}

class _StringsEs implements _StringsEn {
	_StringsEs._(); // no constructor

	static final _StringsEs _instance = _StringsEs._();

	@override String get about => 'Acerca';
	@override String get addServer => 'Agregar servidor';
	@override String get appInformation => 'Información de la app';
	@override String get cast => 'Reparto';
	@override String get changeServer => 'Cambiar servidor';
	@override String get connect => 'Conectar';
	@override String get continueWatching => 'Continuar viendo';
	@override String get developerBy => 'Desarrollador por';
	@override String get directors => 'Directores';
	@override String get genres => 'Generos';
	@override String get goTo => 'Ir a';
	@override String get home => 'Inicio';
	@override String get latest => 'Últimos';
	@override String get library => 'Libreria';
	@override String get login => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get nextUp => 'Siguiente';
	@override String get password => 'Contraseña';
	@override String get play => 'Reproducir';
	@override String get privacyPolicy => 'Políticas de privacidad';
	@override String get seasons => 'Temporadas';
	@override String get server => 'Servidor';
	@override String get serverAddress => 'Dirección del servidor';
	@override String get servers => 'Servidores';
	@override String get settings => 'Configuración';
	@override String get sourceCodeMsg => 'El código fuente está disponible en';
	@override String get username => 'Nombre de usuario';
	@override String get version => 'Versión';
	@override String get wait => 'Espere';
	@override String get writers => 'Escritores';

	/// A flat map containing all translations.
	@override
	dynamic operator[](String key) {
		return _translationMap[AppLocale.es]![key];
	}
}

/// A flat map containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
late Map<AppLocale, Map<String, dynamic>> _translationMap = {
	AppLocale.en: {
		'about': 'About',
		'addServer': 'Add server',
		'appInformation': 'App information',
		'cast': 'Cast',
		'changeServer': 'Change server',
		'connect': 'Connect',
		'continueWatching': 'Continue watching',
		'developerBy': 'Developer by',
		'directors': 'Directors',
		'genres': 'Genres',
		'goTo': 'Go To',
		'home': 'Home',
		'latest': 'Latest',
		'library': 'Library',
		'login': 'Login',
		'logout': 'Logout',
		'nextUp': 'Next Up',
		'password': 'Password',
		'play': 'Play',
		'privacyPolicy': 'Privacy Policy',
		'seasons': 'Seasons',
		'server': 'Server',
		'serverAddress': 'Server address',
		'servers': 'Servers',
		'settings': 'Settings',
		'sourceCodeMsg': 'Source code available at',
		'username': 'Username',
		'version': 'Version',
		'wait': 'Wait',
		'writers': 'Writers',
	},
	AppLocale.es: {
		'about': 'Acerca',
		'addServer': 'Agregar servidor',
		'appInformation': 'Información de la app',
		'cast': 'Reparto',
		'changeServer': 'Cambiar servidor',
		'connect': 'Conectar',
		'continueWatching': 'Continuar viendo',
		'developerBy': 'Desarrollador por',
		'directors': 'Directores',
		'genres': 'Generos',
		'goTo': 'Ir a',
		'home': 'Inicio',
		'latest': 'Últimos',
		'library': 'Libreria',
		'login': 'Iniciar sesión',
		'logout': 'Cerrar sesión',
		'nextUp': 'Siguiente',
		'password': 'Contraseña',
		'play': 'Reproducir',
		'privacyPolicy': 'Políticas de privacidad',
		'seasons': 'Temporadas',
		'server': 'Servidor',
		'serverAddress': 'Dirección del servidor',
		'servers': 'Servidores',
		'settings': 'Configuración',
		'sourceCodeMsg': 'El código fuente está disponible en',
		'username': 'Nombre de usuario',
		'version': 'Versión',
		'wait': 'Espere',
		'writers': 'Escritores',
	},
};
