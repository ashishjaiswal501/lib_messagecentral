import 'package:flutter/material.dart';

class CountryCodeWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  // ignore: use_super_parameters
  const CountryCodeWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Country Code', // Added label
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF243757),
                  fontSize: 16.0,
                ),
          ),
          TextFormField(
            controller: controller,
            obscureText: false,
            focusNode: focusNode,
            //      textInputAction: TextInputAction.done,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.text,
            onFieldSubmitted: (value) {
              controller.text = value;
              FocusScope.of(context).requestFocus(focusNode);
            },
            //  validator: validator,
          ),
        ],
      ),
    );
  }
}
