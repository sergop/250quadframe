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
 
quadcopter();
//frame();
//        translate([0,-14.8,0]) 
//        rotate([0,0,180])
//        pdb();
//escs();

module quadcopter() {
//    rotate([180,0,0])
    frame();
    
//    translate([0,0,7.5]) 
//    openMotors(28,20,propOffset);
    
//    color("blue", 0.8)
//    translate([0,-13,41.5])
//    rotate([0,90,0])
//    %battery3S2200mah();
    
//    escs();
//    gopro();
    
    color("black", 0.9)
    translate([-13.8,-28,18])
    rotate([0,0,90])
    %rx();
    
    color("green", 0.9)
    translate([9,-48,23.5])
    rotate([0,0,-90])
    %vtxTS5823();

    color("pink", 0.9)
    translate([12,-40,15])
    rotate([0,0,90])
    %bec();
//
    color("grey", 0.9)
    translate([0,47,29.5])
    rotate([0,0,0])
    %fpvcam();
//    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();
//
//    color("yellow", 0.9)
//    %translate([9,5,16])
//    rotate([0,0,90])
//    cc3d();
//    cc3dAtom();
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
                frameContour(15.7);
                frameContour(16,6);
                openSquareTubes15();
                cube([500,60,16], center=true);
            }
            translate([0,0,19.5])
            difference() {
                union() {
                    frameContour(16);
                    hull() {
                        translate([frameW/2+3,-5,-2]) 
                        cylinder(d=10, h=20, center=true);
                        translate([-frameW/2-3,-5,-2]) 
                        cylinder(d=10, h=20, center=true);
                    }
                }
                h=17;d=6;ad=15;o=9;o2=6;
                $fn=30;
                hull() {
                    translate([frameW/2,frameL/2-o,0])
                    cylinder(d=d, h=h, center=true);
                    translate([-frameW/2,frameL/2-o,0])
                    cylinder(d=d, h=h, center=true);
                    
                    translate([frameW/2-o2,frameL/2,0])
                    cylinder(d=d, h=h, center=true);
                    translate([-frameW/2+o2,frameL/2,0])
                    cylinder(d=d, h=h, center=true);
                    
                    translate([frameW/2,-frameL/2+o,0])
                    cylinder(d=d, h=h, center=true);
                    translate([-frameW/2,-frameL/2+o,0])
                    cylinder(d=d, h=h, center=true); 
                    
                    translate([frameW/2-o2,-frameL/2,0])
                    cylinder(d=d, h=h, center=true);
                    translate([-frameW/2+o2,-frameL/2,0])
                    cylinder(d=d, h=h, center=true);   
                }
            }
//            translate([0,0,-9.5]) frameContour();
            translate([0,0,9.5]) frameContour(); 
            
            // top plate
            *translate([0,0,28.5])
            union() {
                frameContour(2); 
                hull() {
                    translate([frameW/2+3,-5,0]) 
                    cylinder(d=10, h=2, center=true);
                    translate([-frameW/2-3,-5,0]) 
                    cylinder(d=10, h=2, center=true);
                }
            }
//            color("grey") openSquareTubes15(); 
            h=3;d=10;ad=15;
            translate([0,0,-8])
            *hull() {
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
                translate([0,-frameL/3,0])
                cylinder(d=d, h=h, center=true);
            }
            translate([0,0,-8])
            *hull() {
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
                translate([0,frameL/3,0])
                cylinder(d=d, h=h, center=true);
            } 
            #translate([6,20,12.5]) {
                translate([15.25,15.25,0]) 
                cylinder(d=5.5, h=2, center=true);
                translate([-15.25,15.25,0]) 
                cylinder(d=5.5, h=2, center=true);
                translate([15.25,-15.25,0]) 
                cylinder(d=5.5, h=2, center=true);
                translate([-15.25,-15.25,0]) 
                cylinder(d=5.5, h=2, center=true);
            }
        }   
        
        $fn=30;
//        translate([0,0,26]) frameContour(2); 
        openSquareTubes15(); 
        
        // camera slot
        translate([0,88,35.5]) 
        cube([26,100,16], center=true);

        // vtx and bec cooling slot
        translate([0,-65,19.5]) 
        cube([32,10,16], center=true);
        
        // camera hole
        translate([0,65,29.5]) 
        rotate([90,0,0]) 
        cylinder(d=18, h=10, center=true);
        
        // usb cable hole
        translate([27,5,15]) 
        rotate([0,90,0]) 
        hull() {
            translate([0,5,0]) 
            cylinder(d=7, h=10, center=true);
            cylinder(d=7, h=10, center=true);
        }
        
        // camera mount hole
        translate([0,48,10]) 
        cylinder(d=2, h=10, center=true);
        
        // signal cable hole
        translate([0,39,10]) 
        cube([8,12,16], center=true);
        
        // power cables
        translate([4,-17,10]) 
        cylinder(d=8, h=10, center=true);
        
        // rx antenna holes
        translate([-22,-35,30]) 
        cylinder(d=2, h=10, center=true);
        translate([-22,-25,30]) 
        cylinder(d=2, h=10, center=true);    
        
        // extra top plate screw holes
        translate([-frameW/2-5,-5,30]) 
        cylinder(d=2, h=10, center=true);
        translate([frameW/2+5,-5,30]) 
        cylinder(d=2, h=10, center=true);
        
        // vtx antenna hole
        translate([25,10,30]) 
        cube([5,3,5], center=true); 
        
        // battery strap slots
        translate([18,0,30]) 
        cube([3,30,5], center=true);
        translate([-18,0,30]) 
        cube([3,30,5], center=true);
        
        // pdb slot
        translate([0,-29,-6]) 
        cube([10,56,6], center=true); 

        // led holes
        for(x = [-19,-15,-11,11,15,19])
        translate([x,-65,-4])
        rotate([90,0,0])
        cylinder(d=3, h=5, center=true, $fn=30);
        
        // pdb
        translate([0,-23,0]) 
        rotate([0,0,180])
        pdb();
    }
}

module frameContour(h=4,d=10,ad=15) { 
    $fn=30;
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
    tubeSideZ=15;
    tubeSideX=15.4;
    
    translate([(l+propOffset),-l,0]) 
    rotate([0,0,angle])
    translate([0,squareTubeL/2-afterMotor,0]) {
        cube([tubeSideX,squareTubeL,tubeSideZ], center=true);
        holes();
    }
    
    translate([-(l+propOffset),-l,0]) 
    rotate([0,0,-angle])
    translate([0,squareTubeL/2-afterMotor,0]) {
        cube([tubeSideX,squareTubeL,tubeSideZ], center=true);
        holes();
    }
    
    translate([-(l+propOffset),l,0]) 
    rotate([0,0,180+angle-angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0]) {
    cube([tubeSideX,squareTubeL-tubeLoffset,tubeSideZ], center=true);
        holes();
    }
    
    translate([(l+propOffset),l,0]) 
    rotate([0,0,-180-angle+angleOffset])
    translate([0,(squareTubeL-tubeLoffset)/2-afterMotor,0]) {
    cube([tubeSideX,squareTubeL-tubeLoffset,tubeSideZ], center=true); 
        holes();
    }
    
    module holes() { 
        $fn=30;
        for(x = [-5,5]) {
            for(y = [52,42]) {
                translate([x,y,0])
                cylinder(d=3, h=50, center=true);
                translate([x,52,11])
                cylinder(d=6, h=2, center=true);
                translate([x,42,25.5])
                cylinder(d=6, h=4, center=true);
                translate([0,41,26])
                cylinder(d=2, h=15, center=true);
            }
        }
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
    translate([-22.5,5,0])
    rotate([0,90,0])
    cylinder(d=8, h=15, $fn=30, center=true); 
    translate([-26,5,0])
    rotate([0,90,0])
    cylinder(d=3, h=22, $fn=30, center=true); 
}

module bec() {
    cube([45,19,7], center=true);
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