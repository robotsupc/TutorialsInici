altura=10;
llarg=100;
ample=70;
f_tornillo=1;
radi=5;  //cantonada
es_forats=10;

module cantonada(){
    linear_extrude(altura){
        circle(radi,$fn=20);
        square(radi);
    }
}
module part_1(){
    difference(){
        hull(){
            
            translate([0,-(llarg/2)+radi,0])
            rotate([0,0,-90])
            cantonada();
            
            translate([0,(llarg/2)-radi,0])
            cantonada();
        }
        translate([0,-(llarg/2)+radi,0])
        cylinder(r=f_tornillo,h=altura,$fn=20);
            
        translate([0,(llarg/2)-radi,0])
        cylinder(r=f_tornillo,h=altura,$fn=20);
        
        for(i=[0:es_forats:(llarg/2)-2*radi-f_tornillo]){
            translate([0,i,0])
            cylinder(r=f_tornillo,h=altura,$fn=20);
            translate([0,-i,0])
            cylinder(r=f_tornillo,h=altura,$fn=20);
        }
        
        translate([0,-(llarg/2)+radi,3.5*altura/5])
           cube([10,10,altura/5],center=true);
        translate([0,-(llarg/2)+radi,1.5*altura/5])
           cube([10,10,altura/5],center=true);
        
        translate([0,(llarg/2)-radi,3.5*altura/5])
           cube([10,10,altura/5],center=true);
        translate([0,(llarg/2)-radi,1.5*altura/5])
           cube([10,10,altura/5],center=true);
    }
}
module part_2(){
    difference(){
        hull(){
            
            translate([-(ample/2)+radi,0,0])
            rotate([0,0,90])
            cantonada();
            
            translate([(ample/2)-radi,0,0])
            cantonada();
        }
        
        
        translate([-(ample/2)+radi,0,0])
        cylinder(r=f_tornillo,h=altura,$fn=20);
            
        translate([(ample/2)-radi,0,0])
        cylinder(r=f_tornillo,h=altura,$fn=20);
   
        
        translate([-(ample/2)+radi,0,4.5*altura/5])
           cube([10,10,altura/5],center=true);
        translate([-(ample/2)+radi,0,altura/2])
           cube([10,10,altura/5],center=true);
        translate([-(ample/2)+radi,0,.5*altura/5])
           cube([10,10,altura/5],center=true);
        
        translate([(ample/2)-radi,0,4.5*altura/5])
           cube([10,10,altura/5],center=true);
        translate([(ample/2)-radi,0,altura/2])
           cube([10,10,altura/5],center=true);
        translate([(ample/2)-radi,0,.5*altura/5])
           cube([10,10,altura/5],center=true);
    }
}

module centre(){
    difference(){
        union(){
            hull(){
                translate([(ample/2)-4*radi,(llarg/2)-4*radi,0])
                cube(altura);
                translate([-(ample/2)+4*radi-altura,-(llarg/2)+4*radi-altura,0])
                cube(altura);
            }
            hull(){
                translate([-(ample/2)+4*radi-altura,(llarg/2)-4*radi,0])
                cube(altura);
                translate([(ample/2)-4*radi,-(llarg/2)+4*radi-altura,0])
                cube(altura);
            }
        }
        translate([ample/2-2*radi-5,-llarg/2+2*altura,altura/3])
        cube([5,llarg-4*altura,altura/3]);
        translate([-ample/2+2*radi,-llarg/2+2*altura,altura/3])
        cube([5,llarg-4*altura,altura/3]);
        translate([-ample/2+2*altura,llarg/2-2*radi-5,altura/3])
        cube([ample-4*altura,5,altura/3]);
        translate([-ample/2+2*altura,-llarg/2+2*radi,altura/3])
        cube([ample-4*altura,5,altura/3]);
        
    }
}





centre();


translate([-(ample/2)-radi,0,0])
part_1();

translate([(ample/2)+radi,0,0])
mirror([1,0,0])
part_1();

translate([0,-(llarg/2)-radi,0])
part_2();

translate([0,(llarg/2)+radi,0])
mirror([0,1,0])
part_2();
