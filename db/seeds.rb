users = [ {:account_id => "1", :login => "admin", :email => "admin@Company1.org", :password => "12345"},
          {:account_id => "1", :login => "agent", :email => "agent@Company1.org", :password => "12345"},
          {:account_id => "2", :login => "admin", :email => "admin@Company2.org", :password => "12345"},
          {:account_id => "2", :login => "agent", :email => "agent@Company2.org", :password => "12345"},
          {:account_id => "3", :login => "admin", :email => "admin@Company3.org", :password => "12345"},
          {:account_id => "3", :login => "agent", :email => "agent@Company3.org", :password => "12345"} ]


Account.create!(:name => "Company1")
Account.create!(:name => "Company2")
Account.create!(:name => "Company3")

users.each do |row|
  @user = User.new(:login => row[:login],
                  :email => row[:email],
                  :account_id => row[:account_id])
  @user.password = row[:password]
  @user.password_confirmation = row[:password]
  @user.save!
end

10.times do
  PhoneNumber.create!(:number_type => 0,
                      :number => sprintf("8800%07d",rand(9999999)))
end
