import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:yorsho_mobile/core/constants/app_colors.dart';
import 'package:yorsho_mobile/core/constants/app_dimensions.dart';

/// App-specific ThemeData on top of shared [AppTheme].
abstract final class BrandTheme {
  /// Light theme.
  static ThemeData get light =>
      _applyBrand(AppTheme.light(seed: AppColors.primary));

  /// Dark theme.
  static ThemeData get dark =>
      _applyBrand(AppTheme.dark(seed: AppColors.primary));

  static ThemeData _applyBrand(ThemeData base) {
    // Keep the fromSeed palette, but force exact brand primary for both
    // light and dark so buttons/links match AppColors.primary.
    final isDark = base.brightness == Brightness.dark;
    // Shared fill for TextFields and disabled FilledButtons.
    final mutedFill = isDark ? AppColors.surfaceContainerHigh : AppColors.grey3;

    var scheme = base.colorScheme.copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondaryContainer: AppColors.orange4, // light orange wash
      onSecondaryContainer: AppColors.primary, // or darker text
      surfaceContainerHigh: mutedFill,
    );
    if (isDark) {
      scheme = scheme.copyWith(
        surface: AppColors.black,
        onSurface: AppColors.white,
        inverseSurface: AppColors.white,
        onInverseSurface: AppColors.black,
        outline: AppColors.white.withValues(alpha: 0.5),
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
      );
    } else {
      scheme = scheme.copyWith(
        inverseSurface: AppColors.black,
        onInverseSurface: AppColors.white,
      );
    }

    final textTheme = _textTheme.apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: isDark ? AppColors.black : null,
      primaryColor: AppColors.primary,
      textTheme: textTheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: scheme.primary,
        selectionColor: scheme.primary.withValues(alpha: 0.3),
        selectionHandleColor: scheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: scheme.surfaceTint,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
      ),
      // Neutral AppBar: container contrast in dark, classic shadow in light.
      // No surfaceTint — seed tint is orange and washes the bar.
      appBarTheme: base.appBarTheme.copyWith(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: scheme.onSurface),
        toolbarTextStyle: textTheme.bodyMedium,
        titleTextStyle: textTheme.titleLarge,
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
      tabBarTheme: TabBarThemeData(indicatorColor: scheme.primary),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        selectedColor: scheme.primary,
        checkmarkColor: scheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        labelStyle: TextStyle(color: scheme.onSurface),
        secondaryLabelStyle: TextStyle(color: scheme.onPrimary),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: mutedFill,
        // Match OutlinedButton side color (colorScheme.outline).
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(color: scheme.outline, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(color: scheme.outline, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(color: scheme.primary, width: 2.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(color: scheme.error, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.textFieldBorderRadius,
          ),
          borderSide: BorderSide(color: scheme.error, width: 2.4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: (base.filledButtonTheme.style ?? const ButtonStyle()).merge(
          FilledButton.styleFrom(
            disabledBackgroundColor: mutedFill,
            //disabledForegroundColor: Colors.transparent,
            disabledForegroundColor: scheme.onSurface.withValues(alpha: 0.38),
          ),
        ),
      ),
    );
  }

  /// Typography only — colors come from [ColorScheme] in [_applyBrand].
  static const TextTheme _textTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat-Medium',
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 17,
      fontFamily: 'Montserrat-Medium',
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(fontSize: 13, fontFamily: 'Montserrat-Regular'),
    bodyMedium: TextStyle(fontSize: 15, fontFamily: 'Montserrat-Regular'),
    bodyLarge: TextStyle(fontSize: 17, fontFamily: 'Montserrat-Regular'),
  );
}
