#Gem List
require 'rainbow'
require 'command_line_reporter'
require 'progress_bar'
require 'io/console'
##################################
system('clear') or system('cls')
####################################
def intro # Option 1's Questions
        options_loop = true # loop for options menu
        while options_loop
        options_input = gets.strip # strip , method removes whitespace BEFORE and AFTER the user input.

            if options_input == "e" # if the user enters e the following line of code up to Main.new.run is executed
                puts Rainbow("Returning to the Main Menu...").yellow
                options_loop = false
                loading
                puts ""
                Main.new.run
            elsif options_input == "1" # if the user enters 1 the following line of code is executed up to end for country loop.
                option1_loop = true
                while option1_loop
                    print Rainbow("Enter Your City: ").white
                    city_input = gets.strip.capitalize
                ########################################
                    print Rainbow("Enter Your State: ").cyan
                    state_input = gets.strip.upcase
                        if state_input == "NSW" || state_input == "QLD" || state_input == "SA" || state_input == "TAS" || state_input == "VIC" ||state_input == "WA"
                        option1_loop = false
                        else
                            puts Rainbow("Invalid Input, Please Try Again ୧༼ಠ益ಠ༽୨ ").red
                        end
                    end
                ########################################
                country_loop = true
                while country_loop
                    print Rainbow("Enter Your Country: ").green
                    country_input = gets.strip.upcase
                        if country_input == "AUSTRALIA"
                            system ("curl wttr.in/~#{city_input}+#{state_input}+#{country_input}?Q?0")
                            puts ""
                            puts Rainbow("NOTE: If there's no location displayed then it's because your input was invalid and by default we display a demo").red
                            puts Rainbow("\n Here's your requested info . . . ").yellow
                            print "Enter Function Number: "
                            country_loop = false
                        else
                        puts Rainbow("For demonstration purposes, only Australia is available, Try Again ୧༼ಠ益ಠ༽୨ ").red
                        end # End for conditional statements
                    end # end for country loop
            elsif options_input == "2" # If the user enters 2 the following line of code is executed up to end for options2 loop.
                options2_loop = true
                    while options2_loop
                    print Rainbow("Quick Demo, enter your country (For demonstration purposes, only Australia is available): ").cyan
                    just_one_input = gets.strip.capitalize
                    if just_one_input == "Australia"
                        system ("curl wttr.in/#{just_one_input}?0")
                        puts ""
                        puts Rainbow("\n Here's your requested info . . .").yellow
                        options2_loop = false
                    else
                    puts Rainbow("For demonstration purposes, only Australia is available, Try Again").red
                    end # end for options 2 conditional statement
                end # end for options2 loop
            elsif options_input == "r" # if the user enters r (cleans/refresh the terminal) the following line of code is executed up to Location.new.options_table
                system ('clear')
                Location.new.options_table
            ###############################
            elsif options_input == "m" # if the user enters m (browser is opened and plays music in youtube) the following line of code is executed up to  system "open #{url}"
                url = "https://www.youtube.com/watch?v=rsi3gJOTG-U"
                loading
                sleep(1)
                system "open #{url}"
            else
                puts Rainbow("Invalid Input, Try Again").red # if the user input doesn't satisfy any of the above conditional statements this is exectued.
            end # end for condional statements
        end # end for loop
    end # end for the method called intro
####################################
def loading # method for a loading bar (uses progress_bar gem)
  sleep(0.5)
    puts Rainbow("Loading . . .").cyan
    bar = ProgressBar.new( 100, :percentage)
  100.times do
    sleep 0.01
    bar.increment!
  end
end
#####################################
class Main # Class for the main menu table (uses command_line_reporter gem)
  include CommandLineReporter
def run # Class method that displays the main menu's options inside a table
    table(border: true) do
      row color: 'white' do
        column('Functions', width: 25, color: 'white', align: 'center')
        column('Description', width: 80, color: 'white', align: 'center')
      end # def
      row do # row 1
      column('1 - Check the weather in your location', color: 'cyan')
      column('Enter your location: city, state & country (For demonstration purposes, the only country available is Australia)', color: 'cyan')
      end
      row do # row 2
      column('2 - GPS Coordinates', width: 100, color: 'cyan')
      column('Enter your GPS coordinates, it can be anywhere found in Google! We will search the weather for you based on the coordinates you enter', width: 100, color: 'cyan')
      end
      row do # row 3
        column('3 - Area Code', width: 100, color: 'cyan')
        column('Enter your Area Code and we will search the weather near you ', width: 100, color: 'cyan')
      end
      row do
      column('4 - Airport Codes', width: 100, color: 'cyan')
      column('Enter in the Airport Code and we will search the weather near your airport', width: 100, color: 'cyan')
      end
      row do
      column('R - Refresh', width: 100, color: 'cyan')
      column('Pressing R will refresh the screen for you', width: 100, color: 'cyan')
      end
      row do
        column('E - Exit', width: 100, color: 'cyan')
        column('Pressing E will exit the app', width: 100, color: 'cyan')
      end
    end # do
  end # do
end # class
##########################################################
class Location # class for options 1 menu table (uses command_line_reporter gem)
    include CommandLineReporter
  def options_table # class method that displays options 1 menu's options inside a table
    header(title: 'Options Menu!', width: 167, color: 'green', align: 'center', bold: true, timestamp: true)

      table(border: true) do
        row color: 'white' do
          column('Functions', width: 25, color: 'green')
          column('Instructions', width: 80, color: 'green')
        end # def

        row do # row 1
            column('1 - Check the weather in your location', width: 100, color: 'cyan')
            column('Enter your location: city, state & country (For demonstration purposes, the only country available is Australia)', width: 100, color: 'cyan')
        end
        ########################
        row do # row 2
            column('2 - Quick Demo', width: 100, color: 'cyan')
            column('For demonstration purposes, the only country available is Australia', width: 100, color: 'cyan', align: 'center')
        end # end of row 2
        ########################
        row do  # row 3
            column('R - Refresh', width: 100, color:'cyan')
            column('Pressing R will refresh the screen for you', width: 100, color: 'cyan')
        end # end of row 2
        ########################
        row do # row 4
          column('M - Music', width: 100, color: 'cyan')
          column('Bored? Pressing M will play some music whilst using the weather app ԅ(≖‿≖ԅ)', width: 100, color: 'cyan')
        end # end of row 4
        ########################
        row do # row 5
        column('E - Main Menu', width: 100, color: 'cyan')
        column('Pressing E will return you to the main menu', width: 100, color: 'cyan')
        end # end of row 5
        ########################
      end # do
    end # do
  end # class Location
##########################################################
def start

  puts Rainbow("
  ˁ⁽͑ ˚̀˙̭˚́ ⁾̉ˀ ⁼³ ˁ⁽͑ ˚̀˙̭˚́ ⁾̉ˀ ⁼³
  ▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬

   Welcome to the Weather App

  ▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬").cyan

  puts "ˁ⁽͑˙˚̀ˆ̇˚́˙⁾̉ˀ ˁ⁽͑˙˚̀ˆ̇˚́˙⁾̉ˀ ˁ⁽͑˙˚̀ˆ̇˚́˙⁾̉ˀ".cyan
sleep(0.5)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
@full_name = [] # empty array
@stored_password = [] # empty array
######################
f_name_loop = true
while f_name_loop
puts Rainbow("Please Enter Your First Name: ").yellow
@first_name = gets.strip.capitalize
  if @first_name.empty?
    puts Rainbow("Invalid Input!, Please Try Again").red
    # The =~ operator matches the regular expression against a string, and it returns either the offset of the match from the string if it is found, otherwise nil.
  elsif @first_name =~ /^([A-Za-z]*)$/ # /^([A-Za-z]*)$/ means the accepted input are characters from a-z
    f_name_loop = false
  else
    puts Rainbow("Invalid Input!, Please Try Again").red
  end # end for conditional statements
end # end for f_name_loop
#########################
l_name_loop = true
while l_name_loop
puts Rainbow("Please Enter Your Last Name: ").yellow
@last_name = gets.strip.capitalize
  if @last_name.empty?
      # The =~ operator matches the regular expression against a string, and it returns either the offset of the match from the string if it is found, otherwise nil.
    puts Rainbow("Invalid Input!, Please Try Again").red
  elsif @last_name =~ /^([A-Za-z]*)$/ # /^([A-Za-z]*)$/ means the accepted input are characters from a-z
    l_name_loop = false
  else
    puts Rainbow("Invalid Input!, Please Try Again").red
  end # end for conditional statements
end # end for l_name_loop
####################
password_loop = true
while password_loop
puts Rainbow("Please Enter Your New Password (Make sure its only 5 characters long.)
Password Will Be Invisble").orange
@password = STDIN.noecho(&:gets).chomp
  if @password.length == 5 # checks if user's password is 5 characters
    puts Rainbow("Accepted Password").green # if password is 5 characters long display this
  @stored_password << [@password] # store password inside the empty array called @stored_password
  @full_name << [@first_name, @last_name] # store users first & last name inside the empty array called @full_name
  password_loop = false
  else
    puts Rainbow("Did not satisfy password requirement, please try again.").red
    sleep(0.5)
  end # end for conditional statements
end # end for password_loop
########################
puts Rainbow("Welcome #{@first_name} #{@last_name}").orange
sleep(0.5)

exit_menu = true # loop
while exit_menu
puts Rainbow("We Need To Verify Your Password Again (ꐦ°᷄д°᷅)").bg(:red)
    if STDIN.noecho(&:gets).chomp == @password # STDIN.noecho(&:gets).chomp doesnt display users input
    loading
      puts Rainbow("\nPassword Matched and Saved").orange
      exit_menu = false
    else
  puts Rainbow("Password Does Not Match!").red
    end # end for conditional statements
  end #
end # end for exit_menu loop


def after_table # method executed after the table

  exit_aftertable = true
  while exit_aftertable
  puts Rainbow('Please Enter The Selected Number: ').cyan
  user_input = gets.chomp.capitalize
    if user_input == "1" || user_input == "Check"
    puts "Just a moment #{@first_name}"
    puts Rainbow("NOTE: If there's no location displayed then it's because your input was invalid and by default we display a demo").red
    loading
    Location.new.options_table
    intro

    elsif user_input == "2" || user_input == "Gps" || user_input == "Gps coordinates"
    puts Rainbow("NOTE: If there's no location displayed then it's because your input was invalid and by default we display a demo").red
    puts "Just a moment #{@first_name}"
    gps

    elsif user_input == "3" || user_input == "Area code"
    puts Rainbow("NOTE: If there's no location displayed then it's because your input was invalid and by default we display Oymyakon, Russia instead as a demo").red
    puts "Just a moment #{@first_name}"
    area_code

    elsif user_input == "4" || user_input == "Airport codes"
    puts Rainbow("NOTE: If there's no location displayed then it's because your input was invalid and by default we display Oymyakon, Russia instead as a demo").red
    puts "Just a moment #{@first_name}"
    airport_code

    elsif user_input == "R" || user_input == "refresh"
    puts "Clearing your screen for you #{@first_name}"
    system ('clear')
    Main.new.run
    elsif user_input == "E" || user_input == "exit" || user_input == "quit"
    puts "Goodbye #{@first_name}, thank you for using the weather app!"
    sleep(3)
    exit_aftertable = false
    else
    puts Rainbow("Invalid Option, try again（╬ಠ益ಠ)").red
    end # end for conditional statements
  end # end for exit_aftertable loop
end # end for the method called after_table


def airport_code # airport method
  url = "http://www.nationsonline.org/oneworld/IATA_Codes/IATA_Code_L.htm"
  loading
  puts Rainbow(" Airport Database for Codes is Loading . . . .").cyan
  sleep(1)
  system "open #{url}"
  print "
  Please Enter a Airport Code from anywhere in the world: "
  airport_input = gets.strip.upcase
  puts "Getting your information ready #{@first_name} . . . "
  system ("\ncurl wttr.in/#{airport_input}?Q?0")
end

def area_code # area code method
  loading
  print "
  Please Enter the Area Code: "
  area_code = gets.to_i
  sleep(0.5)
  puts "Trying to find your location #{@first_name} . . ."
  puts ""
  system ("curl wttr.in/#{area_code}?0")
end

def gps # gps method that opens the google and finds and lat and long then results the weather
  url = "https://www.google.com.au/maps/search/google+maps+worldwide/@21.5460481,-55.7720207,3z"
  loading
  puts Rainbow(" Google Maps is loading . . . .").cyan
  sleep(1)
  system "open #{url}"
  puts "Please Enter The Latitude"
  userLat = gets.strip
  puts "Please Enter The Longitude"
  userLong = gets.strip
  puts ""
  system ("curl wttr.in/#{userLat},#{userLong}?0")
end

start
Main.new.run
after_table
