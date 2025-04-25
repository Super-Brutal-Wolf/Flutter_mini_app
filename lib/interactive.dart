import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action is invoked $action($intent) from $context');
    super.invokeAction(action, intent, context);
    return null;
  }
}

class ClearIntent extends Intent {
  const ClearIntent();
}

class ClearAction extends Action<Intent> {
  ClearAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();
    return null;
  }
}

class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

class SelectAllAction extends Action<Intent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );
    return null;
  }
}

class CopyIntent extends Intent {
  const CopyIntent();
}

class CopyAction extends Action<Intent> {
  CopyAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text: selectedString));

    return null;
  }
}

class CopyableTextField extends StatefulWidget {
  const CopyableTextField({super.key, required this.title});

  final String title;
  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: <Type, Action<Intent>>{
        ClearIntent: ClearAction(controller),
        CopyIntent: CopyAction(controller),
        SelectAllIntent: SelectAllAction(controller),
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Row(
                children: [
                  Spacer(),
                  Expanded(child: TextField(controller: controller)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.paste)),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const String title = 'Shortcuts and Action Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.escape): const ClearIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
              const SelectAllIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
              const CopyIntent(),
        },
        child: CopyableTextField(title: title),
      ),
    );
  }
}

void main() => runApp(const MyApp());
