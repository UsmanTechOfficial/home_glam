import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/consts/global_var.dart';

class LoadingOverlay extends StatelessWidget {
  final RxBool isLoading;
  final Widget child;
  final Duration delay;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.delay = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Obx(
          () {
            return AnimatedOpacity(
              opacity: isLoading.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              onEnd: () => isLoading.value ? {} : null,
              child: isLoading.value
                  ? Container(
                      color: colorScheme(context).onSurface.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink(),
            );
          },
        )
      ],
    );
  }
}
