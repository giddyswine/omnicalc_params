class CalculationsController < ApplicationController
    def flex_square
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @user_number=params["a_number"].to_i
        @squared_number=@user_number**2
        render("calculations/flex_square_template.html.erb")
    end
    def flex_random
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @a=params["a_number"].to_i
        @b=params["b_number"].to_i
        @c = rand(@a..@b)
        
        render("calculations/flex_random_template.html.erb")
    end
    def flex_square_root
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @user_number=params["a_number"].to_i
        @squared_number = (@user_number)**(0.5)
        render("calculations/flex_square_root_template.html.erb")
    end
    def flex_payment
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @interest=params["a_number"]
        @years=params["b_number"].to_i
        @principle=params["c_number"].to_i
        @apr=@interest.gsub(".","")
        @apr=@apr.to_i
        @apr= @apr/10000.round(1)
        @apr=@apr/12
        @interest_percent= @interest.to_i
        @interest_percent= @interest_percent/100.round(2)
        
        @monthly_payment = (@principle * (@apr) * ((1+ @apr)**(@years*12))) / (((1+@apr)**(@years*12))-1)
        
        
        render("calculations/flex_payment_template.html.erb")
    end
    def payment_form
        render("calculations/payment_form_template.html.erb")
    end
    
    def payment_form_results
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @interest=params["user_apr"].to_f   
        @years=params["user_years"].to_i
        @principle=params["user_pv"].to_i
        @apr= @interest/100
        @apr=@apr/12
        
       @monthly_payment = (@principle * (@apr) * ((1+ @apr)**(@years*12))) / (((1+@apr)**(@years*12))-1)
        
        
        render("calculations/payment_form_results_template.html.erb")
    end
    
    
    
    def square_form

        render("calculations/square_form_template.html.erb")
    end
    def square_form_results
        @user_number=params["user_number"].to_f

        render("calculations/square_form_results_template.html.erb")
    end
    
    
    def square_root_form

        render("calculations/square_root_form_template.html.erb")
    end
    def square_root_form_results
        @user_number=params["user_number"].to_f

        render("calculations/square_root_form_results_template.html.erb")
    end
    
    
    def random_form

        render("calculations/random_form_template.html.erb")
    end
    def random_form_results
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @a=params["user_min"].to_f  
        @b=params["user_max"].to_f  
        @a=@a*10000
        @b=@b*10000
        @c = rand(@a..@b)
        @c = @c/10000

        render("calculations/random_form_results_template.html.erb")
    end


    def word_count_form

        render("calculations/word_count_form_template.html.erb")
    end
    def word_count_results
        @text=params["user_text"]
        @special_word=params["user_word"]
        
        @word_count = @text.split.count
        @character_count_with_spaces = @text.size
    
        @character_count_without_spaces = @text.count('^ ')
        
        @capitalizesw = @special_word.capitalize
        @countaaaa = @text.gsub(@special_word,"aaaaa")
        @countaaaa = @countaaaa.gsub(@capitalizesw,"aaaaa")
        
        @countaaaa = @countaaaa.count ("aaaaaa")
        @counttext = @text.count ("aaaaa")
        
        @occurrences =  (@countaaaa-@counttext)/4       
            
            
        
        
        
        render("calculations/word_count_form_results_template.html.erb")
    end

    def stats_form

        render("calculations/stats_form_template.html.erb")
    end
    def stats_results
        @numbers=params["list_of_numbers"].gsub(',', '').split.map(&:to_f)
        @sorted_numbers = @numbers.sort
    
        @count = @numbers.count
    
        @minimum = @numbers.min
    
        @maximum = @numbers.max
    
        @range = @maximum-@minimum
        
        if @count.odd?
          @halfed=@count/2+1
          @your_output = @numbers[@halfed]
        else
          @abc=@count/2
          @bcd=@abc-1
          @your_output = (@sorted_numbers[@abc]+@sorted_numbers[@bcd])/2
        end
    
        @median= @your_output
        
        @sum = @numbers.inject(0, :+)
    
        @mean = @sum/@count
        
        average=@mean
        squared_numbers=[]
        
        @sorted_numbers.each do |num|
            squared = (num-average)**2
          squared_numbers.push(squared)
        end  
        
        @variance = squared_numbers.sum/@count
    
        @standard_deviation = @variance ** 0.5
        render("calculations/stats_results_template.html.erb")
    end

end