
radi_base0 = 3;
h_base0 = 0.25;
h_con0 = 2*h_base0;
r_con0 = radi_base0*0.66;
h_peon_body = 5;
radi_cap_peo = r_con0*0.8;
module base() {
    //hull() {
        linear_extrude(height= h_base0,$fn=60)
            circle(radi_base0,center=true);
        translate([0,0,h_base0])
            blob();
    //}   
}
module blob() {
    minkowski() {
        linear_extrude(height= h_con0,scale=0.7,$fn=60)
            circle(r=r_con0,center=true);
        scale([r_con0,r_con0,1])
            translate([0,0,h_con0/2])
                sphere(r=h_con0,center=true,$fn=100);
   }
}

module peonBody() {
    cylinder(h = 5, r= r_con0*0.8, center=true, $fn = 60);
}

module neck(height, radius) {
    //()
        union() {
            cylinder(height * 0.2, radius, radius * 0.85,$fn=80);
            cylinder(height, radius * 0.75, radius * 0.65,$fn=80);
        }
  //}
}

    

module peo() {
    union() {
        base();
        translate([0,0,h_base0+h_con0])
            neck(h_peon_body,r_con0);
        
        scale([r_con0*0.3,r_con0*0.3,1])
            translate([0,0,h_base0+h_con0+h_peon_body+r_con0/2])
                rotate([0,-180,0])
                    blob();
        translate([0,0,h_base0+h_con0+h_peon_body+r_con0*0.9])
            sphere(r=radi_cap_peo,center=true,$fn=100);        
    }
}

peo();