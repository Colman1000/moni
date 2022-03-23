import 'package:flutter/material.dart';
import 'package:moni/config/colors.dart';
import 'package:moni/config/constants.dart';
import 'package:moni/widgets/moni_text.dart';

class Helpers {
  static void showSnackBar(String message,
      {SnackbarType type = SnackbarType.log}) {
    Color _color;
    switch (type) {
      case SnackbarType.error:
        _color = MoniColors.redDarkest;
        break;
      case SnackbarType.success:
        _color = MoniColors.greenDarkest;
        break;
      case SnackbarType.log:
        _color = MoniColors.darkDarkest;
        break;
    }

    Constants.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content:
            MoniText(message, color: MoniColors.light, align: TextAlign.center),
        backgroundColor: _color,
        dismissDirection: DismissDirection.endToStart,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class Format {
  // static const String _currency = '₦';
  static const String _currency = 'N';

  static String toCurrency(num amount) {
    final number = amount.round().toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    return '$_currency$number';
  }
}

enum SnackbarType { error, success, log }
