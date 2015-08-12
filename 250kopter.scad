$fn=60;

h=25;
innerH=25;
frameDiagonal=230/sqrt(2)/2;

angle=72;
angleOffset=0; 
frameL=138;
frameW=62;
frameWo=8;
tubeL=100;
armL=79;
armH=6;
armW=28;
afterMotor=15;
clampHfromC=10;
tubeToMotor=-15;
escOffsetF=60.5;
escOffsetR=66;
propSize=6;
propOffset=22;
armX=3;

holesDF=118;
holesDR=142;
 
m3boltHole=2.9;
 
quadcopter();
//frame(); 

module quadcopter() {
//    rotate([180,0,0])
    frame();
    color("grey") arms(armX);   
    
//    translate([0,0,armX+3]) 
//    openMotors(28,20,propOffset);
    
//    color("blue", 0.8)
//    translate([0,-10,19]) 
//    %battery3S2200mah();
    
//    escs(armX+3);
//    gopro();
    
    color("black", 0.9)
    translate([frameW/2-frameWo-11,-frameL/2+33,armX])
    rotate([0,0,90])
    %rx();
    
    color("green", 0.9)
    translate([frameW/2-frameWo-9,frameL/2-14,armX])
    rotate([0,0,90])
    %vtxTS5823();

    color("pink")
    translate([frameW/2-frameWo-34,-frameL/2+24,armX])
    rotate([0,0,90])
    %bec();

//    color("grey", 0.9)
//    translate([0,47,19]) 
//    %fpvcam();
//    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();
//
    color("yellow", 0.9)
    translate([-10,20,armX])
    rotate([0,0,180])
    %cc3dAtom(); 
}

module frame() { 
    l=frameL;
    difference() {
        union() {  
            // bottom plate
            framePlate();
            // wall
            color("blue")
            frameWall(armX-0.02,armH/2,3);
//            color("blue")
//            frameWall(armX+armH/2-0.02,9,3);
            // top plate 
//            framePlate(15);  
        }    
        armholes(armX,8.5,armH+0.02);  
        holes(); 
        
        // vtx and bec cooling slot
//        translate([0,-65,19.5]) 
//        cube([32,10,16], center=true);
        
        // usb cable hole
//        translate([30.3,3.5,15]) 
//        rotate([0,90,0]) 
//        hull() {
//            translate([0,6,0]) 
//            cylinder(d=7, h=10, center=true);
//            cylinder(d=7, h=10, center=true);
//        }
        
        // rx antenna holes
//        translate([-22,-35,30]) 
//        cylinder(d=2, h=10, center=true);
//        translate([-22,-25,30]) 
//        cylinder(d=2, h=10, center=true);    
        
        // vtx antenna hole  
//        translate([27,5,24]) 
//        rotate([0,15,0]) 
//        cylinder(d=3, h=7.5, center=true);
        
        // battery strap slots
//        translate([18,0,30]) 
//        cube([3,30,5], center=true);
//        translate([-18,0,30]) 
//        cube([3,30,5], center=true);

        // led holes
//        for(x = [-19,-15,-11,11,15,19])
//        translate([x,-65,-4])
//        rotate([90,0,0])
//        cylinder(d=3, h=5, center=true, $fn=30); 
    }
}

module framePlate(z=0,h=3,d=10,ad=22) { 
    $fn=30;
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
    hull() {
        translate([-frameW/2,-frameL/2,z])
        rotate([0,0,90-angle])
        translate([0,ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,-frameL/2,z])
        rotate([0,0,-90+angle])
        translate([0,ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,-frameL/2,z])
        cylinder(d=d, h=h);
        translate([-frameW/2,-frameL/2,z])
        cylinder(d=d, h=h);  
        translate([0,-frameL/2+frameL-80,z])
        cylinder(d=d, h=h);
    }
    hull() {
        translate([-frameW/2,frameL/2,z])
        rotate([0,0,-90+angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,frameL/2,z])
        rotate([0,0,90-angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,frameL/2,z])
        cylinder(d=d, h=h);
        translate([-frameW/2,frameL/2,z])
        cylinder(d=d, h=h);
        translate([0,frameL/2-frameL+80,z])
        cylinder(d=d, h=h);
    }
}

module frameWall(z=0,h=4,t=2) { 
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
        
        for(a = [l+propOffset,-l-propOffset], c = [angle,-angle]) 
        for(b = [l,-l], c = [180+angle,-180-angle]) {
            translate([a,b,0])  
            rotate([0,0,c]) {
                cylinder(d=9, h=40);
                translate([0,0,0])  
                cylinder(d=9, h=40);
            }
        }
         
        holes(); 
    }
            
    module arm(left=true) { 
        difference() {
            union() {
                cylinder(d=34, h=h);
                hull() {
                    translate([w/2-4,0,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,0,0])
                    cylinder(d=d, h=h);
                    translate([w/2-4,armL-4,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,armL-4,0])
                    cylinder(d=d, h=h);
                    if(left)
                        translate([3,armL,0])
                        cylinder(d=d, h=h);
                    else
                        translate([-3,armL,0])
                        cylinder(d=d, h=h);
                }
            } 
            th=3;
            translate([0,0,th])
            cylinder(d=28, h=h); 
            for(a = [45:90:360]) 
            rotate([0,0,a])
            hull() {
                translate([0,8,-1])
                cylinder(d=3, h=h);
                translate([0,9.5,-1]) 
                cylinder(d=3, h=h);
            }
            hull() {
                translate([w/2-7,20,th])
                cylinder(d=d, h=h);
                translate([-w/2+7,20,th])
                cylinder(d=d, h=h);
                translate([w/2-7,armL-16,th])
                cylinder(d=d, h=h);
                translate([-w/2+7,armL-16,th])
                cylinder(d=d, h=h); 
            }
            hull() {
                translate([0,0,th])
                cylinder(d=d, h=h);
                translate([0,armL-16,th]) 
                cylinder(d=d, h=h);
            }
            if(left)
            hull() {
                translate([1,armL-16,th])
                cylinder(d=d-2, h=h);
                translate([-8,armL+16,th])
                cylinder(d=d-2, h=h); 
            }
            else 
            hull() {
                translate([-1,armL-16,th])
                cylinder(d=d-2, h=h);
                translate([8,armL+16,th])
                cylinder(d=d-2, h=h); 
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
    arm(false);
    
    translate([-(l+propOffset),l,z]) 
    rotate([0,0,180+angle-angleOffset]) 
    arm();
    
    translate([(l+propOffset),l,z]) 
    rotate([0,0,-180-angle+angleOffset]) 
    arm(false);
            
    module arm(left=true) { 
        cylinder(d=34, h=h);
        hull() {
            translate([w/2-4,0,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,0,0])
            cylinder(d=d, h=h);
            translate([w/2-4,armL-4,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,armL-4,0])
            cylinder(d=d, h=h);
            if(left)
                translate([3,armL,0])
                cylinder(d=d, h=h);
            else
                translate([-3,armL,0])
                cylinder(d=d, h=h);
        }
    }
}
    
module holes() { 
    l=frameDiagonal;
    translate([(l+propOffset),-l,0]) 
    rotate([0,0,angle])
    translate([0,armL/2,0])
    hole();
    translate([-(l+propOffset),-l,0]) 
    rotate([0,0,-angle])
    translate([0,armL/2,0]) 
    hole(false);
    translate([-(l+propOffset),l,0]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,armL/2,0])
    hole();
    translate([(l+propOffset),l,0]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,armL/2,0])
    hole(false);
    
    module hole(left=true) { 
        $fn=30;
        translate([7,armL-46,0])
        cylinder(d=3, h=50, center=true);
        translate([-7,armL-46,0])
        cylinder(d=3, h=50, center=true);
        if(left) {
            translate([2,armL-40,0])
            cylinder(d=3, h=50, center=true);
            translate([15,armL-37,0])
            cylinder(d=3, h=50, center=true);
        }
        else {
            translate([-2,armL-40,0])
            cylinder(d=3, h=50, center=true); 
            translate([-15,armL-37,0])
            cylinder(d=3, h=50, center=true);
        }
    }
}

module escs(z=9) {
    l=frameDiagonal;
    offset=17;
    color("black", 0.7) { 
        translate([(l+propOffset),-l,z]) 
        rotate([0,0,angle])
        translate([0,armL/2,0])
        Xrotor20();
        
        translate([-(l+propOffset),-l,z]) 
        rotate([0,0,-angle])
        translate([0,armL/2,0])
        Xrotor20();
        
        translate([-(l+propOffset),l,z]) 
        rotate([0,0,180+angle-angleOffset])
        translate([0,armL/2,0])
        Xrotor20();
        
        translate([(l+propOffset),l,z]) 
        rotate([0,0,-180-angle+angleOffset])
        translate([0,armL/2,0])
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
    
    %color("green", 0.08) {
        translate([(frameDiagonal+o),-frameDiagonal,25]) 
        cylinder(d=25.4*propSize,h=1);
        translate([-(frameDiagonal+o),-frameDiagonal,25]) 
        cylinder(d=25.4*propSize,h=1);
    }
    %color("red", 0.08) {
        translate([-(frameDiagonal+o),frameDiagonal,25]) 
        cylinder(d=25.4*propSize,h=1);
        translate([(frameDiagonal+o),frameDiagonal,25]) 
        cylinder(d=25.4*propSize,h=1);
    }
}    

module battery3S2200mah() {
    translate([0,0,16.5]) 
    cube([24,103,33], center=true);
}

module Xrotor20() { 
    escW=50;
    escL=21;
    escH=5.5;
    translate([0,0,escH/2])
    cube([escL, escW, escH], center=true);
}

module gopro() {
    translate([0,0,20.5]) 
    cube([21,59,41], center=true);
}

module rx() {
    translate([0,0,6.5]) 
    cube([63,25,13], center=true); 
} 

module vtxTS5823() {
    translate([0,0,4]) {
        cube([30,20,8], center=true);
        translate([-22.5,5,0])
        rotate([0,90,0])
        cylinder(d=8, h=15, $fn=30, center=true); 
        translate([-26,5,0])
        rotate([0,90,0])
        cylinder(d=3, h=22, $fn=30, center=true); 
    }
}

module bec() {
    translate([0,0,3.5]) 
    cube([45,19,7], center=true);
}

module fpvcam() {
    translate([0,0,13])
    cube([26,10,26], center=true);
    translate([0,23,13])
    rotate([90,0,0])
    cylinder(d1=14, d2=20, h=18); 
}

module mobius() {
    translate([0,0,9]) 
    cube([35,61,18], center=true);
}

module cc3d() {
    translate([0,0,6]) 
    cube([39,39,12], center=true);
}

module cc3dAtom() {
    translate([0,0,6]) { 
        translate([0,25,0]) 
        cube([20,16,12], center=true);
        hull() {
            cube([20,34,12], center=true);
            translate([0,-20,0]) 
            cylinder(d=3, h=12, $fn=20, center=true); 
        }
        hull() {
            translate([15,15.5,0]) 
            cylinder(d=3, h=12, $fn=20, center=true); 
            translate([-15,15.5,0]) 
            cylinder(d=3, h=12, $fn=20, center=true); 
            translate([0,-20,0]) 
            cylinder(d=3, h=12, $fn=20, center=true); 
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
    hull() {
        cube([21, 14.5, 2.5], center=true);
        translate([0,-(14.5-11.5)/2,0]) cube([21, 11.5, 7], center=true);
    }
}