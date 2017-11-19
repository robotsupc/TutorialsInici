z=14;
y=200;
x=120;
altura=42;  //altura nema17=42
f_tornillo=1;
radi=7;  //cantonada
es_forats=10;
rosca=2;

module cantonada(){
    linear_extrude(z){
        circle(radi,$fn=20);
        square(radi);
    }
}
module part_1(){
    difference(){
        hull(){
            
            translate([0,-(y/2)+radi,0])
            rotate([0,0,-90])
            cantonada();
            
            translate([0,(y/2)-radi,0])
            cantonada();
        }
        translate([-radi/2,-(y/2)+3*radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        translate([radi/2,-(y/2)+radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
            
        translate([-radi/2,(y/2)-3*radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        translate([radi/2,(y/2)-radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        
        for(i=[0:es_forats:(y/2)-2*radi-f_tornillo]){
            translate([0,i,0])
            cylinder(r=f_tornillo,h=z,$fn=20);
            translate([0,-i,0])
            cylinder(r=f_tornillo,h=z,$fn=20);
        }
        
        translate([0,-(y/2)+radi,3.5*z/5])
           cube([10,10,z/5],center=true);
        translate([0,-(y/2)+radi,1.5*z/5])
           cube([10,10,z/5],center=true);
        
        translate([0,(y/2)-radi,3.5*z/5])
           cube([10,10,z/5],center=true);
        translate([0,(y/2)-radi,1.5*z/5])
           cube([10,10,z/5],center=true);
    }
}
module part_2(){
    difference(){
        hull(){
            
            translate([-(x/2)+radi,0,0])
            rotate([0,0,90])
            cantonada();
            
            translate([(x/2)-radi,0,0])
            cantonada();
        }
        
        
        translate([-(x/2)+3*radi/2,-radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        translate([-(x/2)+radi/2,radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        
        translate([(x/2)-3*radi/2,-radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
        translate([(x/2)-radi/2,radi/2,0])
        cylinder(r=f_tornillo,h=z,$fn=20);
   
        
        translate([-(x/2)+radi,0,4.5*z/5])
           cube([10,10,z/5],center=true);
        translate([-(x/2)+radi,0,z/2])
           cube([10,10,z/5],center=true);
        translate([-(x/2)+radi,0,.5*z/5])
           cube([10,10,z/5],center=true);
        
        translate([(x/2)-radi,0,4.5*z/5])
           cube([10,10,z/5],center=true);
        translate([(x/2)-radi,0,z/2])
           cube([10,10,z/5],center=true);
        translate([(x/2)-radi,0,.5*z/5])
           cube([10,10,z/5],center=true);
    }
}


       
module centre(){
    difference(){
        union(){
            hull(){
                translate([(x/2)-z-2*radi,(y/2)-z-2*radi,0])
                cube(z);
                translate([-(x/2)+2*radi,-(y/2)+2*radi,0])
                cube(z);
            }
            hull(){
                translate([-(x/2)+2*radi,(y/2)-z-2*radi,0])
                cube(z);
                translate([(x/2)-z-2*radi,-(y/2)+2*radi,0])
                cube(z);
            }
        }
        translate([x/2-2*radi-5,-y/2+z+2*radi,z/3])
        cube([5,y-2*z-4*radi,z/3]);
        translate([-x/2+2*radi,-y/2+z+2*radi,z/3])
        cube([5,y-2*z-4*radi,z/3]);
        translate([-x/2+z+2*radi,y/2-2*radi-5,z/3])
        cube([x-2*z-4*radi,5,z/3]);
        translate([-x/2+z+2*radi,-y/2+2*radi,z/3])
        cube([x-2*z-4*radi,5,z/3]);
        
    }
}
module base(){
    centre();

    translate([-(x/2)+radi,0,0])
    part_1();

    translate([(x/2)-radi,0,0])
    mirror([1,0,0])
    part_1();

    translate([0,-(y/2)+radi,0])
    part_2();

    translate([0,(y/2)-radi,0])
    mirror([0,1,0])
    part_2();
}

module pilar(){
    difference(){
        linear_extrude(altura){
            circle(radi,$fn=20);
            square(radi);
            translate([-radi,-radi])
            square(radi);
            translate([-radi,0])
            square(radi);
        }
        
        translate([-radi/2,-radi/2,-.5])
        cylinder(r=f_tornillo,h=altura+1,$fn=20);
        translate([radi/2,radi/2,-.5])
        cylinder(r=f_tornillo,h=altura+1,$fn=20);
    }
}

module rob(){
translate([x/2-radi,y/2-radi,z])
rotate([0,0,90])
pilar();

translate([x/2-radi,-y/2+radi,z])
pilar();

translate([-x/2+radi,y/2-radi,z])
rotate([0,0,180])
pilar();

translate([-x/2+radi,-y/2+radi,z])
rotate([0,0,-90])
pilar();
base();
translate([0,0,altura+z])
base();
}

module sup_mot(){
    difference(){
        cube([radi,40,altura],center=true);
        rotate([0,90,0])
        cylinder(r=12,h=radi+1, center=true);
        translate([0,-31/2,-31/2])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=radi+1, $fn=20,center=true);    
        
        translate([0,31/2,31/2])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=radi+1, $fn=20,center=true);   
        
        translate([0,31/2,-31/2])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=radi+1, $fn=20,center=true);   
        
        translate([0,-31/2,31/2])
        rotate([0,90,0])
        cylinder(r=f_tornillo,h=radi+1, $fn=20,center=true); 
      
        
        translate([0,-es_forats,0]){
            cylinder(r=f_tornillo,h=altura+1, $fn=20,center=true);
        }
         translate([0,es_forats,0]){
            cylinder(r=f_tornillo,h=altura+1, $fn=20,center=true);
         }
        translate([0,-es_forats,altura/2-5]){
            cube([radi+1,radi,rosca],center=true);
        }
        translate([0,es_forats,altura/2-5]){
            cube([radi+1,radi,rosca],center=true);
        }
      translate([0,-es_forats,-altura/2+5]){
            cube([radi+1,radi,rosca],center=true);
        }    
        translate([0,es_forats,-altura/2+5]){
            cube([radi+1,radi,rosca],center=true);
        }  
    }
}
rob();

                
                

