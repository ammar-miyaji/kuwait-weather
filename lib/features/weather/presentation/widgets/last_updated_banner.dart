import 'package:flutter/material.dart';

class LastUpdatedBanner extends StatelessWidget {
  final DateTime lastUpdated;

  const LastUpdatedBanner({super.key, required this.lastUpdated});

  @override
  Widget build(BuildContext context) {
    final difference = DateTime.now().difference(lastUpdated);
    final text = _formatDifference(difference);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Text(
        'Last updated: $text',
        textAlign: TextAlign.center,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  String _formatDifference(Duration difference) {
    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} min ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    return '${difference.inDays}d ago';
  }
}
