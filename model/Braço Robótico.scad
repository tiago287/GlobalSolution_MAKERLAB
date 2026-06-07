display_assembled = true; 

$fn = 60;

servo_shaft_dia = 6.0;
servo_screw_dia = 2.0;
thickness = 5;
arm1_length = 100;
arm2_length = 80;

module mounting_base() {
    difference() {
        cylinder(h=thickness, d=50, center=true);
        cylinder(h=thickness+2, d=servo_shaft_dia+1, center=true);
        for(i = [0:3]) {
            rotate([0,0, i*90]) translate([20,0,0])
                cylinder(h=thickness+2, d=servo_screw_dia+1, center=true);
        }
    }
}

module arm_link(length) {
    difference() {
        hull() {
            cylinder(h=thickness, d=20, center=true);
            translate([length, 0, 0]) cylinder(h=thickness, d=28, center=true); 
        }
        cylinder(h=thickness+2, d=servo_shaft_dia+1, center=true);
        for(i = [0:3]) {
            rotate([0,0, i*90]) translate([6,0,0])
                cylinder(h=thickness+2, d=servo_screw_dia, center=true);
        }
        
        translate([length - 5, 0, 0]) {
            cube([24, 13, thickness+2], center=true);
            translate([14, 0, 0]) cylinder(h=thickness+2, d=2, center=true);
            translate([-14, 0, 0]) cylinder(h=thickness+2, d=2, center=true);
        }
        
        translate([length*0.4, 0, 0]) cylinder(h=thickness+2, d=10, center=true);
    }
}

module base_garra() {
    difference() {
        hull() {
            cylinder(h=thickness, d=34, center=true);
            translate([15, 14, 0]) cylinder(h=thickness, d=10, center=true);
            translate([15, -14, 0]) cylinder(h=thickness, d=10, center=true);
        }
        
        cube([24, 13, thickness+2], center=true);
        translate([14, 0, 0]) cylinder(h=thickness+2, d=2, center=true);
        translate([-14, 0, 0]) cylinder(h=thickness+2, d=2, center=true);

        translate([15, 14, 0]) cylinder(h=thickness+2, d=servo_screw_dia+0.5, center=true);
        translate([15, -14, 0]) cylinder(h=thickness+2, d=servo_screw_dia+0.5, center=true);
    }
}

module dedo_garra(inverter = 1) {
    difference() {
        union() {
            hull() {
                cylinder(h=thickness, d=14, center=true);
                translate([25, 10 * inverter, 0]) cylinder(h=thickness, d=8, center=true);
            }
            hull() {
                translate([25, 10 * inverter, 0]) cylinder(h=thickness, d=8, center=true);
                translate([40, 0, 0]) cylinder(h=thickness, d=4, center=true);
            }
            translate([25, 6 * inverter, 0]) cylinder(h=thickness, d=4, $fn=3, center=true);
            translate([32, 3 * inverter, 0]) cylinder(h=thickness, d=4, $fn=3, center=true);
        }
        cylinder(h=thickness+2, d=servo_screw_dia+1, center=true);
        translate([12, 5 * inverter, 0]) cylinder(h=thickness+2, d=5, center=true);
    }
}

if (display_assembled) {
    color("DimGray") mounting_base();
    color("Silver") translate([0,0, thickness+1]) arm_link(arm1_length);
    color("DimGray") translate([arm1_length,0, (thickness+1)*2]) rotate([0,0, 45]) arm_link(arm2_length);
    
    pos_x = arm1_length + cos(45)*arm2_length;
    pos_y = sin(45)*arm2_length;
    
    translate([pos_x, pos_y, (thickness+1)*3]) rotate([0,0, 45]) {
        color("Silver") base_garra();
        translate([15, 14, thickness+1]) color("DarkOrange") dedo_garra(1);
        translate([15, -14, thickness+1]) color("DarkOrange") dedo_garra(-1);
    }
} else {
    mounting_base();
    translate([60, 0, 0]) arm_link(arm1_length);
    translate([170, 0, 0]) arm_link(arm2_length);
    translate([0, 50, 0]) base_garra();
    translate([45, 60, 0]) dedo_garra(1);
    translate([45, 30, 0]) dedo_garra(-1);
}