import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final supabase = Supabase.instance.client;

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        // backgroundColor: backgroundColor,
      ),
    );
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
// Colors
// const kBackgroundColor = Color(0xFFE7EEFB);
// const kSidebarBackgroundColor = Color(0xFFF1F4FB);
// const kCardPopupBackgroundColor = Color(0xFFF5F8FF);
// const kPrimaryLabelColor = Color(0xFF242629);
// const kSecondaryLabelColor = Color(0xFF797F8A);
// const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
// const kCourseElementIconColor = Color(0xFF17294D);

// // Text Styles
// var kLargeTitleStyle = TextStyle(
//   fontSize: 28.0,
//   fontWeight: FontWeight.bold,
//   color: kPrimaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kTitle1Style = TextStyle(
//   fontSize: 22.0,
//   fontWeight: FontWeight.bold,
//   color: kPrimaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kCardTitleStyle = TextStyle(
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   fontWeight: FontWeight.bold,
//   color: Colors.white,
//   fontSize: 22.0,
//   decoration: TextDecoration.none,
// );
// var kTitle2Style = TextStyle(
//   fontSize: 20.0,
//   fontWeight: FontWeight.bold,
//   color: kPrimaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kHeadlineLabelStyle = const TextStyle(
//   fontSize: 17.0,
//   fontWeight: FontWeight.w800,
//   color: kPrimaryLabelColor,
//   fontFamily: 'SF Pro Text',
//   decoration: TextDecoration.none,
// );
// var kSubtitleStyle = TextStyle(
//   fontSize: 16.0,
//   color: kSecondaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kBodyLabelStyle = TextStyle(
//   fontSize: 16.0,
//   color: Colors.black,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kCalloutLabelStyle = TextStyle(
//   fontSize: 16.0,
//   fontWeight: FontWeight.w800,
//   color: kPrimaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kSecondaryCalloutLabelStyle = TextStyle(
//   fontSize: 16.0,
//   color: kSecondaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kSearchPlaceholderStyle = TextStyle(
//   fontSize: 13.0,
//   color: kSecondaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kSearchTextStyle = TextStyle(
//   fontSize: 13.0,
//   color: kPrimaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );
// var kCardSubtitleStyle = TextStyle(
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   color: const Color(0xE6FFFFFF),
//   fontSize: 13.0,
//   decoration: TextDecoration.none,
// );
// var kCaptionLabelStyle = TextStyle(
//   fontSize: 12.0,
//   color: kSecondaryLabelColor,
//   fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
//   decoration: TextDecoration.none,
// );

const developers = '''
Godwin V. Bardiago
Joseph Brendan D. Santa Monica
Paul Ace Malapit
Marvin Navero
Vince Valeros
Jarenz Culaeng''';
