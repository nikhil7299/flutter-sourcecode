import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: MyHomePage(title: "Dev Life"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  Color lightDeepPurple = const Color.fromARGB(255, 180, 151, 230);
  Color deepPurple = Colors.deepPurple;
  late bool _passwordVisible;
  // late bool _focus;

  @override
  void initState() {
    _passwordVisible = false;
    // _focus = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              Text(
                "Dev Life",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Web     Mobile",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ],
          ),
          Stack(
            children: [
              GestureDetector(
                onPanDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                child: Container(
                  height: 480,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // color: Colors.red.shade100,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) => input!.isValidEmail()
                          ? null
                          : "Please enter a valid email address",
                      style: const TextStyle(color: Colors.deepPurple),
                      onTap: () {},
                      onChanged: (_) {},
                      controller: _emailController,
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.cancel_outlined),
                          onPressed: _emailController.clear,
                          color: const Color.fromARGB(255, 180, 151, 230),
                          iconSize: 20,
                        ),
                        labelText: "Email",
                        floatingLabelStyle: const TextStyle(
                            color: Colors.deepPurple, fontSize: 25),
                        labelStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 180, 151, 230)),
                        hintText: "Enter Email",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 180, 151, 230)),
                        focusColor: Colors.deepPurple,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                        ),
                        enabled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) => input!.isValidPassword()
                          ? null
                          : "Password must be of size 8 or more with atleast one uppercase,\none lowercase, one digit and one special character.",
                      style: const TextStyle(color: Colors.deepPurple),
                      onTap: () {},
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          iconSize: 20,
                          color: lightDeepPurple,
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelText: "Password",
                        floatingLabelStyle: const TextStyle(
                            color: Colors.deepPurple, fontSize: 25),
                        labelStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 180, 151, 230)),
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 180, 151, 230)),
                        focusColor: Colors.deepPurple,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          fixedSize: const Size(360, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DonatePage(
                                    emailText: _emailController.text,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "----------------- Sign in with Google or Facebook -----------------",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(140, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/google.ico',
                                fit: BoxFit.cover,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Google",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(140, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.facebook_outlined,
                                size: 25,
                              ),
                              Text(
                                "Facebook",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Don't have an account? "),
                        Text(
                          "Sign up",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DonatePage extends StatelessWidget {
  final String emailText;
  const DonatePage({Key? key, required this.emailText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text(
                    "Dev Life",
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Web     Mobile",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                ],
              ),
              Text(
                "Logged in as $emailText",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
