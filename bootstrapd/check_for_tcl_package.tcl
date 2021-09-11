#
# check for tcl package
# Copyright Peter Maersk-Moller 2020. All rights reserved
#

proc print_usage { cause } {
	global argv0
	puts stderr "Error: $cause"
	puts stderr "Usage: $argv0 <package name>"
	exit -1
}

# Check for argument
if {$argc < 1} { print_usage "missing argument" }
set package [lindex $argv 0]

if {[catch {package require $package}]} {
	puts stderr "No package $package"
	exit 1
} else {
	# puts stderr "Have package $package"
	exit 0
}
