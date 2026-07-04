import 'package:flutter/material.dart';

import '../../shered/presentation/utlis/validators.dart';
import '../screen/review_screen.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({super.key});

  static const String name = '/create-review';

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  TextEditingController firstnameTEController = TextEditingController();
  TextEditingController lastnameTEController = TextEditingController();
  TextEditingController reviewTEController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: firstnameTEController,
        
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
        
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
        
                ),
        
                const SizedBox(height: 15,),
        
        
                TextFormField(
        
                  controller: lastnameTEController,
        
        
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
        
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your last name';
                    }
                    return null;
                  },

                ),
        
                const SizedBox(height: 15,),
        
        
        
        
        
                TextFormField(
                  controller: reviewTEController,
        
                  maxLines: 8,
        
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Review',
                    labelText: 'Review',
        
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your review';
                    }
                    return null;
                  },
        
                ),
        
        
        
        
                const SizedBox(height: 30,),
        
        
                FilledButton(onPressed: (){
        
                  if(_formKey.currentState!.validate()){
                    //to do call complete api
        
                    Navigator.pushNamed(context, ReviewScreen.name);
                  }
        
        
                },
                    child: Text("Submit",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                    ))
        
        
        
        
        
        
              ],
            ),
          ),
        ),
      ),

    );
  }
}
