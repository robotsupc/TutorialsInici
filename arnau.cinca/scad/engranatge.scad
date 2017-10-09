
module engranatge(radi,n_dents,h){
    linear_extrude(h){
        union(){
            difference() {
                 
                circle(radi);
               circle(radi/10,$fn=radi);
            }
        for(a=[0: n_dents-1]){
            angle = a * 360 / n_dents;
            translate(radi * [sin(angle), -cos(angle), 0])
                rotate([0, 0, angle]){
                    square((3.14*radi)/n_dents,center=true);
                    }
            
            }
        }
    }
}
//mig quadrat esta a dins el cercle
//no te altura(linear_extrude(height=))

    engranatge(10,10,1);