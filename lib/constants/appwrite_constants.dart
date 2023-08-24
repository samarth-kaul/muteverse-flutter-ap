class AppwriteConstants {
  static const String databaseId = '64de6011d27b6355eb6c';
  static const String projectId = '64de5d5c6ac28797ad93';
  static const String endPoint = 'http://localhost:80/v1';

  static const String usersCollection = '63cb8ae73960973b0635';
  static const String tweetsCollection = '63cbd6781a8ce89dcb95';
  static const String notificationsCollection = '63cd5ff88b08e40a11bc';

  static const String imagesBucket = '63cbdab48cdbccb6b34e';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}