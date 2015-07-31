$fn=60;

h=25;
innerH=25;
frameDiagonal=230/sqrt(2)/2;

angle=70;
angleOffset=0; 
frameLathW=20;
frameLathW2=24;
frameLathW3=15.5;
frameL=120;
frameW=45;
frontW=frameW+52;
rearW=frameW;
tubeL=100;
squareTubeL=110;
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
 
//quadcopter();
frame();
//translate([0,14.5,0]) 
//pdb();

module quadcopter() {
//    rotate([180,0,0])
    frame();
    
    translate([0,0,7.5]) 
    openMotors(28,20,propOffset);
    
    color("blue", 0.8)
    translate([0,-13,40])
    %battery3S2200mah();
    
    escs();
//    gopro();
    
    color("black", 0.9)
    translate([13,-33,16.5])
    rotate([0,0,90])
    rx();
    
    color("green", 0.9)
    translate([-10,-30,21])
    rotate([0,0,90])
    vtxTS5823();

    color("pink", 0.9)
    translate([-10,-30,13.5])
    rotate([0,0,90])
    bec();

    color("grey", 0.9)
    translate([0,47,24])
    rotate([18,0,0])
    fpvcam();
    
    color("black", 0.9)
    translate([0,15,61])
    mobius();

    color("yellow", 0.9)
    translate([7,10,16])
    rotate([0,0,90])
//    cc3d();
    cc3dAtom();
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
            *difference() {
                frameContour(14);
                frameContour(16,8);
                openSquareTubes15();
                cube([500,70,16], center=true);
            }
            translate([0,0,-8.5]) frameContour();
//            translate([0,0,8.5]) frameContour(); 
//            translate([0,0,26]) frameContour(2); 
//            color("grey") openSquareTubes15(); 
        }   
        openSquareTubes15(); 
        translate([0,88,26]) 
        cube([100,100,5], center=true);
        translate([0,25,-5.5]) 
        cube([10,50,5], center=true);
        for(x = [-25,25]) for(y = [-30,30])
        translate([x,y,-8.5])
        rotate([0,90,0])
        cylinder(d=1.5, h=15, center=true, $fn=20);
        translate([0,0,8]) cylinder(d=1, h=5, center=true); 
    }
}

module frameContour(h=3,d=10,ad=15) { 
    hull() {
        translate([frameW/2,frameL/2,0])
        cylinder(d=d, h=h, center=true);
        translate([-frameW/2,frameL/2,0])
        cylinder(d=d, h=h, center=true);
        
        translate([frameW/2,-frameL/2,0])
        cylinder(d=d, h=h, center=true);
        translate([-frameW/2,-frameL/2,0])
        cylinder(d=d, h=h, center=true);   
    }
    hull() {
        translate([-frameW/2,-frameL/2,0])
        rotate([0,0,90-angle])
        translate([0,ad,0])
        cylinder(d=d, h=h, center=true);
        translate([frameW/2,-frameL/2,0])
        rotate([0,0,-90+angle])
        translate([0,ad,0])
        cylinder(d=d, h=h, center=true);
        translate([frameW/2,-frameL/2,0])
        cylinder(d=d, h=h, center=true);
        translate([-frameW/2,-frameL/2,0])
        cylinder(d=d, h=h, center=true);  
        translate([0,-frameL/5,0])
        cylinder(d=d, h=h, center=true);
    }
    hull() {
        translate([-frameW/2,frameL/2,0])
        rotate([0,0,-90+angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h, center=true);
        translate([frameW/2,frameL/2,0])
        rotate([0,0,90-angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h, center=true);
        translate([frameW/2,frameL/2,0])
        cylinder(d=d, h=h, center=true);
        translate([-frameW/2,frameL/2,0])
        cylinder(d=d, h=h, center=true);
        translate([0,frameL/5,0])
        cylinder(d=d, h=h, center=true);
    }
}

module openSquareTubes15() {
    l=frameDiagonal;
    tubeSide=15.1;
    
    translate([(l+propOffset),-l,0]) 
    rotate([0,0,angle])
    translate([0,squareTubeL/2-afterMotor,0]) {
        cube([tubeSide,squareTubeL,tubeSide], center=true);
        holes();
    }
    
    translate([-(l+propOffset),-l,0]) 
    rotate([0,0,-angle])
    translate([0,squareTubeL/2-afterMotor,0]) {
        cube([tubeSide,squareTubeL,tubeSide], center=true);
        holes();
    }
    
    translate([-(l+propOffset),l,0]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0]) {
    cube([tubeSide,squareTubeL-tubeLoffset,tubeSide], center=true);
        holes();
    }
    
    translate([(l+propOffset),l,0]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0]) {
    cube([tubeSide,squareTubeL-tubeLoffset,tubeSide], center=true); 
        holes();
    }
    
    module holes() {
        for(x = [-5,5]) for(y = [52,42])
        translate([x,y,0])
        cylinder(d=3, h=50, center=true, $fn=30);
    }
}

module escs() {
    offset=17;
    color("black", 0.7) {
        translate([offset,0,-3.5])
        rotate([0,0,90])
        Xrotor20();
        translate([-offset,0,-3.5])
        rotate([0,0,90])
        Xrotor20();
        translate([offset,0,3.5])
        rotate([0,0,-90])
        Xrotor20();
        translate([-offset,0,3.5])
        rotate([0,0,-90])
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
    escW=21;
    escL=50;
    escH=5.5;
    cube([escL, escW, escH], center=true);
}

module gopro() {
    cube([21,59,41], center=true);
}

module rx() {
    cube([63,25,13], center=true);
    translate([-25,0,0]) {
        rotate([0,45,90])
        cylinder(d=4, h=120);
        rotate([0,-45,90])
        cylinder(d=4, h=120);
    }
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
}

module bec() {
    cube([36,19,7], center=true);
}

module fpvcam() {
    cube([26,10,26], center=true);
    translate([0,23,0])
    rotate([90,0,0])
    cylinder(d1=14, d2=20, h=18); 
}

module mobius() {
    cube([35,61,18], center=true);
}

module cc3d() {
    cube([39,39,12], center=true);
}

module cc3dAtom() {
    cube([22,38,12], center=true);
}

module pdb() {
    for(y = [0:10:30])
    translate([0,y,0])
    cylinder(d=10, h=14, center=true, $fn=30);
    translate([0,43,-3.5])
    rotate([0,0,90])
    xt60();
}

module xt60() {
    hull() {
        cube([15, 15, 2.6], center=true);
        translate([0,(15-12)/2,0]) cube([15, 12, 7], center=true);
    }
}