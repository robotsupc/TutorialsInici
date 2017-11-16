x=100;
y=200;
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
                translate([0,y/2-radi])
                cantonada();
                translate([0,-y/2+radi])
                rotate([180])
                cantonada();
            }  
            translate([radi/2,y/2-radi/2])
                circle(f_tornillo);
            translate([-radi/2,y/2-3*radi/2])
                circle(f_tornillo);
            translate([radi/2,-y/2+radi/2])
                circle(f_tornillo);
            translate([-radi/2,-y/2+3*radi/2])
                circle(f_tornillo);
            if(radi<5*f_tornillo){
                for(i=[0:5:y/2-2*radi-1]){
                    translate([0,i])
                    circle(f_tornillo);
                    translate([0,-i])
                    circle(f_tornillo);
                }
            }
            else{
                for(i=[0:5:y/2-2*radi-1]){
                    translate([-radi/2,i])
                    circle(f_tornillo);
                    translate([-radi/2,-i])
                    circle(f_tornillo);
                }
                for(i=[0:5:y/2-2*radi-1]){
                    translate([radi/2,i])
                    circle(f_tornillo);
                    translate([radi/2,-i])
                    circle(f_tornillo);
                }
                
                
                
            }
                
        }
    } 
    translate([-radi,y/2-2*radi,0])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,y/2-2*radi,2*z/3])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,-y/2,0])
    cube([2*radi,2*radi,z/3]);
    
    translate([-radi,-y/2,2*z/3])
    cube([2*radi,2*radi,z/3]);
    }
}

module part2(){
    difference(){
        linear_extrude(z){
            difference(){
                hull(){
                    translate([x/2-radi,0])
                    cantonada();
                    translate([-x/2+radi,0])
                    rotate([0,0,90])
                    cantonada();
                }
                translate([x/2-radi/2,radi/2])
                        circle(f_tornillo);
                translate([x/2-3*radi/2,-radi/2])
                        circle(f_tornillo);
                translate([-x/2+radi/2,radi/2])
                        circle(f_tornillo);
                translate([-x/2+3*radi/2,-radi/2])
                        circle(f_tornillo);
            }
        } 
    
    translate([x/2-2*radi,-radi,z/3])
    cube([2*radi,2*radi,z/3]);
    translate([-x/2,-radi,z/3])
    cube([2*radi,2*radi,z/3]);


    
    }
}
module centre(){      
    difference(){  
        union(){
            hull(){
                    translate([x/2-z-2*radi,y/2-z-2*radi,0])
                    cube(z);
                    translate([-x/2+2*radi,-y/2+2*radi,0])
                    cube(z);
            }
            hull(){
                    translate([x/2-2*radi-z,-y/2+2*radi,0])
                    cube(z);
                    translate([-x/2+2*radi,y/2-2*radi-z,0])
                    cube(z);
            }
        }
        translate([-x/2+2*z,y/2-2*radi-5,z/3])
        cube([x-4*z,5,z/3]);
        translate([-x/2+2*z,-y/2+2*radi,z/3])
        cube([x-4*z,5,z/3]);
        translate([-x/2+2*radi,-y/2+2*z,z/3])
        cube([5,y-4*z,z/3]);
        translate([x/2-2*radi-5,-y/2+2*z,z/3])
        cube([5,y-4*z,z/3]);
    }
}

module columna(){
    linear_extrude(altura){
        difference(){
            union(){
                rotate(180)
                cantonada();
                square(radi);
                translate([0,-radi])
                square(radi);
            }
            translate([radi/2,radi/2])
            circle(f_tornillo);
            translate([-radi/2,-radi/2])
            circle(f_tornillo);
        }
    }  
}


module base_1(){
    translate([x/2-radi,0,0])
    mirror([1,0,0])
    part1();
    translate([-x/2+radi,0,0])
    part1();
    translate([0,y/2-radi,0])
    mirror([0,1,0])
    part2();
    translate([0,-y/2+radi,0])  
    part2();
    centre();
}


module base_2(){
    base_1();
    translate([0,0,altura+z])
    base_1();
    translate([-x/2+radi,y/2-radi,z])
    columna();
    translate([x/2-radi,y/2-radi,z])
    rotate([0,0,-90])
    columna();
    translate([-x/2+radi,-y/2+radi,z])
    rotate([0,0,90])
    columna();
    translate([x/2-radi,-y/2+radi,z])
    rotate([0,0,180])
    columna();
}
base_2();
