import 'package:flutter/material.dart';
import 'package:mvvmarc/res/colors.dart';

class RoundedButton extends StatelessWidget {
  String title;
  final bool loading;
  final VoidCallback onPress;

  RoundedButton
      ({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
            child: loading?
            CircularProgressIndicator(color: Colors.white,): Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.whiteColor
              ),
            ),
        ),
      ),
    );
  }
}
