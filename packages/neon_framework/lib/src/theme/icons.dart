// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

// Adding new Icons to this set:
// Make sure to use the common doc comment style and add the correct preview.
// If in doubt copy the previews from the icons you are redirecting to.

/// A set of platform-adaptive icons.
abstract final class AdaptiveIcons {
  const AdaptiveIcons._();

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">search</i> &#x2014; material icon named "search"
  /// and <i class='cupertino-icons md-36'>search</i> &#x2014; cupertino icon named "search".
  static IconData get search => !_isCupertinoPlatform() ? Icons.search : CupertinoIcons.search;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">settings</i> &#x2014; material icon named "settings"
  /// and <i class='cupertino-icons md-36'>settings</i> &#x2014; cupertino icon named "settings".
  static IconData get settings => !_isCupertinoPlatform() ? Icons.settings : CupertinoIcons.settings;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/account-plus/1.5.54/64.png "account-plus") material design icon named "accountPlus"
  /// and <i class='cupertino-icons md-36'>person_add_solid</i> &#x2014; cupertino icon named "person_add_solid".
  static IconData get add_account => !_isCupertinoPlatform() ? MdiIcons.accountPlus : CupertinoIcons.person_add_solid;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">qr_code_scanner</i> &#x2014; material icon named "qr_code_scanner"
  /// and <i class='cupertino-icons md-36'>qrcode_viewfinder</i> &#x2014; cupertino icon named "qrcode_viewfinder".
  static IconData get qr_code_scanner =>
      !_isCupertinoPlatform() ? Icons.qr_code_scanner : CupertinoIcons.qrcode_viewfinder;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">close</i> &#x2014; material icon named "close"
  /// and <i class='cupertino-icons md-36'>clear</i> &#x2014; cupertino icon named "clear".
  static IconData get close => !_isCupertinoPlatform() ? Icons.close : CupertinoIcons.clear;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">error</i> &#x2014; material icon named "error"
  /// and <i class='cupertino-icons md-36'>exclamationmark_circle_fill</i> &#x2014; cupertino icon named "exclamationmark_circle_fill".
  static IconData get error => !_isCupertinoPlatform() ? Icons.error : CupertinoIcons.exclamationmark_circle_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">error_outline</i> &#x2014; material icon named "error_outline"
  /// and <i class='cupertino-icons md-36'>exclamationmark_circle</i> &#x2014; cupertino icon named "exclamationmark_circle".
  static IconData get error_outline =>
      !_isCupertinoPlatform() ? Icons.error_outline : CupertinoIcons.exclamationmark_circle;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">edit</i> &#x2014; material icon named "edit"
  /// and <i class='cupertino-icons md-36'>pen</i> &#x2014; cupertino icon named "pen".
  static IconData get edit => !_isCupertinoPlatform() ? Icons.edit : CupertinoIcons.pen;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">check</i> &#x2014; material icon named "check"
  /// and <i class='cupertino-icons md-36'>checkmark_alt</i> &#x2014; cupertino icon named "checkmark_alt".
  static IconData get check => !_isCupertinoPlatform() ? Icons.check : CupertinoIcons.checkmark_alt;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">check_circle</i> &#x2014; material icon named "check_circle"
  /// and <i class='cupertino-icons md-36'>checkmark_alt_circle_fill</i> &#x2014; cupertino icon named "checkmark_alt_circle_fill".
  static IconData get check_circle =>
      !_isCupertinoPlatform() ? Icons.check_circle : CupertinoIcons.checkmark_alt_circle_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">cancel_outlined</i> &#x2014; material icon named "cancel_outlined"
  /// and <i class='cupertino-icons md-36'>clear_circled</i> &#x2014; cupertino icon named "clear_circled".
  static IconData get cancel_outlined => !_isCupertinoPlatform() ? Icons.cancel_outlined : CupertinoIcons.clear_circled;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">add</i> &#x2014; material icon named "add"
  /// and <i class='cupertino-icons md-36'>add</i> &#x2014; cupertino icon named "add".
  static IconData get add => !_isCupertinoPlatform() ? Icons.add : CupertinoIcons.add;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/tag/1.5.54/64.png "tag") material design icon named "tag"
  /// and <i class='cupertino-icons md-36'>tag_fill</i> &#x2014; cupertino icon named "tag_fill".
  static IconData get tag => !_isCupertinoPlatform() ? MdiIcons.tag : CupertinoIcons.tag_fill;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/email/1.5.54/64.png "email") material design icon named "email"
  /// and <i class='cupertino-icons md-36'>envelope_fill</i> &#x2014; cupertino icon named "envelope_fill".
  static IconData get email => !_isCupertinoPlatform() ? MdiIcons.email : CupertinoIcons.envelope_fill;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/emailMarkAsUnread/1.5.54/64.png "emailMarkAsUnread") material design icon named "emailMarkAsUnread"
  /// and <i class='cupertino-icons md-36'>envelope_open_fill</i> &#x2014; cupertino icon named "envelope_open_fill".
  static IconData get email_mark_as_unread =>
      !_isCupertinoPlatform() ? MdiIcons.emailMarkAsUnread : CupertinoIcons.envelope_open_fill;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/folder/1.5.54/64.png "folder") material design icon named "folder"
  /// and <i class='cupertino-icons md-36'>folder_fill</i> &#x2014; cupertino icon named "folder_fill".
  static IconData get folder => !_isCupertinoPlatform() ? MdiIcons.folder : CupertinoIcons.folder_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">star</i> &#x2014; material icon named "star"
  /// and <i class='cupertino-icons md-36'>star_fill</i> &#x2014; cupertino icon named "star_fill".
  static IconData get star => !_isCupertinoPlatform() ? Icons.star : CupertinoIcons.star_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">star_outline</i> &#x2014; material icon named "star_outline"
  /// and <i class='cupertino-icons md-36'>star</i> &#x2014; cupertino icon named "star".
  static IconData get star_outline => !_isCupertinoPlatform() ? Icons.star_outline : CupertinoIcons.star;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">question_mark</i> &#x2014; material icon named "question_mark"
  /// and <i class='cupertino-icons md-36'>question</i> &#x2014; cupertino icon named "question".
  static IconData get question_mark => !_isCupertinoPlatform() ? Icons.question_mark : CupertinoIcons.question;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">visibility</i> &#x2014; material icon named "visibility"
  /// and <i class='cupertino-icons md-36'>eye_fill</i> &#x2014; cupertino icon named "eye_fill".
  static IconData get visibility => !_isCupertinoPlatform() ? Icons.visibility : CupertinoIcons.eye_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">house</i> &#x2014; material icon named "house"
  /// and <i class='cupertino-icons md-36'>house_fill</i> &#x2014; cupertino icon named "house_fill".
  static IconData get house => !_isCupertinoPlatform() ? Icons.house : CupertinoIcons.house_fill;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">chevron_right</i> &#x2014; material icon named "chevron_right"
  /// and <i class='cupertino-icons md-36'>right_chevron</i> &#x2014; cupertino icon named "right_chevron".
  static IconData get chevron_right => !_isCupertinoPlatform() ? Icons.chevron_right : CupertinoIcons.right_chevron;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">newspaper</i> &#x2014; material icon named "newspaper"
  /// and <i class='cupertino-icons md-36'>news_solid</i> &#x2014; cupertino icon named "news_solid".
  static IconData get newspaper => !_isCupertinoPlatform() ? Icons.newspaper : CupertinoIcons.news_solid;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">arrow_forward</i> &#x2014; material icon named "arrow forward"
  /// and <i class="material-icons md-36">arrow_forward_ios</i> &#x2014; material icon named "arrow forward ios".
  ///
  /// This icon is the same as [PlatformAdaptiveIcons.arrow_forward].
  static IconData get arrow_forward => Icons.adaptive.arrow_forward;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">group</i> &#x2014; material icon named "group"
  /// and <i class='cupertino-icons md-36'>group_solid</i> &#x2014; cupertino icon named "group_solid".
  static IconData get group => !_isCupertinoPlatform() ? Icons.group : CupertinoIcons.group_solid;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">link</i> &#x2014; material icon named "link"
  /// and <i class='cupertino-icons md-36'>link</i> &#x2014; cupertino icon named "link".
  static IconData get link => !_isCupertinoPlatform() ? Icons.link : CupertinoIcons.link;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">text_snippet_outlined</i> &#x2014; material icon named "text_snippet_outlined"
  /// and <i class='cupertino-icons md-36'>news_solid</i> &#x2014; cupertino icon named "news_solid".
  static IconData get text_snippet_outlined =>
      !_isCupertinoPlatform() ? Icons.text_snippet_outlined : CupertinoIcons.news_solid;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">lock</i> &#x2014; material icon named "lock"
  /// and <i class='cupertino-icons md-36'>padlock_solid</i> &#x2014; cupertino icon named "padlock_solid".
  static IconData get lock => !_isCupertinoPlatform() ? Icons.lock : CupertinoIcons.padlock_solid;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">edit_note</i> &#x2014; material icon named "edit_note"
  /// and <i class='cupertino-icons md-36'>create</i> &#x2014; cupertino icon named "create".
  static IconData get edit_note => !_isCupertinoPlatform() ? Icons.edit_note : CupertinoIcons.create;

  /// Platform-adaptive icon for
  /// <i class="material-icons md-36">person</i> &#x2014; material icon named "person".
  /// and <i class='cupertino-icons md-36'>person</i> &#x2014; cupertino icon named "person".
  static IconData get person => !_isCupertinoPlatform() ? Icons.person : CupertinoIcons.person;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/robot/1.7.12/64.png "robot") material design icon named "robot".
  /// and <i class='cupertino-icons md-36'>command</i> &#x2014; cupertino icon named "command".
  static IconData get automation => !_isCupertinoPlatform() ? MdiIcons.robot : CupertinoIcons.command;

  /// Platform-adaptive icon for
  /// ![Icon preview](https://fafre.github.io/flutter_material_design_icons/icons/cancel/1.9.32/64.png "cancel") material design icon named "robot".
  /// and <i class='cupertino-icons md-36'>xmark_circle</i> &#x2014; cupertino icon named "clear_circled".
  static IconData get cancel => !_isCupertinoPlatform() ? MdiIcons.cancel : CupertinoIcons.clear_circled;
}

/// Returns whether the current platform on which the framework is currently
/// executing is a Cupertino one.
bool _isCupertinoPlatform() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
  }
}
