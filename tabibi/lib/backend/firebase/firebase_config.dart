import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB3CFxQV-HMV1DmjMaMU0W7hRLZuaW8HMY",
            authDomain: "tabibi-30ujrn.firebaseapp.com",
            projectId: "tabibi-30ujrn",
            storageBucket: "tabibi-30ujrn.firebasestorage.app",
            messagingSenderId: "175555830456",
            appId: "1:175555830456:web:63c0512f2fcf41111eca4d"));
  } else {
    await Firebase.initializeApp();
  }
}
