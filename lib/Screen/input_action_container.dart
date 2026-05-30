import 'package:flutter/material.dart';

class InputActionContainer extends StatefulWidget {
  final Function(String) onSubmitted;
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

  void _handleSubmitted() {
    if (_controller.text.trim().isNotEmpty) {
      widget.onSubmitted(_controller.text.trim());
      _controller.clear(); // Clears the field after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0), // Smooth rounded corners
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Expanded forces the TextField to occupy all space except the button
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) =>
                  _handleSubmitted(), // Triggers on keyboard enter
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none, // Removes the default underline
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Circle Avatar styling for the Enter button
          Material(
            color: Colors.blueAccent,
            shape: const CircleBorder(),
            child: IconButton(
              icon: const Icon(Icons.arrow_upward), // Modern "Send/Enter" arrow
              color: Colors.white,
              iconSize: 20,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              onPressed: _handleSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
