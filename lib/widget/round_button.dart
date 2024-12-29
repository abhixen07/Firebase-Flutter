import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    this.title,
    this.title2,
    this.onPress,
    this.height = 45,
    this.width = double.infinity,
    this.loading = false,
    this.borderRadius = 12.0,
    this.borderColor = Colors.transparent,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    this.fontWeight = FontWeight.w700,
    this.fontSize = 16.0,
    this.loadingIndicatorColor = Colors.white,
  });

  final bool loading;
  final String? title;
  final Widget? title2;
  final double height, width, borderRadius;
  final VoidCallback? onPress;
  final Color textColor, buttonColor, borderColor, loadingIndicatorColor;
  final EdgeInsetsGeometry padding;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: loading ? null : onPress,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor),
          ),
          padding: padding,
          child: loading
              ? Center(
            child:
            CircularProgressIndicator(color: loadingIndicatorColor),
          )
              : Center(
            child: title2 ??
                Text(
                  title ?? '',style: GoogleFonts.poppins(
                  color: textColor,fontSize: fontSize
                ),

                ),
          ),
        ),
      ),
    );
  }
}