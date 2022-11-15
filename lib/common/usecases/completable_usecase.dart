part of base_usecase;

abstract class CompletableUseCase<Response, Params> {
  Future<Response> execute({Params? params});
}
