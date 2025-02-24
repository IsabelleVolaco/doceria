import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key})

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //Controladores para campos texto

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    
    void _login{
      print('Fiz o login...');
    }

    void _register{

    }

    void _resetPassword{

    }

   @override 
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN DO BOLO'),backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ou start, spacebetween....
          children: [

            //Campo email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.emailAddress, //adiciona tipos de verificação - ''qual a informação/tipo que vem do teclado?''
            ),
            const SizedBox(height: 16),

            //Campo senha
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder()
              ),
              obscureText: true, //esconde senha
            ),
            const SizedBox(height: 25),
            //botão login
            ElevatedButton(
              onPressed: _login, 
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50)
              ),
              child: const Text('Entrar!!') // quando entrar, chama o metodo login > com future, metodo assincrono, pois é um metodo sincrono que chama a API de forma assíncrona
            ),
            const SizedBox(height: 10),

              //botão registro
            ElevatedButton(
              onPressed: _login, 
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50)
              ),
              child: const Text('Registre-se!!')
            ),
            const SizedBox(height: 10),

               //botão esqueci a senha
            ElevatedButton(
              onPressed: _resetPassword, 
              child: 
             
            ),
            const SizedBox(height: 10),
    
          ],

        ),
        ),
     );
   } 
}