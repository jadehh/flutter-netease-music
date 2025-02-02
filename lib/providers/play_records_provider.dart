import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../extension.dart';
import '../repository.dart';
import '../utils/exceptions.dart';
import 'key_value/account_provider.dart';

final allPlayRecordsProvider = FutureProvider<List<PlayRecord>>((ref) async {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    throw NotLoginException('not login');
  }
  final records = await neteaseRepository!.getRecord(
    userId,
    PlayRecordType.allData,
  );
  return records.asFuture;
}).logErrorOnDebug();
