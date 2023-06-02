import 'package:appwrite/appwrite.dart';

class ApiClient {
  final Client client;

  final String endpoint;
  final String projectId;
  final bool selfSigned;

  ApiClient({
    required this.client,
    required this.endpoint,
    required this.projectId,
    this.selfSigned = true,
  }) {
    client.setEndpoint(endpoint);
    client.setProject(projectId);
    client.setSelfSigned(status: selfSigned);

    account = Account(client);
    storage = Storage(client);
    databases = Databases(client);
    realtime = Realtime(client);
    locale = Locale(client);
  }

  late final Account account;

  late final Storage storage;

  late final Databases databases;

  late final Realtime realtime;

  late final Locale locale;
}
