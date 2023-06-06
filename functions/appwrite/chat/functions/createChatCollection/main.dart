import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart';

Future<void> start(final req, final res) async {
  try {
    await createChatCollection(req, res);
  } on Exception catch (e) {
    markFailure(res, e.toString());
    return;
  }
}

void markSuccess(final res, final String message) {
  res.json({
    'success': true,
    'message': message,
  });
}

void markFailure(final res, final String message) {
  res.json({
    'success': false,
    'message': message,
  });
}

//TODO return status
//TODO move string keys to constants
Future<void> createChatCollection(final req, final res) async {
  final envVars = req.variables;

  final eventDocumentData =
      json.decode(envVars['APPWRITE_FUNCTION_EVENT_DATA']);
  final client = Client();
  final database = Databases(client);
  client
      .setEndpoint(envVars['APPWRITE_ENDPOINT'])
      .setProject(
        envVars['PROJECT_ID'],
      )
      .setKey(envVars['API_KEY']);

  final String userId1 = eventDocumentData['user_id1'];
  final String userId2 = eventDocumentData['user_id2'];
  final String databaseId = eventDocumentData['\$databaseId'];

  final userRole1 = Role.user(userId1);
  final userRole2 = Role.user(userId2);

  final collectionID = ID.unique();
  final collection = await database.createCollection(
    collectionId: collectionID,
    name: 'chat',
    documentSecurity: false,
    permissions: [
      Permission.read(userRole1),
      Permission.read(userRole2),
      Permission.write(userRole1),
      Permission.write(userRole2),
    ],
    databaseId: databaseId,
  );

  ///TODO need to modify user documents to include chat ids
  await _defineChatDocument(res, collection.$id, databaseId, database);
  markSuccess(res, 'Chat Collection created successfully');
}

Future<void> _defineChatDocument(final res, String collectionId,
    String databaseId, Databases database) async {
  try {
    await database.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'sender_name',
      size: 255,
      xrequired: true,
    );

    await database.createStringAttribute(
      collectionId: collectionId,
      databaseId: databaseId,
      key: 'sender_id',
      size: 255,
      xrequired: true,
    );

    await database.createStringAttribute(
      collectionId: collectionId,
      databaseId: databaseId,
      key: 'message',
      size: 10000,
      xrequired: true,
    );

    await database.createDatetimeAttribute(
      collectionId: collectionId,
      databaseId: databaseId,
      key: 'time',
      xrequired: true,
    );

    await database.createEnumAttribute(
      collectionId: collectionId,
      databaseId: databaseId,
      key: 'message_type',
      elements: ['IMAGE', 'VIDEO', 'TEXT'],
      xdefault: 'TEXT',
      xrequired: false,
    );
  } on AppwriteException catch (e) {
    markFailure(res, e.message.toString());
    return;
  } on Exception catch (e) {
    markFailure(res, e.toString());
    return;
  }
}
