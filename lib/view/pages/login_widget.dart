import 'package:flutter/material.dart';
import 'package:singleton_notifier/model/user.dart';
import 'package:singleton_notifier/view/pages/root_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    //usernameTextEditingController. = TextEditingValue(text: "Usuario");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: LoginForm(
          key: widget.key,
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameTextEditingController;
  late TextEditingController passwordTextEditingController;
  late double screenWidth;

  @override
  void initState() {
    super.initState();

    usernameTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            width: screenWidth * 0.8,
            child: TextField(
              controller: usernameTextEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario o E-mail',
                  hintText: 'Usuario o E-mail'),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.8,
            child: TextField(
              controller: passwordTextEditingController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  hintText: 'Contraseña'),
            ),
          ),
          Container(
              width: screenWidth * 2 / 3,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  key: widget.key,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 1)).then((value) {
                      User.current = User(username: "david");

                      print(User.current!.username);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const RootWidget(),
                        ),
                      );
                    });
/*
                    User.current =
                        await Future.delayed(const Duration(seconds: 1), () {
                      return User(username: "david");
                    });
                    */
                  },
                ),
              )),
        ],
      ),
    );
  }
}
