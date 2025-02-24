import 'package:flutter/material.dart';
import 'screens/agendamento.dart';
import 'screens/doces.dart';
import 'screens/contato.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Confeitaria',
      //theme: ThemeData(primarySwatch: Colors.blue,
      home: const HomeScreen(),
      //home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE2EE), // Fundo rosa claro
      appBar: AppBar( // APPBAR --------------------------------------------------------------------
        title: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'A Doceria Confeiteira',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF91FFDE), 
        toolbarHeight: 80.0, 
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container( // NAVBAR & BOTÕES --------------------------------------------------------------------
            color: const Color(0xFF73CEB4), 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( // Botões
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  TextButton( // Navegar para a tela de Agendamento
                    onPressed: () {  Navigator.push( context, MaterialPageRoute(builder: (context) => const Agendamento()), ); },
                    child: const Text( 'Agendamento', style: TextStyle(color: Colors.white),),
                  ),

                  TextButton( // Navegar para a tela de Doces
                    onPressed: () {  Navigator.push( context, MaterialPageRoute(builder: (context) => const Doces()), ); },
                    child: const Text( 'Doces', style: TextStyle(color: Colors.white),),
                  ),

                  TextButton( // Navegar para a tela de Contato
                    onPressed: () {  Navigator.push( context, MaterialPageRoute(builder: (context) => const Contato()), ); },
                    child: const Text( 'Contato', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
           // Container branco --------------------------------------------------------------------
            width: 500,
            height: 450,
            alignment:
                Alignment.center, //Itens do container centralizados nele mesmo
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  // Texto 1  --------------------------------------------------------------------
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Bem-vindo à nossa doceria! Venha conhecer os melhores doces da cidade!',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  // Imagem  --------------------------------------------------------------------
                  width: 400,
                  height: 245,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Borda arredondada
                    child: Image.asset( '../assets/baker.jpg', fit: BoxFit.cover ),
                  ),
                ),
                const Padding(
                  // Texto 2  --------------------------------------------------------------------
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'A mistura perfeita entre sabor e carinho.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}


/*
// Tela de Agendamento
class Agendamento extends StatelessWidget {
  const Agendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendamento")),
      body: const Center(child: Text('Tela de Agendamento')),
    );
  }
}


// Tela de Contato
class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contato")),
      body: const Center(child: Text('Tela de Contato')),
    );
  }
}



//botão main
                  TextButton(
                    onPressed: () {
                      // Navegar para a tela de Contato
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Contato()),
                      );
                    },
                    child: const Text(
                      'Contato',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),



*/