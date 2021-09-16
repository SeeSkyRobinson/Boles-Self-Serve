require 'pg'


def create_user(email, password_digest)
    sql = "INSERT INTO users (email, password_digest) VALUES ('#{email}', '#{password_digest}') returning *;"
    new_user = run_sql(sql)
    return new_user[0]
end


def find_user_by_email(email)
    sql = "SELECT * from users WHERE email = '#{email}';"
    result = run_sql(sql)
    if result.count > 0
        return result[0]
    else
        return false      
    end  
end

def find_user_by_id(id)
    sql = "SELECT * from users WHERE id = '#{id}';"
    result = run_sql(sql)
    if result.count > 0
        return result[0]
    else
        return false      
    end  
end
