import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    super.key,
    required this.isActive,
    required this.controller,
    required this.hintText,
    required this.callBack,
    required this.changeText,
  });

  final bool isActive;
  final TextEditingController controller;
  final String hintText;
  final void Function(bool?)? callBack;
  final void Function(String)? changeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            value: isActive,
            onChanged: callBack,
          ),
          Expanded(
            child: Material(
              child: TextField(
                onChanged: changeText,
                readOnly: !isActive,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}