
$fn=60;

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
//translate([0,0,-2])
quadcopter(); 
//color("blue", 0.1)
//translate([0,0,999])
//cylinder(d=180, h=1);
//cube([297,210,4], center=true);
//frame(); 

module quadcopter() {
//    rotate([180,0,0]) 
    frame();
    
//    translate([0,0,2*(armX+2.5)]) 
//    rotate([180,0,0]) 
    {
        color("grey", 0.5) %arms(armX);   
        
        translate([0,0,armX+2.5]) 
        %openMotors(28,20,propOffset);
    }
    
    color("blue", 0.8)
    translate([0,-frameL/2+39.5,plateH+26+3]) 
    %battery3S1300mah();
//    %battery3S2200mah();
//    %battery3S5000mah();
    
//    %escs(armX+armH);
//    gopro();
    translate([0,48,plateH+26+3+12]) 
    rotate([0,0,90]) 
    %yi();
    
    translate([0,-frameL/2+76,plateH+2])  
    %#buzzer();
//    
//    color("black", 0.9)
//    translate([0,-frameL/2+30,plateH])
//    rotate([0,0,90])
//    %rx();
//    
    translate([0,frameL/2-10,plateH-2]) 
    rotate([15,0,0])
    %videoBlock();
//    
//    color("pink")
//    translate([0,-frameL/2+13,plateH+12])
//    %bec();
    
//    color("black", 0.9)
//    translate([0,15,61])
//    mobius();

    color("yellow", 0.9)
    translate([0,-frameL/2+49,plateH+16])
    rotate([0,0,-90])
    %cc3d();  
//    
//    translate([-25,0,plateH])
//    rotate([0,0,0])
//    %xt60(); 
}

module frame() { 
    l=frameL;
    difference() {
        union() { 
            %framePlate();  
//            color("blue")
            frameWall(plateH,26,35); 
            rearOverhang();
            cameraholder();
            topPlate();  
        }    
        armholes(plateH,9.5);  
        holes();   
        
        // usb hole
        translate([20,-frameL/2+49,plateH+14]) 
        cube([8,8,4], center=true); 
        
        // rear overhang
//        rearOverhang();
        
        // battery wire hole
        translate([-14.5,30,plateH+39]) 
        rotate([90,0,0]) 
        hull() {
            cylinder(d=5, h=5); 
            translate([0,3,0]) 
            cylinder(d=5, h=5); 
        } 
        
        // antenna hole
        translate([2,36,plateH+28])  
        cube([12,8,4], center=true); 
            
        translate([-25,0,plateH])
        rotate([0,0,0])
        xt60();
     
        translate([0,-frameL/2+49,plateH+16])
        rotate([0,0,-90])
        cc3d();    
    }
    
    module rearOverhang() {
        z=plateH;
        h=12;
        ad=17;
        d=10;
        t=2.4;
        difference() {
            hull() {
                translate([-frameW/2,-frameL/2+frameArmsOffset,z])
                rotate([0,0,90-angle])
                translate([0,ad,0])
                cylinder(d=d, h=h);
                translate([frameW/2,-frameL/2+frameArmsOffset,z])
                rotate([0,0,-90+angle])
                translate([0,ad,0])
                cylinder(d=d, h=h);
                translate([frameW/2,-frameL/2+frameArmsOffset,z])
                cylinder(d=d, h=h);
                translate([-frameW/2,-frameL/2+frameArmsOffset,z])
                cylinder(d=d, h=h);  
                translate([0,-42,z+h/2]) 
                cube([frameW,24,h], center=true); 
            }
            hull() {
                translate([frameW/2-5,frameL/2,z])
                cylinder(d=10-t*2, h=7);
                translate([-frameW/2+5,frameL/2,z])
                cylinder(d=10-t*2, h=7);
                
                translate([frameW/2-5,-frameL/2,z])
                cylinder(d=10-t*2, h=7);
                translate([-frameW/2+5,-frameL/2,z])
                cylinder(d=10-t*2, h=7);   
            }
        }
    }
    
    module cameraholder() {
        difference() {
            framePlate(plateH,26);  
            translate([0,-18,25]) 
            cube([100,100,50], center=true); 
            rotate([15,0,0]) 
            translate([0,5.5,15]) {
                hull() {
                    translate([0,41,0]) 
                    cube([26.5,14,50], center=true); 
                    translate([0,43,0]) 
                    cube([23,17,50], center=true); 
                }
                translate([0,55,0]) 
                cube([24,16,50], center=true); 
                translate([0,44,-10]) 
                cube([28,8,7], center=true); 
            }
        } 
    } 
    
    module topPlate() {
        d=10;
        h=3;
        z=plateH+26;
        difference() {
            x=frameL/2-20; 
            ofst=5.5;
            union() {
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
                translate([0,ofst,0]) 
                hull() {
                    h=15;    
                    d=6;
                    translate([frameW/2-frameWo,frameL/2-x,z])
                    cylinder(d=d, h=h);
                    translate([-frameW/2+frameWo,frameL/2-x,z])
                    cylinder(d=d, h=h);
                    
                    translate([frameW/2-frameWo,-frameL/2,z])
                    cylinder(d=d, h=h);
                    translate([-frameW/2+frameWo,-frameL/2,z])
                    cylinder(d=d, h=h);   
                } 
            }  
            translate([0,ofst-15.5,45.5]) 
            cube([34,71,23], center=true);
        } 
    } 
}

module framePlate(z=0,h=plateH,lo=0,d=10,ad=17) { 
    $fn=30;
    x=60;
    hull() {
        translate([frameW/2-frameWo,frameL/2-lo,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo,frameL/2-lo,z])
        cylinder(d=d, h=h);
        
        translate([frameW/2-frameWo,-frameL/2,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo,-frameL/2,z])
        cylinder(d=d, h=h);   
    }
    
    hull() {
        translate([-frameW/2,-frameL/2+frameArmsOffset,z])
        rotate([0,0,90-angle])
        translate([0,ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,-frameL/2+frameArmsOffset,z])
        rotate([0,0,-90+angle])
        translate([0,ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,-frameL/2+frameArmsOffset,z])
        cylinder(d=d, h=h);
        translate([-frameW/2,-frameL/2+frameArmsOffset,z])
        cylinder(d=d, h=h);  
        translate([0,-frameL/2+frameL+frameArmsOffset-x,z])
        cylinder(d=d, h=h);
    }
    hull() {
        translate([-frameW/2,frameL/2-frameArmsOffset,z])
        rotate([0,0,-90+angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,frameL/2-frameArmsOffset,z])
        rotate([0,0,90-angle])
        translate([0,-ad,0])
        cylinder(d=d, h=h);
        translate([frameW/2,frameL/2-frameArmsOffset,z])
        cylinder(d=d, h=h);
        translate([-frameW/2,frameL/2-frameArmsOffset,z])
        cylinder(d=d, h=h);
        translate([0,frameL/2-frameL-frameArmsOffset+x,z])
        cylinder(d=d, h=h);
    }
    
    for(x = [1,-1]) for(y = [0,32,54,55]) 
    *hull() {
        translate([frameW/2-frameWo+3,x*y,z])
        cylinder(d=d, h=h);
        translate([-frameW/2+frameWo-3,x*y,z])
        cylinder(d=d, h=h); 
    } 
}

module frameWall(z=0,h=4,x=0,t=2.4) { 
    $fn=30;
    difference() {
        framePlate(z,h,x);
        translate([0,0,-1])
        hull() {
            translate([frameW/2-frameWo,frameL/2-x,z])
            cylinder(d=10-t*2, h=h+2);
            translate([-frameW/2+frameWo,frameL/2-x,z])
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
                translate([0,-3,0])
                cylinder(d=38, h=h, $fn=90);  
                hull() { 
                    translate([w/2-4,0,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,0,0])
                    cylinder(d=d, h=h);  
                    translate([w/2-4,armL,0])
                    cylinder(d=d, h=h);
                    translate([-w/2+4,armL,0])
                    cylinder(d=d, h=h);
                    translate([0,armL+mh,0])
                    cylinder(d=d, h=h);
                } 
            }
            for(a = [45:180:360]) for(b = [135:180:360]) {
                rotate([0,0,a])
                translate([0,9.5,-1]) 
                cylinder(d=3.3, h=h+5);

                rotate([0,0,b])
                translate([0,8,-1])
                cylinder(d=3.3, h=h+5);
            }
            translate([0,0,-1])
            cylinder(d=9, h=h+2, $fn=90); 
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
            translate([w/2-4,0,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,0,0])
            cylinder(d=d, h=h);  
            translate([w/2-4,armL,0])
            cylinder(d=d, h=h);
            translate([-w/2+4,armL,0])
            cylinder(d=d, h=h);
            translate([0,armL+mh,0])
            cylinder(d=d, h=h);
        } 
    }
}
    
module holes() { 
    l=frameDiagonal; 
    h=16;
    d=3.3;
    
    translate([(l+propOffset),-l,-1]) 
    rotate([0,0,angle]) 
    #hole();
    translate([-(l+propOffset),-l,-1]) 
    rotate([0,0,-angle]) 
    #hole();
    translate([-(l+propOffset),l,-1]) 
    rotate([0,0,180+angle-angleOffset]) 
    hole2();
    translate([(l+propOffset),l,-1]) 
    rotate([0,0,-180-angle+angleOffset]) 
    hole2();  
    
    module hole() { 
        $fn=30;
        translate([0,armL+mh,0])
        cylinder(d=d, h=h); 
        for(x = [-1,1]) for(y = [armL] ) {
            translate([x*8,y,11])
            rotate([0,0,30]) 
            cylinder(d=7, h=3); 
            
            translate([0,y+mh,11])
            rotate([0,0,30]) 
            cylinder(d=7, h=3); 
        }
        for(x = [-1,1]) for(y = [armL] ) {
            translate([x*8,y,0])
            cylinder(d=d, h=h+20);  
         
        }
    }
    module hole2() { 
        $fn=30;
        translate([0,armL+mh,0])
        cylinder(d=d, h=h+20); 
        for(x = [-1,1]) for(y = [armL] ) {
            translate([x*8,y,11])
            rotate([0,0,30]) 
            cylinder(d=7, h=3); 
            translate([0,y+mh,11])
            rotate([0,0,30]) 
            cylinder(d=7, h=3); 
        }
        for(x = [-1,1]) for(y = [armL] ) {
            translate([x*8,y,0])
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
    if(showProps) {
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

module buzzer() {
    translate([0,0,12.5]) 
    cube([35,12,25], center=true);
}

module rx() {
    translate([0,0,3.5]) 
    cube([64,24,7], center=true); 
    translate([15,0,5.5]) 
    cube([34,24,11], center=true); 
} 

module videoBlock() {
    
    color("green", 0.9)
    translate([-3,8,16])
    rotate([90,90,0])
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
//    difference() { 
        translate([0,0,5]) 
        cube([side,side,10], center=true); 
        
        for(a = [0:90:360]) {
            rotate([0,0,a])
            translate([15.25,15.25,-29]) 
            cylinder(d=3, h=h+5); 
        }
            rotate([0,0,-45])
            translate([15.25,15.25,-29]) 
            cylinder(d=3.3, h=h+5); 
//    }
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