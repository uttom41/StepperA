import 'package:flutter/material.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        color: const Color(0xFFF6F8F9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Address info",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                minLines: 3,
                maxLines: 4,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Present Address"),
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Permanent Address"),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
