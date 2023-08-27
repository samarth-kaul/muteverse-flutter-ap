import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../constants/appwrite_constants.dart';
import '../core/core.dart';
import '../core/providers.dart';
import '../models/user_model.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(
    db: ref.watch(appwriteDatabaseProvider),
    realtime: ref.watch(appwriteRealtimeProvider),
  );
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  final Realtime _realtime;
  UserAPI({
    required Databases db,
    required Realtime realtime,
  })  : _realtime = realtime,
        _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollection,
        documentId: userModel.uid,
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    }
  }
}
