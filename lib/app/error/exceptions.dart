// Copyright 2024 Sifterstudios 

class ServerException implements Exception {
  ServerException(this.message);

  final String message;
}

class HiveException implements Exception {
  HiveException(this.message);

  final String message;
}
