import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: isLoading
                ? Text(
                    'Creating account....',
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
                          'Create Account',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        _buildTextField('Full Name', _fullNameController,
                            icon: Icons.person),
                        _buildTextField('Email Address', _emailController,
                            icon: Icons.email),
                        _buildTextField('Password', _passwordController,
                            icon: Icons.lock, obscureText: true),
                        _buildTextField(
                            'Confirm Password', _confirmPasswordController,
                            icon: Icons.lock, obscureText: true),
                        SizedBox(height: 50),
                        ElevatedButton(
                          // onPressed: handleSignUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF124D35),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        TextButton(
                          // onPressed: handleNavigateToSignIn,
                          onPressed: () {},
                          child: Text(
                            "Already have an account? Sign in",
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
      {IconData? icon, String hint = '', bool obscureText = false}) {
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
              suffixIcon: icon != null ? Icon(icon) : null,
            ),
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
