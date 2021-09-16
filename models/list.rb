require 'pg'
require_relative '../lib/helpers.rb'

def seed_groceries(product_name, image_url, unit_cost, unit_type, quantity, department, popularity)
    sql = <<~HEREDOC    
        INSERT INTO groceries (
            product_name, 
            image_url, 
            unit_cost, 
            unit_type, 
            quantity, 
            department, 
            popularity
        ) VALUES (
            '#{product_name}', 
            '#{image_url}', 
            #{unit_cost}, 
            '#{unit_type}', 
            #{quantity}, 
            '#{department}', 
            #{popularity}
        );
    HEREDOC
    run_sql(sql)
end

def get_current_items(session_id)
    sql = "SELECT * FROM receipts WHERE session_id = '#{session_id}';"
    return run_sql(sql)
end

def get_all_items()
    sql = "SELECT * FROM groceries;"
    return run_sql(sql)
end    

def check_for_receipt(session_id, product_id)
    sql = "SELECT * from receipts WHERE product_id = '#{product_id}' AND session_id = '#{session_id}';"
    results = run_sql(sql).to_a
    if results.length == 0
        return false
    else
        return results[0]
    end
end 

def change_quantity_on_existing_receipt(session_id, product_id, quantity, existing_receipt_hash)
    new_quantity = existing_receipt["quantity"].to_i + quantity.to_i
    sql = "UPDATE receipts SET quantity = '#{new_quantity}' WHERE session_id = '#{session_id}' AND product_id = '#{product_id}';"
    run_sql(sql)
end    

def retrieve_item_data(product_id)
    sql = "SELECT * FROM groceries WHERE product_id = '#{product_id}';"
    item_data = run_sql(sql)[0]
    return item_data
end


def insert_new_receipt(session_id, product_id, quantity)
    user_id = session[:user_id]
    # grab all the values needed from groceries based on the product id
    item_data = retrieve_item_data(product_id)
    time = Time.now.strftime("%d/%m/%Y %H:%M")
    sql = <<~HEREDOC
        INSERT INTO receipts (
            session_id, 
            user_id, 
            product_id, 
            product_name, 
            unit_cost, 
            unit_type, 
            quantity,
            creation_time
        ) VALUES (
            '#{session_id}', 
            '#{user_id}',
            '#{product_id}',
            '#{item_data['product_name']}',
            '#{item_data['unit_cost']}',
            '#{item_data['unit_type']}',
            '#{quantity}',
            '#{time}'
        );
    HEREDOC
    run_sql(sql)
end


def find_user_receipts(user_id)

    # add in user stuff so its where its the actual user
    sql = "SELECT session_id, min(creation_time), sum(unit_cost * quantity) FROM receipts GROUP BY session_id;"
    run_sql(sql)
end



# def find_current_selections()
#     sql = "SELECT * FROM list_in_progress;"
#     return run_sql(sql)
# end

# def insert_new_record(table, option, quantity)
#     db = PG.connect(dbname: 'project2')
#     sql = "INSERT INTO #{table} (title, quantity) VALUES ('#{option}', '#{quantity}');"
#     return run_sql(sql)
# end

# def update_quantity(title, update_quantity)
#     old_quantity_tuple = PG.connect(dbname: 'project2').exec("SELECT quantity FROM list_in_progress WHERE title = '#{title}';")
#     new_quantity = old_quantity_tuple[0]["quantity"].to_i + update_quantity.to_i
#     sql = "UPDATE list_in_progress SET quantity = '#{new_quantity}' WHERE title = '#{title}';"
#     run_sql(sql)
# end    

# def find_all_options() 
#     sql = "SELECT title FROM all_options;"
#     return run_sql(sql)
# end

    