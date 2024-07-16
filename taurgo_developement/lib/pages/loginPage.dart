import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/landingPage.dart';
import 'package:taurgo_developement/pages/signupPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: isLoading
                ? Text(
                    'Login....',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/Taurgo Logo.png', // Adjust the path
                          height: 100, // Optional: Adjust height
                        ),
                        SizedBox(height: 50),
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        _buildTextField('Email Address', _emailController,
                            hint: ''),
                        _buildTextField('Password', _passwordController,
                            obscureText: true),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          // onPressed: handleNavigateToHome,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF124D35),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        TextButton(
                          // onPressed: handleNavigateToRegister,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Don't have an account? Sign up",
                            style: TextStyle(color: Color(0xFF1A1A1A)),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {String hint = '', bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 20, color: Color(0xFF545454))),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: UnderlineInputBorder(),
            ),
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
