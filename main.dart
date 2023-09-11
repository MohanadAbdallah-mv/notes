import 'package:flutter/material.dart';
import 'package:notes/view_models/List_Notes_view_model.dart';
import 'package:notes/views/LogIn.dart';
import 'package:provider/provider.dart';
import 'views/notes_list_view.dart';
import 'services/Cashe_Helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NoteListViewModel(),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
              appBarTheme: AppBarTheme(color: Color(0xff000000)),
              primaryColor: Color(0xFFE2E2E2),
              scaffoldBackgroundColor: Color(0xFF000000)),
          home: NotesListView(),
        ));
  }
}
