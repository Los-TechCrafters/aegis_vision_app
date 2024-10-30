import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //icono de usuario
                const Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                    endIndent: 20, indent: 20, height: 60, thickness: 3),

                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de usuario',
                    hintText: 'Ingrese su nombre de usuario',
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    hintText: 'Ingrese su contraseña',
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirmar Contraseña',
                    hintText: 'Confirme su contraseña',
                  ),
                ),

                Divider(
                    endIndent: 20, indent: 20, height: 60, thickness: 3),

                //¿Aún no tienes una cuenta? Regístrate aqui! en letras y el registrate que sea un link a otra pantalla
                RichText(
                  text: TextSpan(
                    text: '¿Ya tienes una cuenta? ',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Inicia sesión aquí',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            //que sea del color principal de la app
                            color: Theme.of(context).colorScheme.primary, // Usa el color principal del esquema de colores
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () {
                        // Usar Navigator.push para navegar a la pantalla de registro

                      },
                      child: const Text('Registrarse'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Usar Navigator.push para ir a subscrition screen
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
