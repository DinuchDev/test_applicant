import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentText extends StatelessWidget {
  double? fontSize;
  String title;
  Color? color;
  int? maxLines;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  bool underLine;
  TextOverflow? overflow;
  Color? backgroundColor;

  ContentText({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    this.underLine = false,
    this.overflow,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      style: TextStyle(
          backgroundColor: backgroundColor,
          color: color ?? Colors.grey.withOpacity(1),
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w400,
          overflow: TextOverflow.ellipsis,
          decoration: underLine == true
              ? TextDecoration.underline
              : TextDecoration.none),
    );
  }
}

class IconText extends StatelessWidget {
  SvgPicture? svg;
  String title;
  double? fontSize;
  Color? titleColor;

  IconText(
      {super.key,
      required this.svg,
      required this.title,
      this.fontSize,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          svg ??
              SvgPicture.asset('assets/svg/id_card.svg',
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.color)),
          SizedBox(width: 8.0),
          Text(
            title,
            style: TextStyle(
                color: titleColor ?? Colors.grey.withOpacity(1), fontSize: fontSize ?? 18),
          )
        ],
      ),
    );
  }
}
