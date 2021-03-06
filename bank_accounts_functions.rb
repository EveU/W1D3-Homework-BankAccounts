ACCOUNTS = [
  {
    holder_name: "Jay",
    amount: 55,
    type: "business"
  },
  {
    holder_name: "Rick",
    amount: 1,
    type: "personal"
  },
  {
    holder_name: "Keith",
    amount: 500,
    type: "business"
  },
  {
    holder_name: "Valerie",
    amount: 100,
    type: "personal"
  },
  {
    holder_name: "Michael",
    amount: 5,
    type: "personal"
  },
  {
    holder_name: "Kate",
    amount: 2000,
    type: "business"
  },
  {
    holder_name: "Tony",
    amount: 150,
    type: "personal"
  },
  {
    holder_name: "Sandy",
    amount: 4500,
    type: "business"
  },
]

def number_of_bank_accounts()
  ACCOUNTS.length
end

def first_bank_account_holder()
  ACCOUNTS.first[:holder_name]
end

def print_owner_names()
  ACCOUNTS.each {|acc| puts acc[:holder_name] }
end

def total_cash_in_bank(type=nil)
  total_amount = 0
  ACCOUNTS.each { |acc| total_amount += acc[:amount] if !type || acc[:type] == type }
  total_amount
end

def last_bank_account_holder()
  ACCOUNTS.last[:holder_name]
end

def average_bank_account_value()
  (total_cash_in_bank.to_f / number_of_bank_accounts).round(2)
end


#**Replaced by updated total_cash_in_bank**
# def total_cash_in_business_accounts()
#   business_total = 0
#   ACCOUNTS.each { |acc| business_total += acc[:amount] if acc[:type] == "business" }
#   business_total
# end


def largest_bank_account_holder(type=nil)
  largest_account = {holder_name: "", amount: 0}
  ACCOUNTS.each do |acc|
    if acc[:amount] > largest_account[:amount] && !type || acc[:type] == type 
      largest_account = acc
    end
  end
  largest_account[:holder_name]
end


#**Replaced by updated largest_bank_account_holder**
# def largest_pers_acc_holder()
#   largest_account = {}
#   largest_account_amount = 0
#   ACCOUNTS.each { |acc|
#     if (acc[:amount] > largest_account_amount) && (acc[:type] == "personal")
#       largest_account = acc
#       largest_account_amount = acc[:amount]
#     end
#   }
#   largest_account[:holder_name]
# end

##EXTRAS

#**Replaced by updated total_cash_in_bank**
# def total_cash_in_personal_accounts()
#   personal_total = 0
#   ACCOUNTS.each { |acc| personal_total += acc[:amount] if acc[:type] == "personal" }
#   personal_total
# end

def business_vs_personal(business, personal)
  difference = business - personal
  if difference == 0
    return "The total amount in business accounts is the same as the total amount in personal accounts!"
  elsif difference > 0
    return "There is #{difference} more in business accounts than in personal accounts."
  else
    return "There is #{-difference} more in personal accounts than in business accounts."
  end
end

def create_new_account()
  new_account = {}
  #get account holder
  puts "Who would you like to create an account for?"
  new_account[:holder_name] = gets.chomp
  #get account amount
  puts "What is the initial amount?"
  new_account[:amount] = gets.chomp.to_i
  #get account type
  puts "What type of account is it? (business/personal)"
  new_account[:type] = gets.chomp.downcase
  until new_account[:type] == "business" || new_account[:type] == "personal"
    puts "Invalid account type. Please enter business or personal:"
    new_account[:type] = gets.chomp.downcase
  end
  new_account
end
