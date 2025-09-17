import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/blocs/theme_cubit/theme_cubit.dart';

class KeyboardGuideDialog extends StatelessWidget {
  const KeyboardGuideDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const KeyboardGuideDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.themeConfig;

    return Theme(
      data: theme.materialTheme,
      child: AlertDialog(
        backgroundColor: theme.materialTheme.scaffoldBackgroundColor,
        title: Text(
          '⌨️ Keyboard Shortcuts',
          style: theme.materialTheme.textTheme.bodyLarge,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _KeyboardShortcutItem(
              shortcut: 'H',
              description: 'Toggle High Contrast',
            ),
            SizedBox(height: 8),
            _KeyboardShortcutItem(
              shortcut: 'A',
              description: 'Toggle Announcements',
            ),
            SizedBox(height: 8),
            _KeyboardShortcutItem(
              shortcut: 'K',
              description: 'Show Keyboard Guide',
            ),
            SizedBox(height: 8),
            _KeyboardShortcutItem(
              shortcut: 'R',
              description: 'Reset/Restart',
            ),
            SizedBox(height: 8),
            _KeyboardShortcutItem(
              shortcut: 'Space',
              description: 'Center on Tim',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _KeyboardShortcutItem extends StatelessWidget {
  final String shortcut;
  final String description;

  const _KeyboardShortcutItem({
    required this.shortcut,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state.themeConfig;
    final isHighContrast = context.watch<ThemeCubit>().state.isHighContrast;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: isHighContrast
                ? Colors.black
                : theme.materialTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isHighContrast
                  ? Colors.white
                  : theme.materialTheme.primaryColor.withValues(alpha: 0.3),
              width: isHighContrast ? 2 : 1,
            ),
          ),
          child: Text(
            shortcut,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: isHighContrast ? Colors.white : theme.materialTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            description,
            style: theme.materialTheme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}