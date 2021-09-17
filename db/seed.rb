
require_relative '../models/list.rb'



items = [
{   product_name: "apples",
    image_url: "https://www.gisymbol.com/wp-content/uploads/2017/08/AustralianApple.png",
    unit_cost: 5,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 9
},
{   product_name: "oranges",
    image_url: "https://nippys.com.au/site/wp-content/uploads/2016/11/Orange_Shutterstock_600x600-600x600.jpeg",
    unit_cost: 5,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 9
},
{   product_name: "bananas",
    image_url: "https://cdn0.woolworths.media/content/wowproductimages/large/133211.jpg",
    unit_cost: 9,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 8
},
{   product_name: "pears",
    image_url: "https://www.gisymbol.com/wp-content/uploads/2017/08/Australian-Pears.png",
    unit_cost: 9,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 8
},
{   product_name: "lemons",
    image_url: "https://pyxis.nymag.com/v1/imgs/fb2/43f/35f659aa53b6c76e1e7d18eaa8270ecf6e-01-lemon-deodorant.rsquare.w700.jpg",
    unit_cost: 12,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 7
},
{   product_name: "potatoes",
    image_url: "https://sc04.alicdn.com/kf/Ub6c21d80565841e99c7fbf2bfa776fc2a.jpg",
    unit_cost: 3,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 7
},
{   product_name: "tomatoes",
    image_url: "https://cdn0.woolworths.media/content/wowproductimages/large/169438.jpg",
    unit_cost: 5,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 8
},
{   product_name: "onions",
    image_url: "https://kenlittlesfruitandveg.com.au/wp-content/uploads/2020/03/brown-onions-800px.jpg",
    unit_cost: 3,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 8
},
{   product_name: "garlic",
    image_url: "https://www.jessicagavin.com/wp-content/uploads/2019/09/types-of-garlic-1-1200.jpg",
    unit_cost: 3,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 7
},
{   product_name: "sweet potatoes",
    image_url: "https://www.saveur.com/uploads/2019/02/08/QJEKKXBP4HLY3KHBG3VM2I36FE.jpg",
    unit_cost: 4,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 3
},
{   product_name: "ginger",
    image_url: "https://www.doorsteporganics.com.au/image/optimised/large/5355.jpg",
    unit_cost: 18,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 5
},
{   product_name: "carrots",
    image_url: "https://www.irishtimes.com/polopoly_fs/1.3818057.1551977600!/image/image.jpg_gen/derivatives/ratio_1x1_w1200/image.jpg",
    unit_cost: 6,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 7
},
{   product_name: "lettuce",
    image_url: "https://assets.epicurious.com/photos/5ef0e382c0f6cca21c0e6cd7/1:1/w_3466,h_3466,c_limit/Lettuce_HERO_060320_8897.jpg",
    unit_cost: 6,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 7
},
{   product_name: "celery",
    image_url: "https://cdn.shopify.com/s/files/1/0206/9470/products/1472-done_1024x1024.jpg?v=1620626571",
    unit_cost: 6,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 5
},
{   product_name: "bok-choi",
    image_url: "https://www.veggycation.com.au/siteassets/veggycationvegetable/bok-choy.jpg",
    unit_cost: 6,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 4
},
{   product_name: "broccolini",
    image_url: "https://i1.wp.com/www.gardeningchannel.com/wp-content/uploads/2015/03/broccolini.jpg?fit=639%2C640&ssl=1",
    unit_cost: 6,
    unit_type: "kg",
    quantity: 0,
    department: "fruit and veg",
    popularity: 5
},
{   product_name: "butter",
    image_url: "https://www.stdavid.com.au/wp-content/uploads/2020/01/Butter-block.jpg",
    unit_cost: 12,
    unit_type: "kg",
    quantity: 0,
    department: "diary",
    popularity: 9
},
{   product_name: "milk",
    image_url: "https://cdn0.woolworths.media/content/wowproductimages/large/145536.jpg",
    unit_cost: 3,
    unit_type: "kg",
    quantity: 0,
    department: "diary",
    popularity: 10
},
{   product_name: "cheese",
    image_url: "https://www.ecosystemmarketplace.com/wp-content/uploads/2019/11/Swiss-Cheese.jpg",
    unit_cost: 20,
    unit_type: "kg",
    quantity: 0,
    department: "diary",
    popularity: 7
},
{   product_name: "yoghurt",
    image_url: "https://cdn0.woolworths.media/content/wowproductimages/large/331963.jpg",
    unit_cost: 12,
    unit_type: "kg",
    quantity: 0,
    department: "diary",
    popularity: 4
},
{   product_name: "cream",
    image_url: "https://thehiddenveggies.com/wp-content/uploads/2021/01/whipped-cream-sq-2.jpg",
    unit_cost: 8,
    unit_type: "kg",
    quantity: 0,
    department: "diary",
    popularity: 5
},
{   product_name: "steak",
    image_url: "https://www.jessicagavin.com/wp-content/uploads/2018/06/how-to-reverse-sear-a-steak-11-1200.jpg",
    unit_cost: 24,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 8
},
{   product_name: "pork chops",
    image_url: "https://rasamalaysia.com/wp-content/uploads/2018/10/garlic-butter-pork-chops-thumb.jpg",
    unit_cost: 20,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 8
},
{   product_name: "beef mince",
    image_url: "https://sutcliffemeat.com.au/wp-content/uploads/2017/04/mince5.jpg",
    unit_cost: 8,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 9
},
{   product_name: "pork mince",
    image_url: "https://countrystylesmallgoods.com.au/wp-content/uploads/Pork_Mince_815x815.jpg",
    unit_cost: 9,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 8
},
{   product_name: "chicken breasts",
    image_url: "https://rasamalaysia.com/wp-content/uploads/2020/05/boneless-chicken-breasts-thumb.jpg",
    unit_cost: 12,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 9
},
{   product_name: "lamb shoulder",
    image_url: "https://veenaazmanov.com/wp-content/uploads/2016/11/slow-cooked-lamb-shoulder-9.jpg",
    unit_cost: 12,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 6
},
{   product_name: "bacon",
    image_url: "https://www.wholesomeyum.com/wp-content/uploads/2019/01/wholesomeyum-How-To-Cook-Bacon-in-the-Oven-Crispy-Easy-Way-10.jpg",
    unit_cost: 9,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 8
},
{   product_name: "beef rump",
    image_url: "https://www.farmison.com/community/wp-content/uploads/2017/04/rump-joint.jpg",
    unit_cost: 17,
    unit_type: "kg",
    quantity: 0,
    department: "meat",
    popularity: 7
},
{   product_name: "pasta",
    image_url: "https://www.jessicagavin.com/wp-content/uploads/2020/07/how-to-cook-pasta-3-1200.jpg",
    unit_cost: 3,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 7
},
{   product_name: "rice",
    image_url: "https://www.jessicagavin.com/wp-content/uploads/2020/03/how-to-cook-rice-16-1200.jpg",
    unit_cost: 4,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 8
},
{   product_name: "soy sacue",
    image_url: "https://cdn0.woolworths.media/content/wowproductimages/large/036882.jpg",
    unit_cost: 8,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 8
},
{   product_name: "balsamic vinegar",
    image_url: "https://cdn.shopify.com/s/files/1/0143/0306/8224/products/cornwellbalsamicvinegarofmodena.png?v=1588933161",
    unit_cost: 6,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 5
},
{   product_name: "bread",
    image_url: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/homemade-bread-horizontal-1547759080.jpg?crop=0.671xw:1.00xh;0.0801xw,0&resize=640:*",
    unit_cost: 4,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 9
},
{   product_name: "tissues",
    image_url: "https://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_1000x1000/SC56070_tork_premium_2_ply_facial_tissues_100_sheets.jpg",
    unit_cost: 1,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 7
},
{   product_name: "toilet paper",
    image_url: "https://cdn.shopify.com/s/files/1/1714/1579/products/TOILET_PAPER_grande.jpg?v=1583276548",
    unit_cost: 4,
    unit_type: "",
    quantity: 0,
    department: "misc",
    popularity: 6
}
]

items.each do |item|
    seed_groceries(item[:product_name], item[:image_url], item[:unit_cost], item[:unit_type], item[:quantity], item[:department], item[:popularity])
end    




# names = ["dummy_data_milk", "dummy_data_bacon", "dummy_data_bread", "dummy_data_cheese", "dummy_data_carrots", "dummy_data_eggs", "dummy_data_lettuce", "dummy_data_butter", "dummy_data_steak"]

# unit_cost = (1..10).to_a

# unit_type = "unit g kg mL L".split(' ')

# quantity = 0

# names.each do |name|
#     seed_groceries(name, unit_cost.sample, unit_type.sample, quantity)
# end
