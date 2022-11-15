part of base_usecase;

abstract class ObservableUseCase<Response, Params> extends DisposableUseCase {
  void execute(Function onNext, Function onError, Function onCompleted,
      Params params) async {
    logD('ObservableUseCase excute: $params');
    StreamSubscription<Response> subscription =
        ((createUseCase(params!))).listen((data) {
      onNext(data);
    });
    subscription.onError((e) {
      onError(e);
    });
    subscription.onDone(() {
      onCompleted;
    });
    addSubscription(subscription);
  }

  Stream<Response> createUseCase(Params params);
}
