import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.headerText, required this.onTapSeeAll,
  });

  final String headerText;
  final VoidCallback onTapSeeAll;


  @override
  Widget build(BuildContext context) {


    final theme = TextTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headerText,
          style: theme.headlineMedium,
        ),
        TextButton(onPressed: onTapSeeAll,
            child: Text("see all",style: theme.headlineSmall,))
      ],
    );
  }
}


