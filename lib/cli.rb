class CLI
  attr_accessor :user, :studio

  def greet
    puts "Hi! What is your name?".cyan
    users_name = gets.chomp
    user = User.find_or_create_by(name: users_name)
    puts "================================================================================================================================"
    puts "Hi! Welcome to SongSchedules, #{users_name}, the best resource for fitness schedules and sign-up information in NYC!".cyan
    menu(user)
  end
    puts "================================================================================================================================"

  def menu(user)
    puts "================================================================================================================================"
    puts "MENU".cyan
    puts "1.Sign-up for a session!".cyan
    puts ""
    puts "2.Upcoming Sessions".cyan
    choose = gets.chomp
    if choose == 'Sign-up' || choose == 'sign-up' || choose == '1'
      sign_up?(user)
    elsif choose == 'Upcoming Sessions' || choose == '2' || choose == 'upcoming sessions'
      welcome_back(user)
    else
      puts "Need to select an option"
      menu(user)
    end

  end #end of method

  def sign_up?(user)
    puts 'Do you want to sign-up for a session? Yes or No'.cyan
    input = gets.chomp
    if input == 'yes' || input == 'Yes'
      puts "================================================================================================================================"
      puts 'GREAT, PICK A CATEGORY FOR YOUR SESSION!'.cyan
      #1 CATEGORY ------------This will list all of the category options------------------------------
      Studio.categories.each do |category|
        puts category
      end
      puts ""
      category_for_session = gets.chomp
      puts "================================================================================================================================"

      #2  -----------  This is setting a variable (studios_we_want ) equal to the array of studios that match the desired category ----
      studios_we_want = Studio.all.select do |stu|
        stu.category == category_for_session
      end


      #3 ----------   This will display the list of our studio options based on the category chosen -------------
      puts "WHICH STUDIO DO YOU WANT YOUR [#{category_for_session}] SESSION?".cyan
      studios_we_want.each do |stu|
        puts "#{stu.name}"
      end

      studio_for_session = gets.chomp
      puts "================================================================================================================================"
      puts "WHAT TIME IS YOUR SESSION AT [#{studio_for_session}] (Outline Response: 'YYYY-MM-DD HH:MM')?".cyan
      studio = Studio.find_by(name: "#{studio_for_session}")
      time_for_session = gets.chomp

      #CREATE METHOD
      new_session = Session.create(user_id: user.id, studio_id: studio.id, datetime: time_for_session)

      # -------------LOCATION  ------------This will give you space to list all of the location options------------------------------
      puts "WHAT LOCATION WILL YOUR SESSION AT [#{time_for_session}] BE?".cyan
      location_for_session = gets.chomp

      puts ""
      puts "Confirmation:".red
      puts "You have reserved a [#{category_for_session}] session at [#{studio_for_session}] for [#{time_for_session}] at [#{location_for_session}]".cyan
      puts ""
      puts "================================================================================================================================"
      puts "Go Back!!!".cyan
        #UPDATE METHOD------ this updates the datetime of the session you are signing up for
      input_3 = gets.chomp
      if input_3 == 'yes' || input_3 == 'Yes'
        puts "OH, WAIT..... I MADE A MISTAKE: CHANGE TIME:".cyan
        change_time_for_session = gets.chomp
        new_session.update(datetime: change_time_for_session)
        puts ""
        puts "NEW .... Confirmation:".red
        puts "You have reserved a [#{category_for_session}] session at [#{studio_for_session}] for [#{change_time_for_session}] at [#{location_for_session}]".cyan

      elsif input_3 == 'no' || input_3 == 'No'
        puts "Nope, everything is right!".cyan
        puts "FINAL CONFIRMATION".red
      end
      puts "================================================================================================================================"
      puts ""


        #DELETE METHOD
      # input_2 = gets.chomp
      # if input_2 == 'yes' || input_2 == 'Yes'
      #   puts "================================================================================================================================"
      #   cancel_session(new_session)
      #   puts "SESSION CANCELED"
      # elsif input_2 == 'no' || input_2 == 'No'
      #   puts 'Of course you do not want to cancel your session'
      # end

      # upcoming_sessions(user)

    elsif input == 'no' || input == 'No'
      puts 'That is sad'.cyan
    else
      puts 'Please finish filling out the information'.cyan
    end # end of this crazy long if statement
  end # end of sign_up?


  #DELETE METHOD
  # def cancel_session(new_session)
  #   new_session.delete
  # end

  def upcoming_sessions(user)
    user.sessions.select do |sesh|
      sesh.datetime >= Time.now
    end
  end



  # def welcome_back(user)
  #   puts "================================================================================================================================"
  #   puts "Welcome Back!"
  #   puts "HERE ARE YOUR UPCOMING SESSION IDs:"
  #   upcoming_sessions(user).each do |session|
  #     puts "#{session.id}"
  # end

  #READ METHOD
  def welcome_back(user)
    puts "================================================================================================================================"
    puts "Welcome Back!".cyan
    puts "HERE ARE YOUR UPCOMING SESSION IDs:".cyan
    user_sessions = upcoming_sessions(user)
    user_sessions.each do |session|
      puts "#{session.id}"
    end
    puts "I WANT TO CANCEL ONE OF MY SESSIONS? Yes or Ofc Not!".cyan
    puts""
    puts" I just want to view a single session"
    cancel_this = gets.chomp
    if cancel_this == 'yes' || cancel_this == 'Yes'
      user_session = cancel_session(user_sessions)
    elsif cancel_this == 'view'
        single_session(user_sessions)
    else
      puts "Enjoy your upcoming classes!!"
    end

  end #end of welcome_back



#DELETE METHOD
  def cancel_session(user_sessions)
    puts "WHICH SESSION DO YOU WANT TO CANCEL?".cyan
    user_ans = gets.strip
    Session.delete(user_ans.to_i)
    puts "SESSION CANCELED".red
    user_sessions
  end

  def single_session(user_sessions)

    user_sessions.each do |session|
      puts "#{session.id}"
    end

    user_single_session = gets.strip
    sing_sesh = Session.all.select do |session|
      session.id == user_single_session.to_i
    end

      puts " #{sing_sesh.first.studio.name} "



  end




#'2019-08-01 10:03'




end # End of class
