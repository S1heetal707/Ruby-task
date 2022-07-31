$LOAD_PATH << '.'
require 'csv'
require 'byebug'

module LoginModule
  class LoginClass
    def login
      p "Enter username"
      @input_username = gets.chomp
      p "Enter email"
      @input_email = gets.chomp
      login_passed = false
      byebug
      CSV.foreach('my_ask.csv',headers: true) do |row|
        login_passed = row[0] == @input_username && row[1] == @input_email
        break if login_passed
      end
      login_passed
    end
  end
end

obj = LoginModule::LoginClass.new()
obj.login