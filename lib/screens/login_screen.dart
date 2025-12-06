import 'package:flutter/material.dart';
import '../services/data_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      DataService().setUsername(_usernameController.text);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Ederi Ne?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1E88E5),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hoş Geldiniz!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) => value!.isEmpty ? 'Kullanıcı adı gerekli' : null,
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    filled: true,
                    fillColor: const Color(0xFFF5F6F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Şifre gerekli' : null,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    filled: true,
                    fillColor: const Color(0xFFF5F6F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Giriş Yap', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}