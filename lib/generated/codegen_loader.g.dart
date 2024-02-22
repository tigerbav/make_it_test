// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "log_in": "Log In",
  "notifications": "Notifications",
  "enter_current_time_format": "Enter current time in hh : mm format",
  "confirm": "Confirm",
  "the_time_is_wrong": "The time is wrong. Try again.",
  "one_time": "One-time",
  "recurring": "Recurring",
  "time": "Time:",
  "message": "Message:",
  "message_without": "Message",
  "enter_message": "Enter message",
  "error_text": "Error text",
  "select_trigger": "Select trigger {}",
  "add_new_notification": "Add new notification",
  "edit_notification": "Edit notification",
  "type_time": "Type time",
  "icon": "Icon",
  "select_icon": "Select icon",
  "icon_style": "Icon style",
  "background_colors": "Background colors",
  "select_icons": "Select icons",
  "save_changes": "Save changes",
  "minute": "{} Minute",
  "all_triggers": "All Triggers",
  "something_went_wrong": "Something went wrong"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US};
}
