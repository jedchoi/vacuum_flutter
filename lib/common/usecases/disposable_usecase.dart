import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';

abstract class DisposableUseCase {
  CompositeSubscription _disposables = CompositeSubscription();

  void dispose() {
    if (!_disposables.isDisposed) {
      _disposables.dispose();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscription();
    }
    _disposables.add(subscription);
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}
