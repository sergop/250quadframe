$fn=60;

h=25;
innerH=25;
frameDiagonal=230/sqrt(2)/2;

angle=70;
angleOffset=0; 
frameLathW=20;
frameLathW2=24;
frameLathW3=15.5;
frameL=135;
frameW=65;
frameWo=10;
frontW=frameW+52;
rearW=frameW;
tubeL=100;
squareTubeL=100;
armL=83;
armH=5;
armW=25;
tubeLoffset=0;
afterMotor=15;
clampHfromC=10;
tubeToMotor=-15;
escOffsetF=60.5;
escOffsetR=66;
propSize=6;
propOffset=22;

holesDF=118;
holesDR=142;
 
m3boltHole=2.9;
 
quadcopter();
//frame(); 

module quadcopter() {
//    rotate([180,0,0])
    frame();
    color("grey") arms(4);   
    
//    translate([0,0,9]) 
//    openMotors(28,20,propOffset);
    
//    color("blue", 0.8)
//    translate([0,-13,41.5])
//    rotate([0,90,0])
//    %battery3S2200mah();
    
    escs();
//    gopro();
    
    color("black", 0.9)
    translate([-7,-30,4])
    rotate([0,0,90])
    %rx();
    
//    color("green", 0.9)
//    translate([9,-48,4])
//    rotate([0,0,-90])
//    %vtxTS5823();

    color("pink", 0.9)
    translate([12,-40,4])
    rotate([0,0,90])
    %bec();

    color("grey", 0.9)
    translate([0,47,5])
    rotate([0,0,0])
    %fpvcam();
//    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();
//
    color("yellow", 0.9)
    %translate([0,22,4])
    rotate([0,0,90])
    cc3d(); 
}

module frame() {
    w=frameLathW;
    w2=frameLathW2;
    w3=frameLathW3;
    fw=frontW;
    rw=rearW;
    l=frameL;
    difference() {
        union() {  
            // bottom plate
            framePlate();
            // wall
            color("grey", 0.5)
            frameWall(4,5);
//            framePlate(10);  
            // top plate
//            framePlate(20,2);  
        }   
        
        $fn=30;
//        translate([0,0,26]) framePlate(2); 
        arms(4,5.1,17.5);  
        holes(); 
        
        // camera slot
//        translate([0,88,35.5]) 
//        cube([26,100,16], center=true);
//        translate([0,47,35.5]) 
//        cube([29,10,16], center=true);

        // vtx and bec cooling slot
//        translate([0,-65,19.5]) 
//        cube([32,10,16], center=true);
        
        // camera hole
//        translate([0,65,29.5]) 
//        rotate([90,0,0]) 
//        cylinder(d=18, h=10, center=true);
        
        // usb cable hole
//        translate([30.3,3.5,15]) 
//        rotate([0,90,0]) 
//        hull() {
//            translate([0,6,0]) 
//            cylinder(d=7, h=10, center=true);
//            cylinder(d=7, h=10, center=true);
//        }
        
        // camera mount hole
//        translate([0,48,10]) 
//        cylinder(d=2, h=10, center=true);
        
        // signal cable hole
//        translate([0,39,10]) 
//        cube([8,12,16], center=true);
        
        // power cables
//        translate([6,-11,10]) 
//        cylinder(d=8, h=10, center=true);
        
        // rx antenna holes
//        translate([-22,-35,30]) 
//        cylinder(d=2, h=10, center=true);
//        translate([-22,-25,30]) 
//        cylinder(d=2, h=10, center=true);    
        
        // extra top plate screw holes
//        translate([-frameW/2-5,-5,30]) 
//        cylinder(d=2, h=10, center=true);
//        translate([frameW/2+5,-5,30]) 
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
        
        // cc3d atom strap slots
//        translate([22.5,12.5,10]) 
//        cube([2,3,6], center=true);
//        translate([3.5,12.5,10]) 
//        cube([2,3,6], center=true);
        
        // pdb slot
//        translate([0,-29,-6]) 
//        cube([10,56,6], center=true); 

        // led holes
//        for(x = [-19,-15,-11,11,15,19])
//        translate([x,-65,-4])
//        rotate([90,0,0])
//        cylinder(d=3, h=5, center=true, $fn=30); 
    }
}

module framePlate(z=0,h=4,d=10,ad=22) { 
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

module openSquareTubes15() {
    l=frameDiagonal;
    tubeSideZ=10;
    tubeSideX=30;
    
    translate([(l+propOffset),-l,0]) 
    rotate([0,0,angle])
    translate([0,squareTubeL/2-afterMotor,0])
    cube([tubeSideX,squareTubeL,tubeSideZ], center=true);
    
    translate([-(l+propOffset),-l,0]) 
    rotate([0,0,-angle])
    translate([0,squareTubeL/2-afterMotor,0])
    cube([tubeSideX,squareTubeL,tubeSideZ], center=true);
    
    translate([-(l+propOffset),l,0]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0])
    cube([tubeSideX,squareTubeL-tubeLoffset,tubeSideZ], center=true);
    
    translate([(l+propOffset),l,0]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0])
    cube([tubeSideX,squareTubeL-tubeLoffset,tubeSideZ], center=true);
}

module arms(z=0,h=armH,w=armW) {
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
    holes(); 
    }
            
    module arm(left=true) { 
        cylinder(d=35, h=h);
        hull() {
            translate([w/2-4,0,0])
            cylinder(d=8, h=h);
            translate([-w/2+4,0,0])
            cylinder(d=8, h=h);
            translate([w/2-4,armL-5,0])
            cylinder(d=8, h=h);
            translate([-w/2+4,armL-5,0])
            cylinder(d=8, h=h);
            if(left)
            translate([5,armL,0])
            cylinder(d=8, h=h);
            else
            translate([-5,armL,0])
            cylinder(d=8, h=h);
        }
    }
}
    
module holes() { 
    l=frameDiagonal;
    translate([(l+propOffset),-l,0]) 
    rotate([0,0,angle])
    translate([0,squareTubeL/2-afterMotor,0])
    hole();
    translate([-(l+propOffset),-l,0]) 
    rotate([0,0,-angle])
    translate([0,squareTubeL/2-afterMotor,0]) 
    hole(false);
    translate([-(l+propOffset),l,0]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0])
    hole();
    translate([(l+propOffset),l,0]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0])
    hole(false);
    
    module hole(left=true) { 
        $fn=30;
                translate([7,armL-46,0])
                cylinder(d=3, h=50, center=true);
                translate([-7,armL-46,0])
                cylinder(d=3, h=50, center=true);
                if(left)
                translate([4,armL-36,0])
                cylinder(d=3, h=50, center=true);
                else
                translate([-4,armL-36,0])
                cylinder(d=3, h=50, center=true);
//                translate([x,52,11])
//                cylinder(d=6, h=2, center=true);
//                translate([x,42,25.5])
//                cylinder(d=6, h=4, center=true);
//                translate([0,41,26])
//                cylinder(d=2, h=15, center=true);
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

module motorMount(angleOffset = 0) {
    clampO=22;
    rotate([0,0,40])
    difference() {
        rotate([0,0,45])
        translate([0,0,1])
        cube([20,20,14], center=true);
        for(x = [-8,8])
        translate([x,0,0])
        cylinder(d=m3boltHole, h=55, center=true, $fn=30);
        for(y = [-9.5,9.5])
        translate([0,y,0])
        cylinder(d=m3boltHole, h=55, center=true, $fn=30);
        translate([0,y,0])
        rotate([0,90,50])
        cylinder(d=10, h=55, center=true, $fn=30);
    }
}

module motorMountClamp() {
    clampO=22;
    difference() {
        hull() {
            translate([6.5,clampO,0])
            cylinder(d=7, h=3, $fn=30);
            translate([-6.5,clampO,0])
            cylinder(d=7, h=3, $fn=30);
            translate([6.5,clampO-3,0])
            cylinder(d=7, h=3, $fn=30);
            translate([-6.5,clampO-3,0])
            cylinder(d=7, h=3, $fn=30);
        }
        translate([0,10.5,6.5])
        rotate([-90,0,0])
        cylinder(d=10.2, h=20, $fn=60);
        translate([6.5,clampO,0])
        cylinder(d=m3boltHole, h=30, center=true, $fn=30); 
        translate([-6.5,clampO,0])
        cylinder(d=m3boltHole, h=30, center=true, $fn=30); 
    }
}

module battery4S5000mah() {
    cube([45,140,44], center=true);
}

module battery3S2200mah() {
    cube([33,103,24], center=true);
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

module vtxTS351() { 
    cube([45,27,17], center=true);
    translate([-62.5,7,0]) { 
        cylinder(d=10, h=85); 
        rotate([0,90,0])
        cylinder(d=10, h=40); 
    }
}

module vtxTS5823() {
    cube([30,20,8], center=true);
    translate([-22.5,5,0])
    rotate([0,90,0])
    cylinder(d=8, h=15, $fn=30, center=true); 
    translate([-26,5,0])
    rotate([0,90,0])
    cylinder(d=3, h=22, $fn=30, center=true); 
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