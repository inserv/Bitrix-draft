5.times do
  @account = FactoryGirl.create(:account)
  @admin = FactoryGirl.create(:admin, :account_id => @account.id)
  10.times do
    FactoryGirl.create(:agent, :account_id => @account.id)
  end
end

20.times { FactoryGirl.create(:natl_number) }
15.times { FactoryGirl.create(:serv_number) } 
