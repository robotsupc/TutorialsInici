module Bhead() {
    difference() {
        hull() {
            sphere(20,center=true,$fn=100);        
        
            translate([0,0,20])
                cylinder(h=40,center=true,r1=20,r2=0);
        }
        rotate([45,0,0])
            translate([-20,0,0])
                cube([40,5,40]);       
    }
    translate([0,0,40])
        sphere(6,center=true,$fn=100);    
}

Bhead();
