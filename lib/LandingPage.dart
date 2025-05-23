import 'package:flutter/material.dart';

import 'HomePage.dart';


class PageofLand extends StatelessWidget{
  const PageofLand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center( // Center the entire stack in the screen
        child: Container(
          width: 512,
          height: 1024,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -65,
                top: 130,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: Color.fromARGB(255, 166, 197, 222),
                ),
              ),
              Positioned(
                left: -60,
                top: 205,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: Color.fromARGB(255, 87, 145, 192),
                ),
              ),
              Positioned(
                left: -60,
                top:280,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: Color.fromARGB(255, 41, 103, 154),
                ),
              ),
              Positioned(
                left: -60,
                top: 355,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: Color.fromARGB(255, 16, 51, 80),
                ),
              ),
              Positioned(
                left: -60,
                top: 430,
                child: Icon(
                  Icons.folder,
                  size: 520,
                  color: Color.fromARGB(255, 8, 37, 62),
                ),
              ),

              Positioned(
                left: 20,
                top: 100,
                child: Text(
                  'FILE EXPLORER',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 37, 62),
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom:  80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileHome(),
                      ),
                    );
                  },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 82, 122, 155),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  child: Text('Start',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 