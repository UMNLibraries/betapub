# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
##
# Seed UMN affiliate author data
#
# 1) Open the publication data json file
# 2) Loop thru the publications
# 3) Find or create an Author entry for each affiliate
# 4) Profit!

publication_data = JSON.parse(File.read("#{Rails.root.join('data', 'publication-data.json')}"))
publication_data.each do |publication|
  publication['affiliateAuthors'].each do |author|
    author_data = JSON.parse(author)
    author = Author.find_or_initialize_by(:internet_id => author_data['internetID'])
    author.first_name = author_data['firstName']
    author.last_name = author_data['lastName']
    author.tenure_status = author_data['tenureStatus']
    author.dept_name = author_data['deptName']
    author.dept_id = author_data['deptId']
    author.scopus_author_id = author_data['scopus_author_id']

    begin
      author.save
    rescue
      puts "Hey! I failed #{author_data['internetID']}"
    end
  end
end
