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

puts "Calculator"; puts "Operations Name: add, subtract, divide, multiply"
set validOp 0
set validNum1 0
set validNum2 0
# Repeat if operation input is not valid
while {!$validOp} {
	puts "Enter your operation: "  ;# Display a prompt to the user
	flush stdout  ;# Flush the output to ensure the prompt is displayed immediately

	set userInput [gets stdin]  ;# Read user input from the standard input and store it in the variable 'userInput'
	switch -exact -- $userInput {
		"add" {
			set validOp 1
			set opSign "+"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";# Display a message using the user input
		}
		"subtract" {
			set validOp 1
			set opSign "-"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";
		}
		"divide" {
			set validOp 1
			set opSign "/"
			set op $userInput
			puts "Operation Chosen: $op"
			puts "If decimal is needed, please input decimal on number"  ;puts "";
		}
		"multiply" {
			set validOp 1
			set opSign "x"
			set op $userInput
			puts "Operation Chosen: $op"  ;puts "";
		}
		default {
			puts "Invalid operation" ;# Display error message if operation is not valid
		}
	}
}
# Repeat if number input is not valid
while {!$validNum1} {
	puts "First Number: "
	flush stdout
	set userInput [gets stdin]
	# Verification if it is a number
	if {[string is double $userInput]} {
		set validNum1 1
		set a $userInput
	} else {
		puts "Input not valid! Please insert a valid number";# Display error message if number not valid
	}
}

while {!$validNum2} {
	puts "Second Number: "
	flush stdout
	set userInput [gets stdin]
	if {[string is double $userInput]} {
		set validNum2 1
		set b $userInput
	} else {
		puts "Input not valid! Please insert a valid number"
	}
}
# The output of the operations
puts "Results:"; puts "$a $opSign $b = [rpc_call $op $a $b]"