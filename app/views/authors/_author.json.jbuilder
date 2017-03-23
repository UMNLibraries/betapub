json.extract! author, :id, :internet_id, :first_name, :last_name, :tenure_status, :scopus_author_id, :author_position, :hindex, :dept_id, :dept_name, :created_at, :updated_at
json.url author_url(author, format: :json)
