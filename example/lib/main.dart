import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Virtual Keyboard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Holds the text that user typed.
  String text = '';
  // CustomLayoutKeys _customLayoutKeys;
  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  TextEditingController _controllerText;

  @override
  void initState() {
    // _customLayoutKeys = CustomLayoutKeys();
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              _controllerText.text,
              style: TextStyle(color: Colors.red),
            ),
            SwitchListTile(
              title: Text(
                'Keyboard Type = ' + (isNumericMode ? 'VirtualKeyboardType.Numeric' : 'VirtualKeyboardType.Alphanumeric'),
              ),
              value: isNumericMode,
              onChanged: (val) {
                setState(() {
                  isNumericMode = val;
                });
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.black87,
              child: VirtualKeyboard(
                  height: 300,
                  //width: 500,
                  rowVerticalPadding: 4.0,
                  actionKeysContainerColor: Colors.lightBlue.shade900,
                  textColor: Colors.white,
                  fontSize: 26,
                  shiftClickTextColor: Colors.white,
                  shiftClickFontSize: 14,
                  horizontalKeyPadding: 4.0,
                  keyContainerColor: Colors.lightBlue,
                  keyCapBorderRadius: 0.0,
                  shiftClickKeyPadding: 4.0,
                  textController: _controllerText,
                  //customLayoutKeys: _customLayoutKeys,
                  defaultLayouts: [
                    VirtualKeyboardDefaultLayouts.English,
                    VirtualKeyboardDefaultLayouts.German,
                    VirtualKeyboardDefaultLayouts.Spanish,
                    VirtualKeyboardDefaultLayouts.French,
                    VirtualKeyboardDefaultLayouts.Portuguese,
                  ],
                  //reverseLayout :true,
                  type: isNumericMode ? VirtualKeyboardType.Numeric : VirtualKeyboardType.Alphanumeric,
                  onKeyPress: _onKeyPress),
            )
          ],
        ),
      ),
    );
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      text = text + (shiftEnabled ? key.capsText : key.text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (text.length == 0) return;
          text = text.substring(0, text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          text = text + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          text = text + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }
    // Update the screen
    setState(() {});
  }
}
