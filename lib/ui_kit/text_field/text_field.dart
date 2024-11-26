import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppTextField extends StatelessWidget {
  final double width;

  final TextInputType textInputType;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final String? placeholder;
  final String? topText;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.placeholder,
      this.textInputType = TextInputType.text,
      this.width = 0.888,
      this.onChanged,
      this.prefix,
      this.suffix,
      this.topText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (topText != null)
          Text(topText!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 0,
              )),
        if (topText != null) Gap(10),
        SizedBox(
          width: double.infinity,
          child: CupertinoTextField(
            prefix: prefix,
            suffix: suffix,
            placeholder: placeholder,
            placeholderStyle: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 18,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w100,
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            onChanged: onChanged,
            keyboardType: textInputType,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.35),
            ),
          ),
        ),
      ],
    );
  }
}
