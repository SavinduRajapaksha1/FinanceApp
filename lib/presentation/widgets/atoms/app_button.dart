import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';

enum ButtonType { primary, secondary, outlined, text }
enum ButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled || isLoading || onPressed == null;

    return SizedBox(
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: _getButtonStyle(),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    type == ButtonType.primary ? Colors.white : AppColors.primary,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: _getIconSize()),
                    const SizedBox(width: AppDimensions.paddingS),
                  ],
                  Text(label),
                ],
              ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36;
      case ButtonSize.medium:
        return 44;
      case ButtonSize.large:
        return 52;
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.iconS;
      case ButtonSize.medium:
        return AppDimensions.iconM;
      case ButtonSize.large:
        return AppDimensions.iconM;
    }
  }

  ButtonStyle _getButtonStyle() {
    final baseStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: size == ButtonSize.small
            ? AppDimensions.paddingM
            : AppDimensions.paddingL,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
      ),
    );

    switch (type) {
      case ButtonType.primary:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        );
      case ButtonType.secondary:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(AppColors.secondary),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        );
      case ButtonType.outlined:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(AppColors.primary),
          side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primary, width: 1),
          ),
          elevation: MaterialStateProperty.all(0),
        );
      case ButtonType.text:
        return baseStyle.copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(AppColors.primary),
          elevation: MaterialStateProperty.all(0),
        );
    }
  }
}
