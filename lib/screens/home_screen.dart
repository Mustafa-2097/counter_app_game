import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    mySnackBar(message, context){
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }
    ButtonStyle buttonStyle = ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(20)),
      backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
      iconColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.orange, width: 2)
          )
      ),
      elevation: WidgetStateProperty.all(10),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D1B69),
        title: Text(
          'COUNTER GAME',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF2D1B69),
              Color(0xFF0F0F0F),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'YOUR SCORE',
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   "$_counter",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 48,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              BlocBuilder<CounterCubit, int>(
                builder: (context, counterValue) {
                  return Text(
                    '$counterValue',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add Button
                  Tooltip(
                    message: "Increase Counter",
                    child: ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().increment(), // 1
                        style: buttonStyle,
                        child: Icon(Icons.keyboard_arrow_up, size: 30)
                    ),
                  ),
                  SizedBox(width: 40),
                  // Reduce Button
                  Tooltip(
                    message: "Decrease Counter",
                    child: ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().decrement(), // 2
                        style: buttonStyle,
                        child: Icon(Icons.keyboard_arrow_down, size: 30)
                    ),
                  ),
                  SizedBox(width: 40),
                  // Reset Button
                  Tooltip(
                    message: "Reset Counter to 0",
                    child: ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().reset(), // 3
                        style: buttonStyle,
                        child: Icon(Icons.refresh, size: 30)
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
