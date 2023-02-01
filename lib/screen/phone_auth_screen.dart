import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth_project/controller/phone_auth_controller.dart';

class PhoneAuthScreen extends StatelessWidget {
  // to use controller we need to create an instance of that controller here before the build method

  PhoneAuthController controller=Get.put(PhoneAuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth"),
        centerTitle: true,
        elevation: 0,
      ),

      body:
      // we will wrap body widget with get builder to manage the state using controller

    GetBuilder<PhoneAuthController>(
      builder: (_)=>

      Padding(
        padding: EdgeInsets.all(16),
        // lets add form for phone and code auth
        child: Form(
          key: controller.formKey,

          child: Column(
            // we want all these widgets to show in center of screen so

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            //we need to add two textfields 1. one for the phone number
            //2. for code authentication

            TextFormField(
              controller: controller.phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //lets add hint and lebel here
                hintText: "03472222",
                labelText: "Phone Number"
              ),

              // lets add validation
              validator: (String? number){
                if(number!.isEmpty){
                  return "Enter Phone Number";
                }
                return null;
              },
            ),
              SizedBox(height: 10,),

            // same we need to add code text field for phone number auhtenictaion
            Visibility(
              visible: controller.isCodeSent,
              child: TextFormField(
                controller: controller.codeController, // we need to create controller
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  //lets add hint and lebel here
                    hintText: "123456",
                    labelText: "Code"
                ),

                // lets add validation
                validator: (String? code){
                  if(code!.isEmpty){
                    return "Enter Code";
                  }else if(code.length<6){
                    return "Code should be of length 6";
                  }

                  return null;
                },
              ),
            ),

            SizedBox(height: 10,),

            // now we need to create a button here to submit the form

            Visibility(
              visible: !controller.isCodeSent,
              child: Container(
                  // we want button to take the same width as the textfield is taking so
                width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: (){

                    if(controller.formKey.currentState!.validate()){

                      //it will show the code field and verify button on submit tap
                      // but we have to hide submit button then so lets implement that
                      controller.showInvisibleWgts();
                    }

                  }, child: Text('Submit'))),
            ),


            Visibility(
              visible: controller.isCodeSent,
              child: Container(
                  // we want button to take the same width as the textfield is taking so
                width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: (){

                    if(controller.formKey.currentState!.validate()){
                      // we will implement functionality here later

                      // lets test the form validation
                    }

                  }, child: Text('Verify'))),
            ),
          ],),
        ),
      ),
    ));
  }
}
