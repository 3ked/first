import '../../domain/models/models.dart';

const cacheHomeKey = "CACHE_HOME_KEY";
const cacheHomeInterval = 60000; // 1 minute cache in millis
const cacheStoreDetailsKey = "CACHE_STORE_DETAILS_KEY";
const cacheStoreDetailsInterval = 60000; // 1 minute cache in millis

abstract class LocalDataSource {
  Future<Item> getHomeData();

  Future<void> saveHomeToCache(Item homeResponse);

  void clearCache();
  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = <String, CachedItem>{};

  @override
  Future<Item> getHomeData() async {
    CachedItem? cachedItem = cacheMap[cacheHomeKey];

    if (cachedItem != null && cachedItem.isValid(cacheHomeInterval)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      // return an error that cache is not there or its not valid
      throw Exception();
      // throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveHomeToCache(Item homeResponse) async {
    cacheMap[cacheHomeKey] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;

    return isValid;
  }
}
