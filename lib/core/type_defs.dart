import 'package:fpdart/fpdart.dart';
import 'package:muteverse_flutter_app/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
