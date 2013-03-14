FactoryGirl.define do

  sequence :company do |n|
	"Company#{n}"
  end
  
  sequence :mobile_num do |n|
    sprintf('9%09d', rand(999999999))
  end
  
  sequence :agent do |n|
    "agent#{n}"
  end
  
  sequence :first_name do |n|
    "name#{n}"
  end
  
  sequence :last_name do |n|
    "family#{n}"
  end
  
  sequence :account do |n|
	10000 + n
  end

  factory :natl_number, class: PhoneNumber do |n|
    n.number { sprintf('812%07d', rand(9999999)) }
    n.number_type 0
  end

  factory :serv_number, class: PhoneNumber do |n|
    n.number { sprintf('8800%05d', rand(99999)) }
    n.number_type 1
  end
  
  factory :account do |a|
	a.id { generate(:account) }
	a.name { generate(:company) }
	a.nat_number_count 2
	a.serv_number_count 1
  end
  
  factory :admin, class: User do |u|
    u.login 'admin'
	u.password '12345'
	u.password_confirmation '12345'
	u.account_id { generate(:account) }
	u.first_name "admin"
	u.last_name "admin"
	u.email "admin@example.com"
	u.phone { generate(:mobile_num) }
  end
  
  factory :agent, class: User do |u|
    u.login { generate(:agent) }
	u.password '12345'
	u.password_confirmation '12345'
	u.account_id { generate(:account) }
	u.first_name { generate(:first_name) }
	u.last_name { generate(:last_name) }
	u.email "agent@example.com"
	u.phone { generate(:mobile_num) }
  end
end
