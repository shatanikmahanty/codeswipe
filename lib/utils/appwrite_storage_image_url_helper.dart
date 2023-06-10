import 'package:codeswipe/configurations/configurations.dart';
import 'package:codeswipe/utils/environment_helper.dart';

String getStorageFileUrl(String fileId) => '$kApiEndpoint/storage/buckets/'
    '${EnvironmentHelper().getStorageBucketId()}/'
    'files/$fileId/view';
