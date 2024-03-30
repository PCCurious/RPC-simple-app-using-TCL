# Server code for RPC implementation
# Addition Code
proc add {a b} {
	set result [expr $a + $b]
	return $result
}
# Subtraction Code
proc subtract {a b} {
	set result [expr $a - $b]
	return $result
}
# Division Code
proc divide {a b} {
	if {[expr {$b == 0}]} {
		set result "Cannot divide for 0"
	} else {
		set result [expr $a / $b]
	} 
	return $result
}
# Multiplication Code
proc multiply {a b} {
	set result [expr $a * $b]
	return $result
}

# Create a socket and acceptance of the port
set server_socket [socket -server accept 12345]

proc accept {sock addr port} {
	# Configuring the socket and buffer
	fconfigure $sock -buffering line
	puts "Connection accepted from $addr on port $port"

	while {![eof $sock]} {
		set data [gets $sock]
		if {[llength $data] > 1} {
			set command [lindex $data 0]
			set args  [lrange $data 1 end]
			set a [lindex $args 0]
			set b [lindex $args 1]
			switch -- $command {
				"add" {
					set result [add $a $b]
					puts $sock $result
				}
				"subtract" {
					set result [subtract  $a $b]
					puts $sock $result
				}
				"divide" {
					set result [divide $a $b]
					puts $sock $result
				}
				"multiply" {
					set result [multiply $a $b]
					puts $sock $result
				}
				default {
					puts $sock "Invalid command"
				}
			}
		}
	}
	close $sock
}
vwait forever
