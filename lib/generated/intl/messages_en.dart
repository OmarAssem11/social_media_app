// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "canNotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Can\'t be empty"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email address"),
        "emailCanNotBeEmpty":
            MessageLookupByLibrary.simpleMessage("Email can\'t be empty"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "invalidEmailFormat":
            MessageLookupByLibrary.simpleMessage("Invalid email format"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noPageFound": MessageLookupByLibrary.simpleMessage("No page found!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordCanNotBeLessThanEightCharacters":
            MessageLookupByLibrary.simpleMessage(
                "Password can\'t be less than eight characters"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong!")
      };
}
