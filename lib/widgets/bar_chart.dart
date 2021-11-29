import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {},
              ),
              const Text(
                'Dec 10, 2021 - Dec 16, 2021',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label : 'Su',
                amountSpent : expenses[0],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'Mo',
                amountSpent : expenses[1],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'Tu',
                amountSpent : expenses[2],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'We',
                amountSpent : expenses[3],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'Th',
                amountSpent : expenses[4],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'Fr',
                amountSpent : expenses[5],
                mostExpensive : mostExpensive,
              ),
              Bar(
                label : 'Sa',
                amountSpent : expenses[6],
                mostExpensive : mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  const Bar({ Key? key, required this.label,
    required this.amountSpent,
    required this.mostExpensive }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}