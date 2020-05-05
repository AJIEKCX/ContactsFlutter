// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(code) => "Received invalid status code: ${code}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "contacts_title" : MessageLookupByLibrary.simpleMessage("Contacts"),
    "empty_contacts" : MessageLookupByLibrary.simpleMessage("Empty contacts"),
    "error_connection" : MessageLookupByLibrary.simpleMessage("Check your internet connection"),
    "error_connection_timeout" : MessageLookupByLibrary.simpleMessage("Connection timeout"),
    "error_loading_data_title" : MessageLookupByLibrary.simpleMessage("Error loading data"),
    "error_receive_timeout" : MessageLookupByLibrary.simpleMessage("Receive timeout in connection with server"),
    "error_request_canceled" : MessageLookupByLibrary.simpleMessage("Request was cancelled"),
    "error_response" : m0,
    "error_send_timeout" : MessageLookupByLibrary.simpleMessage("Send timeout in connection with server"),
    "refresh_title" : MessageLookupByLibrary.simpleMessage("Refresh"),
    "search_title" : MessageLookupByLibrary.simpleMessage("Search")
  };
}
