import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool loading;

  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 200,
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: AppColors.green,
                onPressed: onPressed,
                child: Text(
                  title,
                  style: TextStyle(color: AppColors.white),
                ),
              ));
  }
}
