// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static m0(code) => "Получен неверный статус код: \$code";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "contacts_title" : MessageLookupByLibrary.simpleMessage("Контакты"),
    "empty_contacts" : MessageLookupByLibrary.simpleMessage("Нет контактов"),
    "error_connection" : MessageLookupByLibrary.simpleMessage("Проверьте ваше интернет соединение"),
    "error_connection_timeout" : MessageLookupByLibrary.simpleMessage("Таймаут соединения"),
    "error_loading_data_title" : MessageLookupByLibrary.simpleMessage("Ошибка при загрузке данных"),
    "error_receive_timeout" : MessageLookupByLibrary.simpleMessage("Получен таймаут при соединении с сервером"),
    "error_request_canceled" : MessageLookupByLibrary.simpleMessage("Запрос был отменен"),
    "error_response" : m0,
    "error_send_timeout" : MessageLookupByLibrary.simpleMessage("Отправлен таймаут при соединении с сервером"),
    "refresh_title" : MessageLookupByLibrary.simpleMessage("Обновить"),
    "search_title" : MessageLookupByLibrary.simpleMessage("Поиск"),
    "temperament_choleric" : MessageLookupByLibrary.simpleMessage("Холерик"),
    "temperament_melancholic" : MessageLookupByLibrary.simpleMessage("Меланхолик"),
    "temperament_phlegmatic" : MessageLookupByLibrary.simpleMessage("Флегматик"),
    "temperament_sanguine" : MessageLookupByLibrary.simpleMessage("Сангвиник")
  };
}
