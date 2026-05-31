import 'package:flutter/material.dart';

class InputActionContainer extends StatefulWidget {
  final Future<void> Function(String) onSubmitted;
  final String hintText;

  const InputActionContainer({
    super.key,
    required this.onSubmitted,
    this.hintText = 'Enter your question...',
  });

  @override
  State<InputActionContainer> createState() => _InputActionContainerState();
}

class _InputActionContainerState extends State<InputActionContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _handleSubmitted() {
  //   final text = _controller.text.trim();

  //   if (text.isEmpty) return;

  //   widget.onSubmitted(text);
  //   _controller.clear();
  // }
  Future<void> _handleSubmitted() async {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    try {
      await widget.onSubmitted(text);

      _controller.clear(); // clear only after success
    } catch (e) {
      // text remains for retry
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              controller: _controller,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) async {
                await _handleSubmitted();
              },
              style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
              cursorColor: colorScheme.primary,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          const SizedBox(width: 8),

          FilledButton(
            onPressed: () async {
              await _handleSubmitted();
            },
            style: FilledButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(14),
            ),
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        ],
      ),
    );
  }
}
