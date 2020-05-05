// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get contacts_title {
    return Intl.message(
      'Contacts',
      name: 'contacts_title',
      desc: '',
      args: [],
    );
  }

  String get empty_contacts {
    return Intl.message(
      'Empty contacts',
      name: 'empty_contacts',
      desc: '',
      args: [],
    );
  }

  String get refresh_title {
    return Intl.message(
      'Refresh',
      name: 'refresh_title',
      desc: '',
      args: [],
    );
  }

  String get search_title {
    return Intl.message(
      'Search',
      name: 'search_title',
      desc: '',
      args: [],
    );
  }

  String get error_loading_data_title {
    return Intl.message(
      'Error loading data',
      name: 'error_loading_data_title',
      desc: '',
      args: [],
    );
  }

  String get error_connection {
    return Intl.message(
      'Check your internet connection',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  String get error_request_canceled {
    return Intl.message(
      'Request was cancelled',
      name: 'error_request_canceled',
      desc: '',
      args: [],
    );
  }

  String get error_connection_timeout {
    return Intl.message(
      'Connection timeout',
      name: 'error_connection_timeout',
      desc: '',
      args: [],
    );
  }

  String get error_receive_timeout {
    return Intl.message(
      'Receive timeout in connection with server',
      name: 'error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  String get error_send_timeout {
    return Intl.message(
      'Send timeout in connection with server',
      name: 'error_send_timeout',
      desc: '',
      args: [],
    );
  }

  String error_response(dynamic code) {
    return Intl.message(
      'Received invalid status code: $code',
      name: 'error_response',
      desc: '',
      args: [code],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'), Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}