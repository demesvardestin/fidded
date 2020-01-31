# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = [
        "https://image.goat.com/crop/1500/attachments/product_template_additional_pictures/images/026/409/545/original/503581_01.jpg.jpeg?1569438515",
        "https://image.goat.com/crop/1500/attachments/product_template_pictures/images/025/850/349/original/510815_601.png.png",
        "https://image.goat.com/crop/1500/attachments/product_template_pictures/images/010/883/179/original/506363_W05G0_1000.png.png",
        "https://image.goat.com/crop/1500/attachments/product_template_additional_pictures/images/016/779/417/original/468484_01.jpg.jpeg?1544212894",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/025/377/609/original/529368_01.jpg.jpeg?1567193788",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/018/783/118/original/488879_01.jpg.jpeg?1550260861",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/025/302/850/original/482560_01.jpg.jpeg?1567029656",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/016/106/997/original/351614_01.jpg.jpeg?1542251048",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/014/979/041/original/105568_01.jpg.jpeg?1538074941",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/020/806/492/original/461782_01.jpg.jpeg?1555959706",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/026/086/752/original/482248_01.jpg.jpeg?1568749077",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/025/336/525/original/533450_01.jpg.jpeg?1567105527",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/023/553/668/original/522753_01.jpg.jpeg?1563217281",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/019/471/970/original/487214_01.jpg.jpeg?1552100472",
        "https://image.goat.com/crop/375/attachments/product_template_pictures/images/027/187/007/original/CT3610_100.png",
        "https://image.goat.com/crop/375/attachments/product_template_pictures/images/026/595/321/original/CJ6951_800.png.png",
        "https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/022/442/269/original/519943_01.jpg.jpeg?1560366363"
    ]
    
names = [
        "Addidas Yeezy Boost 350",
        "Jordan 1 Retro High First Class",
        "Nike VaporMax Gliese White",
        "Li-Ning Way of Wade",
        "Air Max 97 Cocoa Snake",
        "Golf Le Fleur x Chuck 70 'Flame'",
        "SpongeBob SquarePants x Kyrie 5 'Pineapple House'",
        "OFF-WHITE x Air Force 1 Low '07 'MCA'",
        "Yeezy Boost 350 V2 'Clay'",
        "Air Force 1 Low '07 'What The NYC'",
        "Uninterrupted x Air Force 1 Low QS 'More Than'",
        "Blackburn SPZL 'Collegiate Green'",
        "Cortez 'Day of the Dead'",
        "Wmns Air Jordan 1 Retro High OG 'Fearless'",
        "Tetris x RS 9.8 '35th Anniversary'",
        "Novaturbo 'Branch'",
        "Response Hoverturf Zip 'Maroon'"
    ]

sizes = ["X-Small", "Small", "Medium", "Large", "X-Large", "XX-Large"]
brands = ["Nike", "Addidas", "Jordan", "Yeezy", "Gucci", "Balenciaga"]
categories = ["Shirts", "Sweaters", "Dresses", "Tops & Tees", "Skirts",
                "Jackets & Coats", "Pants", "Activewear", "Shoes", "Accessories"]

if FitPic.count > 0
    FitPic.all.each do |fp|
        fp.destroy
    end
else
    500.times.each do |t|
        fp = FitPic.create(customer_id: rand(1..2), url: urls[rand(0..urls.length - 1)])
        
        ItemRequest.create(
            fit_pic_id: fp.id,
            item_name: names[rand(0..names.length - 1)],
            item_description: Faker::Lorem.paragraph(sentence_count: 18),
            item_size: sizes[rand(0..sizes.length - 1)],
            item_brand: brands[rand(0..brands.length - 1)],
            men_or_women: ["Men", "Women"][rand(0..1)],
            category: categories[rand(0..categories.length - 1)],
            price_offer: rand(30..500).to_s
            )
    end
end