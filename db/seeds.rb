5.times do
  @account = FactoryGirl.create(:account)
  @admin = FactoryGirl.create(:admin)
  10.times do
    FactoryGirl.create(:agent)
  end
end

20.times { FactoryGirl.create(:natl_number) }
15.times { FactoryGirl.create(:serv_number) } 
