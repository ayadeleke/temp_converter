import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const SearchBar(
      {Key? key,
      required this.hintText,
      required this.onSubmitted,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: hintText, // ... decoration code ...
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => onSubmitted(controller.text),
        ),
      ],
    );
  }
}
