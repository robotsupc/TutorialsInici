
module base2d(){
        difference(){
          hull(){
            translate([-4,0])
            circle(1,$fn=20);
            
            translate([4,0])
            circle(1,$fn=20);
              
            translate([0,1])
            square(3,center=true);
            
        }
        
        
    }
        
        
        translate([0,-1]){
            hull(){
                translate([-5,0])
                circle(.5,$fn=20);
                
                translate([5,0])
                circle(.5,$fn=20);
            }
        }
        translate([0,2]){
            hull(){
                translate([-3,0])
                circle(.5,$fn=20);
                
                translate([3,0])
                circle(.5,$fn=20);
            }
        }
        
        
        
}


module cos2d(){
 difference(){

    polygon([[2,15],[3,0],[-3,0],[-2,15]]);
    
    translate([-5,0])
     hull(){
         
        for(i=[0:0.2:4]){
            translate([i,i*i*i])
            circle(1,$fn=10);
        }
    }
    
}
}

module cap2d(){
    hull(){
        translate([-2.2,0])
        circle(.4,$fn=20);
                
        translate([2.2,0])
        circle(.4,$fn=20);
   }
   translate([0,0.7])
   hull(){
        translate([-2,0])
        circle(.3,$fn=20);
                
        translate([2,0])
        circle(.3,$fn=20);
   }
   translate([0,1.2])
   hull(){
        translate([-1.8,0])
        circle(.2,$fn=20);
                
        translate([1.8,0])
        circle(.2,$fn=20);
   }
    
}

module rei2d(){
    base2d();
    translate([0,2])
    cos2d();
    translate([0,17])
    cap2d();
}

module rei3d(){
    rotate_extrude(){
        difference(){
            translate([0,1.5])
            rei2d();
            square(21);
        }
        
    }
    translate([0,-1,22.4])
    scale([.7,.7,.7])    
    rotate([-90,00,0])
    creu();
}

module creu(){
    linear_extrude(3){
        difference(){
            square([7,7],center=true);
            
            translate([0,5.5])
            circle(5,$fn=20);
            
            translate([0,-5.5])
            circle(5,$fn=20);
        }

        difference(){
            square([7,7],center=true);
            
            translate([5.5,0])
            circle(5,$fn=20);
            
            translate([-5.5,0])
            circle(5,$fn=20);
        }
        
    }
    translate([0,0,0.75])
    linear_extrude(1.5){
        translate([0,5])
        square([2,5], center=true);
    }

}

module corona(){
    translate([0,0,4.9])
    sphere(1,$fn=30);
    
    sphere(4,$fn=30);
    
    for(i=[0:10]){
    angle = i * 360 / 10;
        hull(){
            translate(5 * [sin(angle), -cos(angle), 0])
                rotate([45, -20, angle+90])
        
    cube(3,center=true);
            
            translate([0,0,-5])
            sphere(5);
        }
    }
}


module reina3d(){
    scale([.95,.95,.9])
    rotate_extrude(){
        difference(){
            translate([0,1.5])
            rei2d();
            square(21);
        }
        
    }
    translate([0,0,20.5])
    scale([.4,.4,.4])    
    corona();
}

module casc3d(){
    translate([0,0,11.9])
    sphere(2,$fn=20);
    scale([.8,.8,1]){
        difference(){
            sphere(10);
            
            translate([-10,-2,-5])
            rotate([60,0,0])
            cube([20,20,2]);
            
        }
    }
}

module alfil3d(){
    scale([.85,.85,.7])
    rotate_extrude(){
        difference(){
            translate([0,1.5])
            rei2d();
            square(21);
        }
        
    }
    translate([0,0,16])
    scale([.25,.25,.25])    
    casc3d();

}


module peo2d(){
    scale([1.2,.7]){
    base2d();
    translate([0,2])
    cos2d();
        offset(0.5)
        translate([0,18])
        scale([0.4,0.25])
        rotate([0,0,90])
        circle(8,$fn=3);
    }
    translate([0,16.7])
    circle(3.5,$fn=20);
       
}
module peo3d(){
    scale([.7,.7,.7]){
        rotate_extrude(){
            difference(){
                translate([0,1.5])
                peo2d();
                square(30);
            }
            
        }
    }
}








module basetorre3d(){
rotate_extrude(){
    difference(){
        translate([0,1.5])
        union(){
        base2d();
            
             translate([0,2.5]){
            hull(){
                translate([-2.9,0])
                circle(.5,$fn=20);
                
                translate([2.9,0])
                circle(.5,$fn=20);
            }
        }
        }
        square(50);
    }
    
}
linear_extrude(13,scale=.7)
circle(3.2,$fn=20);

}
module captorre3d(){
    cylinder(r=4.5,h=2,$fn=20);

    translate([0,0,1])
    difference(){
    cylinder(r=5,h=3.5,$fn=20);

    cylinder(r=4,h=3.5,$fn=20); 
     translate([0,0,2.5])   
     for(i=[0:5]){
        angle = i * 360 / 5;
                translate(3.5 * [sin(angle), -cos(angle), 0])
                    rotate([0, 0, angle+90])
            
        cube([5,1,5],center=true);
                
        }   
    }

    mirror([0,0,-1])
    rotate_extrude(){
        difference(){
        square([4,1]);
            
            
            translate([4.5,1])
            circle(1,$fn=20);
        }
    }
}

module torre3d(){
    basetorre3d();
    translate([0,0,13])
    scale([.8,.8,.8])
    captorre3d();
    
    
}

translate([40,0,0])
torre3d();

translate([-40,0,0])
peo3d();

translate([-20,0,0])
alfil3d();

reina3d();

translate([20,0,0])
rei3d();
