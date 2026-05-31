import 'package:flutter/material.dart';
import 'package:gen_ui/Data/App/appdata.dart';
import 'package:gen_ui/Provider/genUI_provider.dart';
import 'package:gen_ui/Screen/input_action_container.dart';
import 'package:gen_ui/Services/ai_service.dart';
import 'package:gen_ui/Gen%20UI%20Functions/render.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class GenerateMcqsScreen extends StatefulWidget {
  const GenerateMcqsScreen({super.key});

  @override
  State<GenerateMcqsScreen> createState() => _GenerateMcqsScreenState();
}

class _GenerateMcqsScreenState extends State<GenerateMcqsScreen>
    with SingleTickerProviderStateMixin {
  bool _isAiThinking = false;
  String appName = Appdata().appName;
  late AnimationController _textWaveController;

  @override
  void initState() {
    super.initState();

    _textWaveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _textWaveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiProvider = context.watch<GenUiProvider>();
    final list = uiProvider.generatedUiList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate MCQs',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: list.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: renderWidget(context, list[index]),
                      );
                    },
                  ),
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isAiThinking
                ? _buildThinkingIndicator()
                : const SizedBox.shrink(),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: SafeArea(
              top: false,
              child: InputActionContainer(
                onSubmitted: (prompt) async {
                  if (_isAiThinking) return;

                  setState(() => _isAiThinking = true);

                  try {
                    final response = await getAiResponse(prompt);

                    if (!mounted) return;

                    context.read<GenUiProvider>().addNewUiComponent(response);
                  } catch (e) {
                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to generate MCQs')),
                    );
                  } finally {
                    if (mounted) {
                      setState(() => _isAiThinking = false);
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

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.quiz_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'Generate Your First Quiz',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Ask $appName to create MCQs from any topic.\nExample: Chemistry, Physics, Biology, Mathematics, Java, DSA, DBMS',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThinkingIndicator() {
    debugPrint("Thinking Indicator Rendered");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(child: _waveText('$appName is generating MCQs...')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _waveText(String text) {
    return AnimatedBuilder(
      animation: _textWaveController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(text.length, (index) {
            final phase =
                (_textWaveController.value * 2 * math.pi) + (index * 0.3);

            return Transform.translate(
              offset: Offset(0, -4 * math.sin(phase)),
              child: Text(
                text[index],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
