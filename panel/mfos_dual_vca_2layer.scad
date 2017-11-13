translate([0,0,2]) rotate([180]) EuroPanel("VCa", 5);

  font = ".SF Compact Display:style=Bold";
  labelFontSize = 7;

module EuroPanel(label, hp) {

  sideOffset = 6;
  panelWidth = hp*5.08;

  Support();
  
  
  difference() {
    cube([hp*5.08, 128.5, 2]);
      
    translate([1,117,1])  {
        linear_extrude(height=2, convexity=4) text(label, size=8, font=font);
    }
    translate([7.5,3]) MountingHole();
    translate([panelWidth - 7.5, 128.5 - 3]) MountingHole();
    /*
adj1: 91.48
in1: 77.61
cv1 66.21
   out1: 54.76
   adj2: 40.69
   in2: 26.92
   cv2: 15.42
   out2: 4.18 
    
    */
    
    
    
    translate ([panelWidth-sideOffset,15, 0]) scale([-1,1,1]) union() {
        translate([0,91.48,0]) KnobHole9mm();
        translate([0,77.61,0]) JackHole();
        translate([0,66.21,0]) JackHole();
        translate([0,54.76,0]) JackHole();
        translate([0,40.69,0]) KnobHole9mm();
        translate([0,26.92,0]) JackHole();
        translate([0,15.42,0]) JackHole();
        translate([0,4.18 ,0]) JackHole();
    }    

    translate([4,12.5,1]) {
        label("i", 77.61);
        label("c", 66.21);
        label("o", 54.76);
        label("i", 26.92);
        label("c", 15.42);
        label("o", 4.18 );        
    }

  }
/*
    color("green", .3)
        translate([panelWidth - sideOffset, 14.25,2])
            cube([1,100,50]);
            */
}

module label(text, y){
      translate([0,y])   {
          linear_extrude(height=2, convexity=4) text(text, size=labelFontSize, font=font, halign="center");
      }
}

module KnobHole16mm() { translate([12.5,0,-.5]) cylinder(h=3, d=8, $fn=12); }
module KnobHole9mm() { translate([6.4,0,-.5]) cylinder(h=3, d=8, $fn=12); }

module JackHole() { translate([6,0,-.5]) cylinder(h=3, d=6.5, $fn=12); }

module LEDHole() { translate([10,0,-.5]) cylinder(h=3, d=5.3, $fn=12); }

module MIDIHole() { translate([10.5,0,-.5]) cylinder(h=3, d=18.5, $fn=24); }

module Support() {
    translate([0,10,0])
    rotate([-90,0,0])
  linear_extrude(108.5)
    polygon([[0,0], [0,2], [1.5,5], [3,5], [3,0]]);
}


module MountingHole() {
  hull() {
    translate([-2,0,-.5]) cylinder(h=3, r=1.6, $fn=12);
    translate([2,0,-.5]) cylinder(h=3, r=1.6, $fn=12);
  }
}

echo(version=version());
