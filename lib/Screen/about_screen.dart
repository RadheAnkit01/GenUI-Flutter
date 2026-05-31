import 'package:flutter/material.dart';
import 'package:gen_ui/Data/App/appdata.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _version = 'Loading...';
  final appData = Appdata();
  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();

    if (!mounted) return;

    setState(() {
      _version = '${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appData = Appdata();

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                Icons.quiz_rounded,
                size: 50,
                color: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              appData.appName,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              appData.appDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            Text(
              appData.appFullDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            _infoTile(context, Icons.verified_rounded, 'Version', _version),

            _infoTile(
              context,
              Icons.person_rounded,
              'Developer',
              appData.developerName,
            ),

            _infoTile(context, Icons.code_rounded, 'Built With', 'Flutter'),

            const SizedBox(height: 24),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Features',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 12),

            _feature('Generate MCQs from any topic'),
            _feature('AI-powered question creation'),
            _feature('Beautiful and modern UI'),
            _feature('Dark & Light Theme'),
            _feature('Fast and responsive'),

            const SizedBox(height: 24),

            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: const Text('Feedback & Suggestions'),
                subtitle: const Text('Help improve the application.'),
                onTap: () {
                  // Add email launcher later
                },
              ),
            ),

            const SizedBox(height: 30),

            Text(
              '© ${DateTime.now().year} ${appData.appName}',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 4),

            Text(
              'Made with Flutter ❤️',
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(
    BuildContext context,
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  Widget _feature(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, size: 18, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}
