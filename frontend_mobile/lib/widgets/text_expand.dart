import 'package:flutter/material.dart';

class TextExpand extends StatelessWidget {
  final bool isHidden;
  final Color color;
  final void Function()? onTap;
  const TextExpand(
      {required this.isHidden,
      required this.color,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          !isHidden
              ? Text(
                  "Show Less",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: color),
                )
              : Text(
                  "Show More",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: color),
                ),
        ],
      ),
    );
  }
}
