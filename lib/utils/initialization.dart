import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/database_service.dart';

class Initialization {
  static Future initialize(WidgetRef ref) async {
    await DatabaseService().getPlaces(ref);
  }
}
