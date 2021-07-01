namespace :my_namespace do
  
  desc "Insert data into Companies"
  task task1: :environment do
    File.open('companies.json', 'r') do |file|
      file.each do |line|
        company_attrs = JSON.parse line
        Company.create! company_attrs
      end
    end
  end

  desc "Insert data into Clients"
  task task2: :environment do
    File.open('clients.json', 'r') do |file|
      file.each do |line|
        client_attrs = JSON.parse line
        Client.create! client_attrs
      end
    end
  end

end
