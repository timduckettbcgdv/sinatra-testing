class Generator
  
  def generate
    
    for number in 1..10 do

      @user = User.create(
        :firstname   => "firstname-#{number}",
        :lastname    => "lastname-#{number}"
      )

      @user.accounts.new(
        :balance => 12.34
      )

      @user.save
      
    end
    
  end
  
end

