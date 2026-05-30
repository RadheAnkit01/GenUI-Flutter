import 'package:flutter/material.dart';
import 'package:gen_ui/Provider/genUI_provider.dart';
import 'package:gen_ui/Screen/input_action_container.dart';
import 'package:gen_ui/Services/ai_service.dart';
import 'package:gen_ui/Gen%20UI%20Functions/render.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAiThinking = false;

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.watch<GenUiProvider>();
    final list = uiProvider.generatedUiList;

    return Scaffold(
      appBar: AppBar(title: const Text("Generate MCQS")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: renderWidget(context, list[index]),
                );
              },
            ),
          ),

          if (_isAiThinking) _buildThinkingIndicator(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InputActionContainer(
                // Disable the input container completely while AI is working
                onSubmitted: _isAiThinking
                    ? (_) {} // Do nothing if already loading
                    : (prompt) async {
                        setState(() {
                          _isAiThinking = true;
                        });

                        try {
                          final response = await getAiResponse(prompt);
                          if (mounted) {
                            context.read<GenUiProvider>().addNewUiComponent(
                              response,
                            );
                          }
                        } catch (e) {
                          // Handle errors gracefully (e.g., timeout or bad API connection)
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error generating: $e')),
                            );
                          }
                        } finally {
                          if (mounted) {
                            setState(() {
                              _isAiThinking = false;
                            });
                          }
                        }
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThinkingIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Row(
        children: [
          // Modern progress indicator
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          ),
          const SizedBox(width: 16),
          // Thinking text string
          Text(
            "Gemini is thinking...",
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
