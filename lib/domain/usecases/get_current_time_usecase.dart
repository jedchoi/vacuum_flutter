import 'package:vacuum_flutter/common/usecases/base_use_case.dart';
import 'package:vacuum_flutter/common/usecases/disposable_usecase.dart';
import 'package:vacuum_flutter/domain/requirements/recording_requirement.dart';

class GetCurrentTimeUseCase extends CompletableUseCase<String, String> {
  final IRecordingRequirement requirement;
  GetCurrentTimeUseCase({required this.requirement});

  @override
  Future<String> execute({String? params}) {
    return requirement.getCurrentTime();
  }
}
