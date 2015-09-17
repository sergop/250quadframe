
$fn=30;

h=25;
innerH=25;
frameDiagonal=230/sqrt(2)/2;

angle=63;
angleOffset=0; 
frameL=100;
frameArmsOffset=0;
frameW=32;
frameWo=0; 
armL=84.5;
armH=5;
armW=24;
afterMotor=15;
clampHfromC=10;
tubeToMotor=-15;
escOffsetF=60.5;
escOffsetR=66;
propSize=6;
propOffset=15;
plateH=5;
armX=5;
mh=4.1;

showProps=true;

holesDF=118;
holesDR=142;
 
m3boltHole=2.9;

//projection(cut = false) 
//translate([-35,0,0])
//rotate([0,90,0])
quadcopter(); 
//color("blue", 0.1)
//translate([0,0,999])
//cylinder(d=180, h=1);
//cube([297,210,4], center=true);
//frame(); 

module quadcopter() {
//    rotate([180,0,0]) 
    translate([0,0,0])
    escTray();
    
//    translate([0,0,2*(armX+2.5)]) 
//    rotate([180,0,0]) 
    {
//        color("grey", 0.5) %arms(armX);   
        
//        translate([0,0,armX+2.5]) 
//        %openMotors(28,20,propOffset);
    }
    
//    color("blue", 0.8)
//    translate([0,-frameL/2+39.5,plateH+26+3]) 
//    %battery3S1300mah();
//    %battery3S2200mah();
//    %battery3S5000mah();
    
    %escs();
//    gopro();
//    translate([0,48,plateH+26+3+12]) 
//    rotate([0,0,90]) 
//    %yi();
    
//    translate([0,-frameL/2+76,plateH+2])  
//    %#buzzer();
    
//    color("black", 0.9)
//    translate([0,-frameL/2+20,plateH])
//    rotate([0,0,90])
//    %d4r();
    
//    color("black", 0.9)
//    translate([0,-frameL/2+29,plateH])
//    rotate([0,0,90])
//    %d8r();
    
//    translate([0,frameL/2-10,plateH-2]) 
//    rotate([15,0,0])
//    %videoBlock();
    
//    color("pink")
//    translate([0,-frameL/2+13,plateH+12])
//    %bec();
    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();

//    color("yellow", 0.9)
//    translate([0,-frameL/2+49,plateH+21])
//    rotate([0,0,-90])
//    %cc3d();  
    
    translate([-17,0,-4]) 
    %xt60(); 
}

module escTray() {
    h=9;
    difference() { 
        union() {
            hull() {
                for(x = [1,-1]) 
                for(y = [1,-1]) {
                    translate([x*23,y*86,-h/2+0.25])
                    cylinder(d=0.1,h=0.5, center=true);
                    translate([0,y*91,-h/2+0.25])
                    cylinder(d=0.1,h=0.5, center=true);
                }
            }
            difference() { 
                union() {
                    linear_extrude(height = h, center = true)
                    import(file = "ZMR250_main_plate.dxf");
                    
                    for(x = [1,-1]) 
                    for(y = [1,-1]) { 
                        translate([x*21,y*50,0])
                        rotate([0,0,20*x*y])
                        cube([19,22,h], center=true);
                    }
                }
                cube([20,150,10], center=true);
                for(y = [1,-1])
                hull() {
                    for(x = [1,-1])  {
                        translate([x*19.5,y*84.55,0])
                        cylinder(d=4.02,h=10, center=true);
                        translate([x*20.7,y*64,0])
                        cylinder(d=4.02,h=10, center=true); 
                        translate([0,y*88,0])
                        cylinder(d=4.03,h=10, center=true);
                        translate([0,y*54,0])
                        cylinder(d=4.03,h=10, center=true);
                    }
                }
                hull() {
                    for(x = [1,-1]) 
                    for(y = [1,-1]) {
                        translate([x*21,y*36,0])
                        cylinder(d=4,h=10, center=true);
                    }
                }
                hull() {
                    for(x = [1,-1]) 
                    for(y = [1,-1]) {
                        translate([x*14,y*35,0])
                        cylinder(d=4.02,h=10, center=true);
                        translate([0,y*70,0])
                        cylinder(d=4.02,h=10, center=true);
                    }
                }
                for(x = [1,-1]) 
                for(y = [1,-1]) {
                    translate([x*27,y*29.04,0])
                    cylinder(d=4.02,h=10, center=true);
                    translate([x*26.46,y*69.59,0])
                    cylinder(d=4.03,h=10, center=true);
                }
                for(x = [1,-1]) 
                for(y = [1,-1]) {
                    translate([x*21,y*49.5,2])
                    rotate([0,0,21*x*y])
                    cube([23,6,6], center=true);
                }
                for(x = [1,-1]) 
                for(y = [1,-1]) {
                    translate([x*21,y*49.5,4])
                    rotate([0,0,21*x*y])
                    cube([23,23,6], center=true);
                }
            }
        }
        for(x = [1,-1]) 
        for(y = [1,-1]) {
            translate([x*19,y*42.5,0])
            cylinder(d=4,h=10, center=true);
            translate([x*28.5,y*46.1,0])
            cylinder(d=4,h=10, center=true);
            translate([x*15,y*53.8,0])
            #cylinder(d=4,h=10, center=true);
            translate([x*24.3,y*57.2,0])
            #cylinder(d=4,h=10, center=true);
        }
//        translate([0,50,0]) 
//        cube([100,100,20], center=true);
    }
}

module escs() {
    l=frameDiagonal;
    offset=17;
    x=11.5;
    y=22;
    color("black", 0.7) { 
        translate([x,y,0])
        Xrotor20();
        
        translate([x,-y,0])
        Xrotor20();
        
        translate([-x,y,0])
        Xrotor20();
        
        translate([-x,-y,0])
        Xrotor20();
    }
}  

module battery3S2200mah() {
    translate([0,0,18.5]) 
    cube([28,110,37], center=true);
} 

module battery3S5000mah() {
    translate([0,0,13]) 
    cube([49,145,26], center=true);
}

module battery3S1300mah() {
    translate([0,0,11.5]) 
    cube([34,71,23], center=true);
} 

module Xrotor20() { 
    escW=33;
    escL=22;
    escH=5.5;
    translate([0,0,escH/2])
    cube([escL, escW, escH], center=true);
}

module gopro() {
    translate([0,0,20.5]) 
    cube([21,59,41], center=true);
}

module yi() {
    translate([0,0,21]) 
    cube([22,61,42], center=true);
}

module buzzer() {
    translate([0,0,12.5]) 
    cube([35,12,25], center=true);
}

module d8r() {
    translate([0,0,3.5]) 
    cube([64,24,7], center=true); 
    translate([15,0,5.5]) 
    cube([34,24,11], center=true); 
} 

module d4r() {
    translate([0,0,3]) 
    cube([40,22.5,6], center=true);  
} 

module videoBlock() {
    
    color("green", 0.9)
    translate([15,3,17]) 
    rotate([90-15,0,0])
    vtxTS5823();
    
    color("grey", 0.9)
    translate([0,13,0])
    fpvcam();
    
    module fpvcam() {
        translate([0,0,13])
        cube([26,10,26], center=true);
        translate([0,23,13])
        rotate([90,0,0])
        cylinder(d1=15, d2=20, h=18); 
    }

    module vtxTS5823() {
        translate([0,0,4]) {
            cube([29,20,8], center=true);
            translate([-23,5,0])
            rotate([0,90,0])
            cylinder(d=8, h=17, $fn=30, center=true);  
            translate([-36.5,5,0])
            rotate([0,90,0])
            cylinder(d=4, h=10, $fn=30, center=true);  
        }
    }
}


module bec() {
    translate([0,0,4]) 
    cube([35,19,8], center=true);
}

module mobius() {
    translate([0,0,9]) 
    cube([35,61,18], center=true);
}

module cc3d() {
    side=36;
    difference() { 
        translate([0,0,2.5]) 
        cube([side,side,5], center=true); 
        
        for(a = [0:90:360]) {
            rotate([0,0,a])
            translate([15.25,15.25,-29]) 
            cylinder(d=3, h=h+5); 
        } 
    }
}

module cc3dAtom() {
    translate([0,0,5.5]) { 
        translate([0,25,0]) 
        cube([20,16,11], center=true);
        hull() {
            cube([20,34,11], center=true);
            translate([0,-20,0]) 
            cylinder(d=3, h=11, $fn=20, center=true); 
        }
        hull() {
            translate([15,15.5,0]) 
            cylinder(d=3, h=11, $fn=20, center=true); 
            translate([-15,15.5,0]) 
            cylinder(d=3, h=11, $fn=20, center=true); 
            translate([0,-20,0]) 
            cylinder(d=3, h=11, $fn=20, center=true); 
        }
    }
}

module pdb() {
    for(y = [0:10:30])
    translate([0,y,0])
    cylinder(d=10, h=14, center=true, $fn=30);
    translate([0,43,-4])
    rotate([0,0,90])
    xt60();
}

module xt60() {
    translate([0,0,8.5/2])
    difference() {
        hull() {
            cube([16, 16, 3], center=true);
            translate([0,-(16-13)/2,0]) cube([16, 13, 8.5], center=true);
        }
        translate([-5,-1.5,-4])
        cube([4, 9, 0.5], center=true);
    }
}