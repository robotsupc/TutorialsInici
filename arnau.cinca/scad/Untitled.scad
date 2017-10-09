//2d
module 2d(){
    module pacman(){
        r=5;
        difference(){
        circle(r,$fn=30);    
        
        translate([r,0])
        mirror([1,0,0]) 
        circle(r/1.5,$fn=3);
        }
    }

    n=5;
    for(i=[0:n-1])
    rotate(360/n*i)
    translate([10,0])pacman();
}

module 3d(){
    cyl_r=10;
    sphere_r=20;
    intersection(){
        difference(){
            cube(30,center=true);
            
            cylinder(r=cyl_r,h=100,center=true);
            
            rotate([1,0,0]*90)
            cylinder(r=cyl_r,h=100,center=true);
            
            rotate([0,1,0]*90)
            cylinder(r=cyl_r,h=100,center=true);
            
            }
            sphere(sphere_r,$fn=20);
    }


}
3d();