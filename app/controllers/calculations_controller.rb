class CalculationsController < ApplicationController
    def flex_square
        #incoming actions look like this [:"a_number"=>"5"]
        #rails stores that has in a variable called params
        @user_number=params["a_number"].to_i
        @squared_number=@user_number**2
        






        render("calculations/flex_square_template.html.erb")
        
        
    end
end