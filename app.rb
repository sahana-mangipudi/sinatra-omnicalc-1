require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb :square
end

post("/square") do
  number = params[:number].to_f
  @result = number ** 2
  erb :result
end


get("/square_root/new") do
  erb :square_root
end

post("/square_root") do
  number = params[:number].to_f
  @result = Math.sqrt(number)
  erb :result
end


get ("/random/new") do
  erb :random
end

#generates a random number between specified minimum and maximum 
post ("/random") do
  min = params[:min].to_f
  max = params[:max].to_f
  @result = rand(min..max)
  erb :result
end


get ("/payment/new") do
  erb :payment
end

post "/payment/result" do
  apr = params[:apr].to_f / 100
  years = params[:years].to_i
  principal = params[:principal].to_f

  monthly_rate = apr / 12
  num_payments = years * 12
  monthly_payment = (principal * monthly_rate) / (1 - (1 + monthly_rate)**(-num_payments))

  formatted_payment = monthly_payment.to_fs(:currency)
  formatted_principal = principal_payment.to_fs(:currency) 
  formatted_apr = (apr * 100).round(4).to_s + "%"

  @results = {
    monthly_payment: formatted_payment,
    principal: formatted_principal,
    apr: formatted_apr,
    years: years
  }

  erb :result
end
