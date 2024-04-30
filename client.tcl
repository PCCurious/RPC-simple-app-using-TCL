# Client code for RPC implementation
# This is the setting for the server. If server is on other machine, please insert machine IP
set server_address "localhost"
set server_port 12345

# This is the process to make Remote Procedure Call
proc rpc_call {command args} {
	# Create a socket to connect to the server
	set server_socket [socket $::server_address $::server_port]
	# Configuring the socket
	fconfigure $server_socket -buffering line

	# Send the command and arguments to the server
	puts $server_socket "$command $args"

	# Receive and return the result from the server
	set result [gets $server_socket]
	close $server_socket
	return $result
}

# Number input and validation
proc getNumber {} {
	set validNum 0
	while {!$validNum} {
		flush stdout
		set userInput [gets stdin]
		# Verification if it is a number
		if {[string is double $userInput]} {
			set validNum 1
			set num $userInput
		} else {
			puts "Input not valid! Please insert a valid number";# Display error message if number not valid
		}
	}
	return $num
}

# Confirmation of continuing operations
proc confirmContinue {} {
	set confirm 0
	set userInput [gets stdin]
	switch $userInput {
		"Y" {
			set confirm 1
			flush stdout
		}
		"y" {
			set confirm 1
			flush stdout
		}
		"N" {
			set confirm 0
			flush stdout
			puts "Exiting..."
			puts "Thank you. Have a nice day!"
		}
		"n" {
			set confirm 0
			flush stdout
			puts "Exiting..."
			puts "Thank you. Have a nice day!"
		}
		"default" {
			puts "Invalid entry" ;
		}
	}
	return $confirm
}

# "Main" program
puts "Calculator";
set validOp 0
set continue 1
# Repeat if operation input is not valid
while {!$validOp || $continue} {
	puts "Operations Name: add, subtract, divide, multiply, exit"; puts "Enter your operation: " ; # Display a prompt to the user
	flush stdout  ;# Flush the output to ensure the prompt is displayed immediately

	set userInput [gets stdin]  ;# Read user input from the standard input and store it in the variable 'userInput'
	switch -exact -- $userInput {
		"add" {
			set validOp 1
			set opSign "+"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";# Display a message using the user input
			puts "First Number"
			set a [getNumber]
			puts "Second Number"
			set b [getNumber]
			puts "Results:"; puts "$a $opSign $b = [rpc_call $op $a $b]"
			puts "Another Operation? (Y/N)"
			set continue [confirmContinue]
		}
		"subtract" {
			set validOp 1
			set opSign "-"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";
			puts "First Number"
			set a [getNumber]
			puts "Second Number"
			set b [getNumber]
			puts "Results:"; puts "$a $opSign $b = [rpc_call $op $a $b]"
			puts "Another Operation? (Y/N)"
			set continue [confirmContinue]
		}
		"divide" {
			set validOp 1
			set opSign "/"
			set op $userInput
			puts "Operation Chosen: $op"
			puts "If decimal is needed, please input decimal on number"  ;puts "";
			puts "First Number"
			set a [getNumber]
			puts "Second Number"
			set b [getNumber]
			puts "Results:"; puts "$a $opSign $b = [rpc_call $op $a $b]"
			puts "Another Operation? (Y/N)"
			set continue [confirmContinue]
		}
		"multiply" {
			set validOp 1
			set opSign "x"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";
			puts "First Number"
			set a [getNumber]
			puts "Second Number"
			set b [getNumber]
			puts "Results:"; puts "$a $opSign $b = [rpc_call $op $a $b]"
			puts "Another Operation? (Y/N)"
			set continue [confirmContinue]
		}
		"exit" {
			set validOp 1
			puts "Exiting..."
			puts "Thank you. Have a nice day!"
			exit 0
		}
		default {
			puts "Invalid operation" ; puts ""; # Display error message if operation is not valid
		}
	}
}