import 'package:flutter/material.dart';

class AutoCompleteElement extends StatelessWidget {
  final String fieldName;
  final List<String> options;

  const AutoCompleteElement(
      {super.key, required this.options, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return options.where((String option) {
          return option.contains(textEditingValue.text.toUpperCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            label: Text(fieldName),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
