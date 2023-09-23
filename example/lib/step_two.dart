import 'package:flutter/material.dart';
import 'package:stepper_a/stepper_a.dart';

class StepTwo extends StatefulWidget {
  final StepperAController controller;

  const StepTwo({Key? key, required this.controller}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Address info",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                minLines: 3,
                maxLines: 4,
                onChanged: (c) {
                  //  widget.notifier.onUpdate();
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Present Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                onChanged: (c) {
                  setState(() {});
                },
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Permanent Address"),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: (){
            //         widget.controller.back();
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //             shape: BoxShape.rectangle,
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.green
            //         ),
            //         padding: const EdgeInsets.only(left: 18,right: 18,top: 10,bottom: 10),
            //
            //         child: const Text("Back",style: TextStyle(fontSize: 18,color: Colors.white),),
            //       ),
            //     ),
            //     const SizedBox(width: 12,),
            //     InkWell(
            //       onTap: (){
            //         widget.controller.next();
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //             shape: BoxShape.rectangle,
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.green
            //         ),
            //         padding: const EdgeInsets.only(left: 18,right: 18,top: 10,bottom: 10),
            //
            //         child: const Text("Next",style: TextStyle(fontSize: 18,color: Colors.white),),
            //       ),
            //     )
            // ],
            // )
          ],
        ),
      ),
    );
  }
}
