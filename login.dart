import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // Contrôleurs pour les champs de texte
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Liste des éléments de menu
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Action à effectuer lorsqu'on clique sur "Home"
                Navigator.pop(context); // Ferme le drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Action à effectuer lorsqu'on clique sur "Contact Us"
                Navigator.pop(context); // Ferme le drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              onTap: () {
                // Action à effectuer lorsqu'on clique sur "Location"
                Navigator.pop(context); // Ferme le drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Champ pour l'email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Champ pour le mot de passe
            TextField(
              controller: passwordController,
              obscureText: true, // Masque le mot de passe
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Bouton de connexion
            ElevatedButton(
              onPressed: () {
                // Action lors du clic sur le bouton
                String email = emailController.text;
                String password = passwordController.text;
                print("Email: $email");
                print("Password: $password");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, iconSize: 35),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
