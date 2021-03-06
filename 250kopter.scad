
$fn=60;

h=25;
innerH=25;
frameDiagonal=230/sqrt(2)/2;

angle=65;
angleOffset=0; 
frameL=113;
frameArmsOffset=0;
frameW=45;
frameWo=3; 
armL=91;
armH=5;
armW=29;
afterMotor=15;
clampHfromC=10;
tubeToMotor=-15;
escOffsetF=60.5;
escOffsetR=66;
propSize=6;
propOffset=25;
plateH=5;
armX=5;

holesDF=118;
holesDR=142;
 
m3boltHole=2.9;


//projection(cut = false) 
//translate([0,10,0])
quadcopter(); 
//color("blue", 0.1)
//translate([0,0,999])
////cylinder(d=180, h=1);
//cube([297,210,4], center=true);
//frame(); 

module quadcopter() {
//    rotate([180,0,0]) 
    frame();
    
//    translate([0,0,2*(armX+2.5)]) 
//    rotate([180,0,0]) 
    {
//        color("grey", 0.5) arms2(armX);   
        
//        translate([0,0,armX+2.5]) 
//        %openMotors(28,20,propOffset);
    }
    
//    color("blue", 0.8)
//    translate([0,-17,plateH+28]) 
//    %battery3S2200mah();
////    %battery3S5000mah();
    
//    %escs(armX+3);
//    gopro();
//    translate([0,53,plateH+28]) 
//    rotate([0,0,90]) 
//    %yi();
    
//    color("black", 0.9)
//    translate([9.5,-frameL/2+60,plateH])
//    rotate([0,0,90])
//    %rx();
    
    color("green", 0.9)
    translate([2,36.5,plateH+16])
    rotate([-90,0,180])
    %vtxTS5823();

//    color("pink")
//    translate([-12,-frameL/2+60,plateH]) 
//    rotate([0,0,-90])
//    %bec();

    color("grey", 0.9)
    translate([0,frameL/2-15,plateH]) 
    %fpvcam();
//    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();
//
//    color("yellow", 0.9)
//    translate([0,-39.5,plateH+12])
//    rotate([0,0,-90])
//    %cc3d(); 
}

module frame() { 
    l=frameL;
    difference() {
        union() {  
            // bottom plate
//            color("gray")
//            framePlate();
            // lower wall
            color("blue")
            frameWall(plateH+0.02,26);
//            color("blue")
//            translate([0,-54,armH/2+armX/2]) 
//            cube([22,11,armH+armX], center=true);
//            vaheplaat();
            // upper wall
//            color("blue") 
//            #frameWall(armX+armH,2); 
            // top plate 
//            framePlate(plateH+26,2);  
//            batterycover(plateH+26,2);
        }    
        armholes(armX,8.5,armH+0.02);  
        holes(); 
         
    
        for(x = [1,-1] ) {
            translate([38*x,0,0]) 
            cube([20,200,200], center=true);
            translate([40*x,0,0]) 
            cube([20,200,200], center=true);
//            translate([30*x,0,armX*2+armH+2])
//            rotate([90,0,0])
//            cylinder(d=4, h=500, center=true, $fn=30); 
        }

        holes(); 

        // vtx cooling slot
        translate([-20,16,plateH+16]) 
        cube([10,22,1.75], center=true);
        
        // usb hole
        translate([0,-60,plateH+18+2]) 
        cube([8,10,4], center=true);
        
        // vtx antenna hole
        translate([23,16,26]) 
        rotate([0,90,0])
        cylinder(d=9.5, h=5, center=true, $fn=6); 
        
        // camera strap hole
        translate([0,65,29]) 
        cube([30,3,4], center=true);
        
        // led holes
        for(x = [13.5:5:22]) for(y = [1,-1] )
        translate([x*y,-frameL/2-3,plateH+8])
        rotate([90,0,0])
        cylinder(d=3, h=5, center=true, $fn=30); 
        for(y = [16,-16] )
        translate([y,-frameL/2-3,plateH+4])
        rotate([90,0,0])
        cylinder(d=3, h=5, center=true, $fn=30); 
     
        translate([0,-55,plateH])
        rotate([0,0,-90])
        xt60();  
        
        translate([0,frameL/2-15,plateH]) 
        fpvcam();
    }
    
    module vaheplaat() {
        difference() {
            framePlate(armX+armH,2);  
            translate([0,54.5,armX+armH]) 
            cube([100,100,5], center=true);
            translate([-2,-39.5,armX+armH+2.02])
            rotate([0,0,-90])
            cc3d();
        } 
    }
    
    module batterycover(z=0,h=plateH,d=10) {  
        
        hull() {
            translate([frameW/2,frameL/2-frameArmsOffset,z])
            cylinder(d=d, h=h);
            translate([-frameW/2,frameL/2-frameArmsOffset,z])
            cylinder(d=d, h=h);
            translate([15,frameL/2+9,z])
            cylinder(d=d, h=h);
            translate([-15,frameL/2+9,z])
            cylinder(d=d, h=h);
        }
        difference() {
            translate([0,0,plateH+27])
            hull() {
                translate([0,-10,0]) 
                cube([43,100,1], center=true);
                translate([0,-10,40]) 
                cube([32,100,1], center=true);
            } 
            translate([0,-17,30.5]) 
            battery3S2200mah();
            translate([0,-17,40.5]) 
            battery3S2200mah();
        } 
    }
}

module framePlate(z=0,h=plateH,d=10,ad=22) { 
    $fn=30;
    x=75;
    hull() {
        translate([frameW/2-frameWo,frameL/2,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo,frameL/2,z])
        cylinder(d=d, h=h);
        
        translate([frameW/2-frameWo,-frameL/2,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo,-frameL/2,z])
        cylinder(d=d, h=h);   
    }
    for(x = [1,-1]) for(y = [0,32,54,55]) 
    hull() {
        translate([frameW/2-frameWo+3,x*y,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo-3,x*y,z])
        cylinder(d=d, h=h); 
    } 
}

module frameWall(z=0,h=4,t=2.4) { 
    $fn=30;
    difference() {
        framePlate(z,h);
        translate([0,0,-1])
        hull() {
            translate([frameW/2-frameWo,frameL/2,z])
            cylinder(d=10-t*2, h=h+2);
            translate([-frameW/2+frameWo,frameL/2,z])
            cylinder(d=10-t*2, h=h+2);
            
            translate([frameW/2-frameWo,-frameL/2,z])
            cylinder(d=10-t*2, h=h+2);
            translate([-frameW/2+frameWo,-frameL/2,z])
            cylinder(d=10-t*2, h=h+2);   
        }
    }
} 

module arms(z=0,d=8,h=armH,w=armW) {
    l=frameDiagonal; 
    $fn=30;
    
    difference() {
        union() {
            translate([(l+propOffset),-l,z]) 
            rotate([0,0,angle])
            arm();
            
            translate([-(l+propOffset),-l,z]) 
            rotate([0,0,-angle]) 
            arm(false);
            
            translate([-(l+propOffset),l,z]) 
            rotate([0,0,180+angle-angleOffset]) 
            arm();
            
            translate([(l+propOffset),l,z]) 
            rotate([0,0,-180-angle+angleOffset]) 
            arm(false);
        } 
         
        holes(); 
    }
            
    module arm(left=true) { 
        difference() {
            union() {
                hull() {
                    translate([0,-3,0])
                    cylinder(d=40, h=1, $fn=90);
                    cylinder(d=29, h=9, $fn=90);
                }
                hull() {
                    translate([w/2-4,0,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,0,0])
                    cylinder(d=d, h=h);
                    if(left) {
                        translate([3,armL,0])
                        cylinder(d=d, h=h);
                        translate([w/2-4,armL-4,0])
                        cylinder(d=d, h=h);
                        translate([-w/2+4,armL-6,0])
                        cylinder(d=d, h=h);
                    }
                    else {
                        translate([-3,armL,0])
                        cylinder(d=d, h=h);
                        translate([w/2-4,armL-6,0])
                        cylinder(d=d, h=h);
                        translate([-w/2+4,armL-4,0])
                        cylinder(d=d, h=h);
                    }
                }
            } 
            th=2.5;
            wall=2.4;
            translate([0,0,3.25])
            cylinder(d=27, h=h+1, $fn=60); 
            translate([0,0,0.25])  
            cylinder(d=9, h=10);
            for(a = [45:180:360]) for(b = [135:180:360]) {
                rotate([0,0,a])
                translate([0,9.5,-1]) 
                cylinder(d=3.3, h=h);

                rotate([0,0,b])
                translate([0,8,-1])
                cylinder(d=3.3, h=h);
            }
            hull() {
                translate([w/2-d/2-wall,20,th])
                cylinder(d=d, h=h);
                translate([-w/2+d/2+wall,20,th])
                cylinder(d=d, h=h);
                translate([w/2-d/2-wall,armL-14,th])
                cylinder(d=d, h=h);
                translate([-w/2+d/2+wall,armL-14,th])
                cylinder(d=d, h=h); 
            }
            hull() {
                translate([0,10,3.25])
                cylinder(d=d, h=h);
                translate([0,20,3.25]) 
                cylinder(d=d, h=h);
            }
            if(left)
            hull() {
                translate([0,armL-16,armH-3.5])
                cylinder(d=7, h=h);
                translate([-8,armL+16,armH-3.5])
                cylinder(d=7, h=h); 
            }
            else 
            hull() {
                translate([0,armL-16,armH-3.5])
                cylinder(d=7, h=h);
                translate([8,armL+16,armH-3.5])
                cylinder(d=7, h=h); 
            }
        }
    }
}

module arms2(z=0,d=8,h=armH,w=armW) {
    l=frameDiagonal; 
    $fn=30;
    
    difference() {
        union() {
            translate([(l+propOffset),-l,z]) 
            rotate([0,0,angle])
            arm();
            
            translate([-(l+propOffset),-l,z]) 
            rotate([0,0,-angle]) 
            arm();
            
            translate([-(l+propOffset),l,z]) 
            rotate([0,0,180+angle-angleOffset]) 
            arm();
            
            translate([(l+propOffset),l,z]) 
            rotate([0,0,-180-angle+angleOffset]) 
            arm();
        } 
         
        holes(); 
    }
            
    module arm() { 
        difference() {
            union() {
                hull() {
                    translate([0,-3,0])
                    cylinder(d=40, h=1, $fn=90);
                    cylinder(d=29, h=9, $fn=90);
                }
                hull() {
                    x=4;
                    translate([w/2-4,0,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,0,0])
                    cylinder(d=d, h=h);  
                    translate([w/2-4,armL+x,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,armL+x,0])
                    cylinder(d=d, h=h);
                }
            } 
            th=2.5;
            wall=2.4;
            translate([0,0,3.25])
            cylinder(d=27, h=h+1, $fn=60); 
            translate([0,0,-0.25])  
            cylinder(d=9, h=10);
            for(a = [45:180:360]) for(b = [135:180:360]) {
                rotate([0,0,a])
                translate([0,9.5,-1]) 
                cylinder(d=3.3, h=h);

                rotate([0,0,b])
                translate([0,8,-1])
                cylinder(d=3.3, h=h);
            }
            hull() {
                translate([w/2-d/2-wall,20,th])
                cylinder(d=d, h=h);
                translate([-w/2+d/2+wall,20,th])
                cylinder(d=d, h=h);
                translate([w/2-d/2-wall,armL-14,th])
                cylinder(d=d, h=h);
                translate([-w/2+d/2+wall,armL-14,th])
                cylinder(d=d, h=h); 
            } 
        }
    }
}

module armholes(z=0,d=8,h=armH,w=armW) {
    l=frameDiagonal; 
    translate([(l+propOffset),-l,z]) 
    rotate([0,0,angle])
    arm();
    
    translate([-(l+propOffset),-l,z]) 
    rotate([0,0,-angle]) 
    arm();
    
    translate([-(l+propOffset),l,z]) 
    rotate([0,0,180+angle-angleOffset]) 
    arm();
    
    translate([(l+propOffset),l,z]) 
    rotate([0,0,-180-angle+angleOffset]) 
    arm();
            
    module arm() {  
        hull() {
            x=4;
            translate([w/2-4,0,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,0,0])
            cylinder(d=d, h=h);  
            translate([w/2-4,armL+x,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,armL+x,0])
            cylinder(d=d, h=h);
        }  
        hull() {
            translate([0,armL-16,3])
            cylinder(d=8, h=h);
            translate([0,armL+16,3])
            cylinder(d=8, h=h); 
        } 
    }
}
    
module holes() { 
    l=frameDiagonal;
    hd=51;
    hd2=41.5;
    h=44;
    d=2.5;
    
    translate([(l+propOffset),-l,-1]) 
    rotate([0,0,angle])
    translate([0,armL/2,0])
    hole();
    translate([-(l+propOffset),-l,-1]) 
    rotate([0,0,-angle])
    translate([0,armL/2,0]) 
    hole(false);
    translate([-(l+propOffset),l,-1]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,armL/2,0])
    hole();
    translate([(l+propOffset),l,-1]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,armL/2,0])
    hole(false); 
        
    translate([frameW/2-frameWo+5,0,3])
    cylinder(d=d, h=h+5);
    translate([-frameW/2+frameWo-5,0,3])
    cylinder(d=d, h=h+5); 
    
    module hole() { 
        $fn=30;
        for(x = [-1,1]) for(y = [40, 49.5] ) {
            translate([x*10,y,0])
            cylinder(d=d, h=h); 
        }
    }
}

module escs(z=9) {
    l=frameDiagonal;
    offset=17;
    color("black", 0.7) { 
        translate([(l+propOffset),-l,z]) 
        rotate([0,0,angle])
        translate([0,armL/2+3,0])
        Xrotor20();
        
        translate([-(l+propOffset),-l,z]) 
        rotate([0,0,-angle])
        translate([0,armL/2+3,0])
        Xrotor20();
        
        translate([-(l+propOffset),l,z]) 
        rotate([0,0,180+angle-angleOffset])
        translate([0,armL/2+3,0])
        Xrotor20();
        
        translate([(l+propOffset),l,z]) 
        rotate([0,0,-180-angle+angleOffset])
        translate([0,armL/2+3,0])
        Xrotor20();
    }
} 

module openMotors(d=28,h=33,o=0) {
    color("grey") {
        translate([(frameDiagonal+o),-frameDiagonal,0]) 
        cylinder(d=d,h=h);
        translate([-(frameDiagonal+o),-frameDiagonal,0]) 
        cylinder(d=d,h=h);
        translate([-(frameDiagonal+o),frameDiagonal,0]) 
        cylinder(d=d,h=h);
        translate([(frameDiagonal+o),frameDiagonal,0]) 
        cylinder(d=d,h=h);
        
        translate([(frameDiagonal+o),-frameDiagonal,0]) 
        cylinder(d=5,h=25);
        translate([-(frameDiagonal+o),-frameDiagonal,0]) 
        cylinder(d=5,h=25);
        translate([-(frameDiagonal+o),frameDiagonal,0]) 
        cylinder(d=5,h=25);
        translate([(frameDiagonal+o),frameDiagonal,0]) 
        cylinder(d=5,h=25);
    }
    
    color("green", 0.08) {
        translate([(frameDiagonal+o),-frameDiagonal,21]) 
        cylinder(d=25.4*propSize,h=5);
        translate([-(frameDiagonal+o),-frameDiagonal,21]) 
        cylinder(d=25.4*propSize,h=5);
    }
    color("red", 0.08) {
        translate([-(frameDiagonal+o),frameDiagonal,21]) 
        cylinder(d=25.4*propSize,h=5);
        translate([(frameDiagonal+o),frameDiagonal,21]) 
        cylinder(d=25.4*propSize,h=5);
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

module Xrotor20() { 
    escW=45;
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

module rx() {
    translate([0,0,5.5]) 
    cube([62,24,11], center=true); 
} 

module vtxTS5823() {
    translate([0,0,4]) {
        cube([29,20,8], center=true);
        translate([-25.5,5,0])
        rotate([0,90,0])
        cylinder(d=8, h=22, $fn=30, center=true);  
    }
}

module bec() {
    translate([0,0,4]) 
    cube([35,19,8], center=true);
}

module fpvcam() {
    translate([0,0,13])
    cube([26,10,26], center=true);
    translate([0,23,13])
    rotate([90,0,0])
    cylinder(d1=15, d2=20, h=18); 
}

module mobius() {
    translate([0,0,9]) 
    cube([35,61,18], center=true);
}

module cc3d() {
    translate([0,0,7]) 
    cube([39,39,14], center=true);
    translate([-5.5,-13.5,4]) 
    cube([16,8,16], center=true);
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