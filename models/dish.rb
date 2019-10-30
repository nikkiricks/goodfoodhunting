# translate the query string into a params hash
# translate the form fields into params hash - anything you send to the server will be in a params hash

def all_dishes()
  conn = PG.connect(dbname: "goodfoodhunting")
  sql = "SELECT * FROM dishes;"
  dishes = conn.exec(sql)
  conn.close
  return dishes
end

def find_one_dish(id)
  conn = PG.connect(dbname: "goodfoodhunting")
  sql = "SELECT * FROM dishes WHERE id = #{id};"
  dish = conn.exec(sql).first #conn.exec always get an array back of hashes
  conn.close
  return dish
end

def create_dish (name, image_url)
  #no idea about params when it's in the method
  #connect to db
  conn = PG.connect(dbname: "goodfoodhunting")
  #prepare
  # interpolation
  sql = "INSERT INTO dishes (name, image_url) VALUES ('#{name} ', ' #{image_url} ') "
  #exec sql
  conn.exec(sql)
  #close connection
  conn.close
end

def delete_dish (id)
  #no idea about params when it's in the method
  #connect to db
  conn = PG.connect(dbname: "goodfoodhunting")
  #prepare
  # interpolation
  sql = "DELETE FROM dishes WHERE id = #{id};"
  # DELETE FROM dishes WHERE id = 7;
  #exec sql
  conn.exec(sql)
  #close connection
  conn.close
end