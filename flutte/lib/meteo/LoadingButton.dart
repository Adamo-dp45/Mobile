import 'package:flutte/Theme.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final bool loading;
  final String label;
  final VoidCallback? onPressed;

  const LoadingButton({
    super.key,
    this.loading = false,
    this.label = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyThemeColors.red,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      child: loading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                ),
                const SizedBox(width: 8),
                Text(label),
              ],
            )
          : Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
