
import 'package:elementary_example_app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget { // выделенный текст

  final String text;
  final String matcher;

  const HighlightedText({
   required this.text,
   required this.matcher,
    Key? key
}): super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  List<TextSpan> _highlightOccurrences(
      String sources,
      String query,
      ) {
    final matches = query // все совпадения записываются в нижний регистр
        .trim()
        .toLowerCase()
        .split(' ')
        .expand((word) => word.allMatches(sources.toLowerCase()));

    if(matches.isEmpty) {
      return [];
    }

    final defaultStyle = AppTypography.body;

    final matchStyle = defaultStyle.copyWith(fontWeight: FontWeight.w800);

    var lastMatchEnd = 0;
    final span = <TextSpan>[];

    for(final match in matches) {
      if(match.end >= lastMatchEnd) {
          if(match.start <= lastMatchEnd) {
            span.add( TextSpan(
              text: sources.substring(lastMatchEnd, match.end),
              style: matchStyle,
            ));
          } else {
            span.addAll([ // пробежка по выделенному тексту
              TextSpan(
                text: sources.substring(lastMatchEnd, match.start),
                style: matchStyle,
              ),
              TextSpan(
                text: sources.substring(match.start, match.end),
                style: matchStyle,
              ),
            ]);
          }
          lastMatchEnd = match.end;
      }
    }
    if(lastMatchEnd < sources.length) {
      span.add(TextSpan(
        text: sources.substring(lastMatchEnd, sources.length),
        style: defaultStyle,
      ));
    }

    return span;
  }

}