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

def get_current_items(shopping_id)
    sql = "SELECT * FROM receipts WHERE shopping_id = '#{shopping_id}';"
    return run_sql(sql)
end

def get_all_items()
    sql = "SELECT * FROM groceries;"
    return run_sql(sql)
end    

def check_for_receipt(shopping_id, product_id)
    sql = "SELECT * from receipts WHERE product_id = '#{product_id}' AND shopping_id = '#{shopping_id}';"
    results = run_sql(sql).to_a
    if results.length == 0
        return false
    else
        return results[0]
    end
end 

def change_quantity_on_existing_receipt(shopping_id, product_id, quantity, existing_receipt_hash)
    new_quantity = existing_receipt_hash["quantity"] + quantity
    sql = "UPDATE receipts SET quantity = '#{new_quantity}' WHERE shopping_id = '#{shopping_id}' AND product_id = '#{product_id}';"
    run_sql(sql)
end    

def retrieve_item_data(product_id)
    sql = "SELECT * FROM groceries WHERE product_id = '#{product_id}';"
    item_data = run_sql(sql)[0]
    return item_data
end


def insert_new_receipt(shopping_id, product_id, quantity)
    user_id = session[:user_id].to_i
    # grab all the values needed from groceries based on the product id
    item_data = retrieve_item_data(product_id)
    time = Time.now
    sql = <<~HEREDOC
        INSERT INTO receipts (
            shopping_id, 
            user_id, 
            product_id, 
            product_name, 
            unit_cost, 
            unit_type, 
            quantity,
            creation_time
        ) VALUES (
            '#{shopping_id}', 
            #{user_id},
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
    p user_id
    # add in user stuff so its where its the actual user
    sql = "SELECT shopping_id, user_id, min(creation_time), sum(unit_cost * quantity) FROM receipts WHERE user_id = #{user_id} GROUP BY shopping_id, user_id ;"
    run_sql(sql)
end

def delete_receipt(shopping_id)
    sql = "DELETE FROM receipts WHERE shopping_id = '#{shopping_id}';"
    run_sql(sql)
end


    