abstract class IPeoplesApiCache {
  Future<void> storeCacheResponse(dynamic res);
  Future<String>getCacheResponse();
}