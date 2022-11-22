import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waquar_portfolia/Model/colors.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth > 1200){
            return DesktopNavbar();
          }else if(constraints.maxWidth > 800 && constraints.maxWidth < 1200){
            return DesktopNavbar();
          }else{
            return MobileNavbar();
          }
        }
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40), child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "Waquarism",
                style: GoogleFonts.megrim(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor.withOpacity(0.8),
                      fontSize: 54,
                      letterSpacing: 8,

                    )
                )

            ),
            Row(children: [
              Text(
                "Home",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              SizedBox(width: 30,),
              Text(
                "About us",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              SizedBox(width: 30,),
              Text(
                "Portfolio",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              SizedBox(width: 30,),
              MaterialButton(
                onPressed: (){},
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),),
                child: Text("GetStarted",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                ),
              ),

            ],)
          ],
    ),
          Divider(height: 5,color: underLineColor,)
        ],
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 00),
      constraints: BoxConstraints(maxWidth: 1200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Waquarism",
              style: GoogleFonts.megrim(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                    fontSize: 54,
                  )
              )
          ),
          SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              SizedBox(width: 30,),
              Text(
                "About us",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),
              SizedBox(width: 30,),
              Text(
                "Portfolio",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
              ),


            ],)
        ],
      ),
    );
  }
}

