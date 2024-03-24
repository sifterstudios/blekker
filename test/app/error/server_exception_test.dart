// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'ServerException should return a '
      'ServerException with the provided message', () {
    // Arrange
    const message = 'Test message';

    // Act
    final exception = ServerException(message);

    // Assert
    expect(exception, isInstanceOf<ServerException>());
    throwsA(ServerException(message));
    expect(exception.message, message);
  });
}
