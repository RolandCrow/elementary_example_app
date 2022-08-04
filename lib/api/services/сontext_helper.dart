
import 'package:flutter/material.dart';

class ContextHelper { // помощь в контексте 

  MediaQueryData getMediaQuery(BuildContext context) =>
      MediaQuery.of(context);
}