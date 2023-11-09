import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:resume/firebase_option.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
