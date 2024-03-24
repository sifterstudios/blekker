// Copyright 2024 Sifterstudios

import 'dart:ui';

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('assert that colors are correct', () {
    expect(BlekkerColors.primaryColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.primaryContrastColor, const Color(0xFF0B201F));
    expect(BlekkerColors.backgroundColor, const Color(0xFF1A1D2F));
    expect(BlekkerColors.secondaryColor, const Color(0xFF123632));
    expect(BlekkerColors.secondaryContrastColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.mainTextColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.mainLabelTextColor, const Color(0xFFACACAC));
    expect(BlekkerColors.secondaryLabelTextColor, const Color(0xFF9A9A9A));
    expect(BlekkerColors.scaffoldBackgroundColor, const Color(0xFF123632));
    expect(BlekkerColors.headlineLargeColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.headlineMediumColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.headlineSmallColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.titleLargeColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.titleMediumColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.titleSmallColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.bodyLargeColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.bodyMediumColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.bodySmallColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.labelLargeColor, const Color(0xFFFFFFFF));
    expect(BlekkerColors.labelMediumColor, const Color(0xFF57EEDD));
    expect(BlekkerColors.labelSmallColor, const Color(0xFF9A9A9A));
  });
}
