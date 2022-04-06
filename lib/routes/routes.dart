import 'package:flutter/material.dart';

import 'package:stripe_app/enums/enums.dart';
import 'package:stripe_app/pages/pages.dart';

// Map with application routes
final Map<String, WidgetBuilder> routes = {
  ROUTES.homePage.name: (_) => const HomePage(),
  ROUTES.completePaymentPage.name: (_) => const CompletePaymentPage(),
};
