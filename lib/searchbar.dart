import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function(String) onSubmitted;

  const SearchBar({Key? key, required this.hintText, required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            // Retrieve the text from the TextField and execute the search
            // This requires access to the TextField's controller text
          },
        ),
      ],
    );
  }
}
