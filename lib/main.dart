import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff7e6551),
        appBar: AppBar(
            title: const Center(
              child: Text("Dice Game",
              style: TextStyle(
                color: Colors.black
              ),
              ),
            ),
            backgroundColor: const Color(0xffFDF4DC),
        ),
        body: const SafeArea(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Rule:\n* You must match the Dice number to win!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                ),
                DicePage(),
                Padding(
                  padding: EdgeInsets.all(75.0),
                  child: SizedBox(),
                )
              ],
            )
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1 + Random().nextInt(6);
  int right = 1 + Random().nextInt(6);
  String resultMessage = ""; // Message to show "You won!" or "You lost!"
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Text("Press the dice to play!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset("images/dice$left.png")),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset("images/dice$right.png")),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(resultMessage,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void ChangeValue(){
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    if (left == right){
      resultMessage = "Congratulations!\nYou won! 🎉";
    }
    else {
      resultMessage = "You lost! Try again. 😢";
    }
  }

}
