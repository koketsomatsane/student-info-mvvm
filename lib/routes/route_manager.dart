/*import 'package:flutter/material.dart';
import 'package:routes_navigation_2026/views/confirm_page.dart';
import 'package:routes_navigation_2026/views/edit_name_page.dart';
import 'package:routes_navigation_2026/views/student_details_page.dart';
import 'package:views/details_view.dart';
import 'package:views/edit_view.dart';
import 'package:views/confirm_view.dart';

class RouteManager {
  // Static routes
  static const String home = '/';
  static const String details = '/details';
  static const String edit = '/edit';
  static const String confirm = '/confirm';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case details:
        final message = settings.arguments as String; // dynamic route
        return MaterialPageRoute(
          builder: (_) => DetailsView(message: message),
        );

      case edit:
        return MaterialPageRoute(builder: (_) => const EditView());

      case confirm:
        return MaterialPageRoute(builder: (_) => const ConfirmView());

      default:
        throw Exception('Route not found');
    }
  }
}*/