// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Instantiation of Failure passes message', () {
    // Arrange
    const message = 'Test message';

    // Act
    final failure = Failure(message);

    // Assert
    expect(failure.message, message);
  });
}
