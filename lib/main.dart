import 'package:nfc_manager/nfc_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator for dependency injection
  setupServiceLocator();

  runApp(const ProviderScope(child: MyJanjiApp()));
}

class MyJanjiApp extends StatelessWidget {
  const MyJanjiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyJanji',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const NfcTestScreen(), 
    );
  }
}
class NfcTestScreen extends StatefulWidget {
  const NfcTestScreen({super.key});

  @override
  State<NfcTestScreen> createState() => _NfcTestScreenState();
}

class _NfcTestScreenState extends State<NfcTestScreen> {
  String _message = 'Tap "Start Scan" then hold a card to the back of your phone';

  void _startNfcScan() async {
    setState(() => _message = 'Looking for NFC tag...');

    // Checks if NFC is on (the permission you added earlier handles the hardware access)
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (!isAvailable) {
      setState(() => _message = 'Error: NFC is turned off or not supported on this device.');
      return;
    }

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      // This reads the Unique ID of the tag
      debugPrint('Tag found: ${tag.data}');
      
      setState(() {
        _message = '✅ Janji Verified!\nTag ID detected.';
      });

      // Stop scanning so it doesn't keep beeping
      NfcManager.instance.stopSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kitahack NFC Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(_message, 
            textAlign: TextAlign.center, 
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startNfcScan,
        label: const Text('Start Scan'),
        icon: const Icon(Icons.nfc),
      ),
    );
  }
}
