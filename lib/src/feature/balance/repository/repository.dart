import 'package:quantum/src/feature/balance/models/asset.dart';

import '../../../core/utils/json_loader.dart';

class RepositoryBalance {
  final String key = 'asset';

  Future<List<Asset>> load() {
    return JsonLoader.loadData<Asset>(
      key,
      'assets/json/$key.json',
      (json) => Asset.fromMap(json),
    );
  }

  Future<void> update(Asset updated) async {
    return JsonLoader.modifyDataList<Asset>(
      key,
      updated,
      () async => await load(),
      (item) => item.toMap(),
      (itemList) async {
        final index = itemList.indexWhere((d) => d.id == updated.id);
        if (index != -1) {
          itemList[index] = updated;
        }
      },
    );
  }

  Future<void> save(Asset item) {
    return JsonLoader.saveData<Asset>(
      key,
      item,
      () async => await load(),
      (item) => item.copyWith().toMap(),
    );
  }

  Future<void> remove(Asset item) {
    return JsonLoader.removeData<Asset>(
      key,
      item,
      () async => await load(),
      (item) => item.toMap(),
    );
  }
}
