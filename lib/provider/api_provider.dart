import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/api/api.dart';

final apiProvider = Provider((ref) => Api());
