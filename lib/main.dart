import 'package:flutter/cupertino.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() {
    String user = _userController.text;
    String password = _passwordController.text;

    if (user == 'admin' && password == '123') {
      // Navigate to HomePage.dart
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Login Error'),
          content: Text('Wrong email/phone or password.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "BMI BUHAY MO",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ),

              // Username Field with Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.mail),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _userController,
                        placeholder: "Email or Phone",
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Password Field with Icon and Toggle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.lock),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _passwordController,
                        placeholder: "Password",
                        obscureText: _obscureText,
                        padding: EdgeInsets.all(16),
                        suffix: GestureDetector(
                          onTap: _toggleObscureText,
                          child: Icon(
                            _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                            size: 24,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CupertinoButton.filled(
                  child: Text("Log In"),
                  onPressed: _login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}