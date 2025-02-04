import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Text('Welcome!'),
              ),
      body:Center( 
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
            children: [ 
              const SizedBox (height:50),
              Text ( 
               'Maciej Malinowski',
                style: GoogleFonts.italiana(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
              Text(
               'Flutter Developer', 
               style: GoogleFonts.italiana(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
                  const SizedBox(height: 50,),
              Text(
              'maciejdevmalinowski@gmail.com', 
               style: GoogleFonts.italiana(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
              Text(
              '883382904', 
               style: GoogleFonts.italiana(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber)),
                  const SizedBox(height: 150,), 
              Text(AppLocalizations.of(context)!.helloWorld), 
            ]
        ),
      ),
    );
  }}