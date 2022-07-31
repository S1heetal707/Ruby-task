$LOAD_PATH << '.'
require "rubytask"
require "log"
include Register
include LoginModule

account = Register::CreateAccount.new()
account.display 

obj = LoginModule::LoginClass.new()
obj.login

balance = Array.new
history = Array.new

def bal(balance, history)
	puts "your balance is #{balance.sum}"
	puts welcome(balance, history)
end

def his(balancel,history)
	p "this is your history"
	p history
	p bal(balance,history)
end

def dep(balance,history)
	p "How much u like to deposite"
	input = ""
	input = gets.chomp.to_i
	p "You are depositing #{input} Rs"
	balance.push input
	history << input
	puts bal(balance,history)
end

def withd(balance,history)
	p "How much u want to withdraw"
	input = ""
	input = gets.chomp.to_i
	if balance.sum < input
		puts error
	else
		p "You want to withdraw #{input}"
		balance.push -input
		history << -input
		puts bal(balance,history)
  end
end

def exit
	p "Exit from the system"
end

def error
  p "Error, invalid selection ,pls try again"
end

def welcome(balance,history)
	p "Welcome! pls enter b for balance check, w for withdraw, d for deposite and e for exit"
	response = gets.chomp.downcase
	case response
	when 'b'
	  bal(balance,history)
  when 'w'
  	withd(balance,history)
  when "d"
  	dep(balance,history)
  when "e"
  	exit
  end
end


welcome(balance,history)