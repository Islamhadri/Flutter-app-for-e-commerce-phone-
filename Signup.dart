import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phonelController =
      TextEditingController(); // Corrigé ici

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('inscrire ici'),
          titleTextStyle: TextStyle(wordSpacing: 2, fontFamily: appFlavor),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 135, 96, 139),
          actions: <Widget>[
            Icon(
              Icons.notification_add,
            ),
            Icon(
              Icons.masks_sharp,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 96, 99, 139),
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
                  Navigator.pushNamed(context, '/');
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
        body: Stack(children: <Widget>[
          // Widget pour le fond (image, couleur, dégradé, etc.)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/acot.jpg'), // Chemin de ton image
                fit: BoxFit.cover, // Étendre l'image pour couvrir toute la page
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Champ pour le nom
                  TextField(
                    controller: nomController,
                    decoration: InputDecoration(
                      labelText: "Name user",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Champ pour l'email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Champ pour la date de naissance
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: "Date de naissance",
                      hintText: "JJ/MM/AAAA",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly:
                        true, // Pour empêcher l'utilisateur de taper directement.
                    onTap: () async {
                      // Affiche le sélecteur de date.
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900), // Date minimale.
                        lastDate: DateTime(2026), // Date maximale.
                      );
                    },
                  ),
                  SizedBox(height: 16),

                  // Champ pour le téléphone
                  TextField(
                    controller: phonelController, // Corrigé ici
                    keyboardType: TextInputType.number, // Clavier numérique.
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly, // Permet uniquement les chiffres.
                      LengthLimitingTextInputFormatter(
                          10), // Limite à 10 caractères.
                    ],
                    decoration: InputDecoration(
                      labelText: "Numéro de téléphone",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),

                  // Bouton de validation
                  ElevatedButton(
                    onPressed: () {
                      if (nomController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          dateController.text.isEmpty ||
                          phonelController.text.isEmpty) {
                        // Si un champ est vide, afficher un message d'erreur
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez remplir tous les champs.'),
                          ),
                        );
                      } else {
                        // Si tous les champs sont remplis, afficher un message de succès
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Inscription réussie!'),
                          ),
                        );
                      }
                    },
                    child: Text('Valider'),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
