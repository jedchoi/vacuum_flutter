import 'package:vacuum_flutter/common/logger.dart';
import 'package:vacuum_flutter/domain/requirements/recording_requirement.dart';

class RecordingRepository extends IRecordingRequirement {
  @override
  Future<String> getCurrentTime() async {
    DateTime now = DateTime.now();
    logD('${now.toString()}');
    return now
        .toString()
        .split('.')
        .first
        .replaceAll('-', '')
        .replaceAll(':', '')
        .replaceAll(' ', '');
  }
}
