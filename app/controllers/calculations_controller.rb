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
        @apr= @apr/10000.round(10)
        @apr=@apr/12
        
        #@monthly_payment = 12
        @monthly_payment = (@principle * (@apr) * ((1+ @apr)**(@years*12))) / (((1+@apr)**(@years*12))-1)
        
        
        render("calculations/flex_payment_template.html.erb")
    end
    def payment_form
        render("calculations/payment_form_template.html.erb")
    end
    
    def payment_form_results
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @interest=params["user_apr"]
        @years=params["user_years"].to_i
        @principle=params["user_pv"].to_i
        @apr=@interest.gsub(".","")
        @apr=@apr.to_i
        @apr= @apr/10000.round(10)
        @apr=@apr/12
        
       @monthly_payment = (@principle * (@apr) * ((1+ @apr)**(@years*12))) / (((1+@apr)**(@years*12))-1)
        
        
        render("calculations/payment_form_results_template.html.erb")
    end
    
    
    
    def square_form

        render("calculations/square_form_template.html.erb")
    end
    def square_form_results
        @user_number=params["user_number"].to_i

        render("calculations/square_form_results_template.html.erb")
    end
    
    
    def square_root_form

        render("calculations/square_root_form_template.html.erb")
    end
    def square_root_form_results
        @user_number=params["user_number"].to_i

        render("calculations/square_root_form_results_template.html.erb")
    end
    
    
    def random_form

        render("calculations/random_form_template.html.erb")
    end
    def random_form_results
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @a=params["user_min"].to_i
        @b=params["user_max"].to_i
        @a=@a*10000
        @b=@b*10000
        @c = rand(@a..@b)
        @c = @c/10000.round(4)

        render("calculations/random_form_results_template.html.erb")
    end
end