import 'package:flutter/material.dart';

class DialogController {
  BuildContext context;

  DialogController(this.context);

  void showSnackBar(SnackBar snackbar) {
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
