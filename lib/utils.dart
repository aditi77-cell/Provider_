

import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)

        
        .showSnackBar(SnackBar(content: Text(text)));
}
