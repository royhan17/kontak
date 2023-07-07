import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/5.jpg"), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                Text(
                  'Login',
                  style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Colors.black,
                      fontSize: 40,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Contaxt App',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: 1.0),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  obscureText: _isObscure,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  obscureText: _isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika autentikasi di sini
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    // Contoh validasi sederhana
                    if (username == 'user' && password == '123') {
                      Navigator.pushNamed(context,
                          '/home'); // Ganti dengan halaman home setelah login berhasil
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Login Failed'),
                            content: Text('Invalid username or password.'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Login',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
