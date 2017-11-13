x=40;
y=50;
z=10;
altura=42; //stepper
radi=5;
f_tornillo=1;
module cantonada (){
    square(radi);
    circle(radi);
}

module part1(){
    difference(){
    linear_extrude(z){
            difference(){
            hull(){
                translate([0,y-radi])
                cantonada();
                translate([0,-y+radi])
                rotate([180])
                cantonada();
            }  
            translate([0,y-radi])
                circle(f_tornillo);
                translate([0,-y+radi])
                circle(f_tornillo);
            for(i=[0:5:y-2*radi-1]){
                translate([0,i])
                circle(f_tornillo);
                translate([0,-i])
                circle(f_tornillo);
                }
                
        }
    } 
    translate([-radi,y-2*radi,0])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,y-2*radi,2*z/3])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,-y,0])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,-y,2*z/3])
    cube([2*radi,2*radi,z/3]);
    }
}

module part2(){
    difference(){
    linear_extrude(z){
        difference(){
        hull(){
            translate([x-radi,0])
             
            cantonada();
            translate([-x+radi,0])
            rotate([0,0,90])
            cantonada();
        }
        translate([x-radi,0])
                circle(f_tornillo);
                translate([-x+radi,0])
                circle(f_tornillo);
    }
    } 
    
    translate([x-2*radi,-radi,z/3])
    cube([2*radi,2*radi,z/3]);
  translate([-x,-radi,z/3])
    cube([2*radi,2*radi,z/3]);


    
}
    }
    
    
    translate([x+radi,0,0])
    mirror([1,0,0])
    part1();
    translate([-x-radi,0,0])
    part1();
    translate([0,y+radi,0])
    mirror([0,1,0])
    part2();
    translate([0,-y-radi,0])  
    part2();
    
