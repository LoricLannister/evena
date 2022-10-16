import 'package:evena/weddingCreation.dart';
import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController signinEmailController = TextEditingController();
  final TextEditingController signinPasswordController =
      TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool isLoginSelected = true;
  bool isSigninSelected = false;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    loginEmailController.dispose();
    signinEmailController.dispose();
    loginPasswordController.dispose();
    signinPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black87,
        ),
        title: const Text(
          'AUTORISATION',
          style: TextStyle(color: Colors.purple),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (isLoginSelected) {
                if (loginEmailController.text.trim().isEmpty ||
                    loginPasswordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all fields',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  //On passe à la page suivante
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarriageCreation(),
                    ),
                    (route) => false,
                  );
                }
              } else {
                if (signinEmailController.text.trim().isEmpty ||
                    signinPasswordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all fields',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  //On passe à la page suivante
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarriageCreation(),
                    ),
                    (route) => false,
                  );
                }
              }
            },
            icon: const Icon(Icons.arrow_forward),
            color: Colors.black87,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: Colors.black54),
            const SizedBox(height: 15),
            const Text(
              'Connect and start\npreparing',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 15),
            Container(
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/google.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const Text('Login with Google'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/facebook.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Login with Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Expanded(
                  flex: 6,
                  child: Divider(
                    indent: 15,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 5),
                Text('OR'),
                SizedBox(width: 5),
                Expanded(
                  flex: 6,
                  child: Divider(
                    endIndent: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.purple),
                      color:
                          isSigninSelected ? Colors.purple : Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isLoginSelected) {
                            isLoginSelected = false;
                            isSigninSelected = !isSigninSelected;
                          }
                        });
                      },
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color:
                                isSigninSelected ? Colors.white : Colors.purple,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.purple),
                      color:
                          isLoginSelected ? Colors.purple : Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isSigninSelected) {
                            isSigninSelected = false;
                            isLoginSelected = !isLoginSelected;
                          }
                        });
                      },
                      child: Center(
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color:
                                isLoginSelected ? Colors.white : Colors.purple,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: isLoginSelected
                    ? loginEmailController
                    : signinEmailController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: isLoginSelected
                    ? loginPasswordController
                    : signinPasswordController,
                obscureText: isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    }),
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
