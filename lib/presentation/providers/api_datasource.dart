import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tafeel/domain/api_data_source.dart';

final apiDataSourceProvider = Provider<ApiDataSource>((ref) => ApiDataSource());
