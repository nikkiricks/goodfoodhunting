# translate the query string into a params hash
# translate the form fields into params hash - anything you send to the server will be in a params hash

# DRY - don't repeat yourself

def run_sql(sql)
  #connects
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: "goodfoodhunting"})
  records = conn.exec(sql)
  #close
  conn.close
  return records
end

def all_dishes()
  return run_sql( "SELECT * FROM dishes;") 
end

def find_one_dish(id)
  return run_sql("SELECT * FROM dishes WHERE id = #{id};").first

end

def create_dish (name, image_url)
  return run_sql("INSERT INTO dishes (name, image_url) VALUES ('#{name} ', ' #{image_url} ') ")
end

def delete_dish (id)
  return run_sql( "DELETE FROM dishes WHERE id = #{id};")
end