import 'package:beat_box/const/const.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.textController,
    required this.validator,
    this.onChanged,
  });
  final String hintText;
  final IconData icon;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 30, right: 40, left: 40),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: onChanged,
        validator: validator,
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            size: 25,
            color: kblack,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: kblack),
          filled: true,
          fillColor: klightblue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(width: 0, color: kwhite),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(width: 0, color: klightblue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
