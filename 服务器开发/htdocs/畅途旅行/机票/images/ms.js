 if (GDNetMenuDown.isSupported()) {

        var ms = new GDNetMenuDownSet(GDNetMenuDown.direction.down, 0, 0, GDNetMenuDown.reference.bottomLeft);

        var menu1 = ms.addMenu(document.getElementById("menu1"));
        menu1.addItem("- IT数码", "../featuredproducts/Products_list.asp?category_id=118&bitcate=y&category_parentid=4");
        menu1.addItem("- 时尚家电", "../featuredproducts/Products_list.asp?category_id=119&bitcate=y&category_parentid=4");
        menu1.addItem("- 数码影音", "../featuredproducts/Products_list.asp?category_id=120&bitcate=y&category_parentid=4");
        menu1.addItem("- PC配件", "../featuredproducts/Products_list.asp?category_id=127&bitcate=y&category_parentid=4");
        menu1.addItem("- PC外设", "../featuredproducts/Products_list.asp?category_id=128&bitcate=y&category_parentid=4");
		menu1.addItem("- 整机", "../featuredproducts/Products_list.asp?category_id=129&bitcate=y&category_parentid=4");
		menu1.addItem("- 应用软件", "../featuredproducts/Products_list.asp?category_id=201&category_parentid=4");

        var menu2 = ms.addMenu(document.getElementById("menu2"));
        menu2.addItem("- T恤/上衣", "../featuredproducts/Products_list.asp?category_id=143&category_parentid=5");
        menu2.addItem("- 外套/套装", "../featuredproducts/Products_list.asp?category_id=24&category_parentid=5");
        menu2.addItem("- 裤装/裙装", "../featuredproducts/Products_list.asp?category_id=144&category_parentid=5");
        menu2.addItem("- 内衣/睡衣/泳装", "../featuredproducts/Products_list.asp?category_id=26&category_parentid=5");
        menu2.addItem("- 婚纱/晚礼服", "../featuredproducts/Products_list.asp?category_id=145&category_parentid=5");
		menu2.addItem("- 鞋子/袜品", "../featuredproducts/Products_list.asp?category_id=32&category_parentid=5");
        menu2.addItem("- 皮包/皮带", "../featuredproducts/Products_list.asp?category_id=108&category_parentid=5");
		menu2.addItem("- 旅行包/其他", "../featuredproducts/Products_list.asp?category_id=146&category_parentid=5");

        var menu3 = ms.addMenu(document.getElementById("menu3"));
        menu3.addItem("- 珠宝首饰", "../featuredproducts/Products_list.asp?category_id=171&bitcate=y&category_parentid=13");
        menu3.addItem("- 手表", "../featuredproducts/Products_list.asp?category_id=172&bitcate=y&category_parentid=13");
        menu3.addItem("- 眼镜", "../featuredproducts/Products_list.asp?category_id=173&bitcate=y&category_parentid=13");

        var menu4 = ms.addMenu(document.getElementById("menu4"));
        menu4.addItem("- 运动服装", "../featuredproducts/Products_list.asp?category_id=182&bitcate=y&category_parentid=14");
        menu4.addItem("- 户外装备", "../featuredproducts/Products_list.asp?category_id=183&bitcate=y&category_parentid=14");
        menu4.addItem("- 运动装备", "../featuredproducts/Products_list.asp?category_id=184&bitcate=y&category_parentid=14");
        menu4.addItem("- 运动鞋", "../featuredproducts/Products_list.asp?category_id=186&bitcate=y&category_parentid=14");
	
        var menu5 = ms.addMenu(document.getElementById("menu5"));
        menu5.addItem("- 书籍", "../featuredproducts/Products_list.asp?category_id=74&category_parentid=11");
        menu5.addItem("- 音乐", "../featuredproducts/Products_list.asp?category_id=75&category_parentid=11");
        menu5.addItem("- DVD电影", "../featuredproducts/Products_list.asp?category_id=79&category_parentid=11");
        menu5.addItem("- 动漫", "../featuredproducts/Products_list.asp?category_id=81&category_parentid=11");

        var menu6 = ms.addMenu(document.getElementById("menu6"));
        menu6.addItem("- 脸部保养", "../featuredproducts/Products_list.asp?category_id=41&category_parentid=15");
        menu6.addItem("- 彩妆/工具", "../featuredproducts/Products_list.asp?category_id=43&category_parentid=15");
        menu6.addItem("- 品牌香水", "../featuredproducts/Products_list.asp?category_id=109&category_parentid=15");
        menu6.addItem("- 美发护发", "../featuredproducts/Products_list.asp?category_id=111&category_parentid=15");
        menu6.addItem("- 身体保养/沐浴用品", "../featuredproducts/Products_list.asp?category_id=202&category_parentid=15");
        menu6.addItem("- 保健品", "../featuredproducts/Products_list.asp?category_id=169&category_parentid=15");
        menu6.addItem("- 瘦身美体", "../featuredproducts/Products_list.asp?category_id=170&category_parentid=15");

var menu7 = ms.addMenu(document.getElementById("menu7"));
        menu7.addItem("- 幼儿/毛绒玩具", "../featuredproducts/Products_list.asp?category_id=149&category_parentid=114");
        menu7.addItem("- 卡通游戏", "../featuredproducts/Products_list.asp?category_id=150&category_parentid=114");
        menu7.addItem("- 模型玩具/电动玩具", "../featuredproducts/Products_list.asp?category_id=152&category_parentid=114");
	
var menu8 = ms.addMenu(document.getElementById("menu8"));
        menu8.addItem("- 床上用品", "../featuredproducts/Products_list.asp?category_id=155&category_parentid=115");
        menu8.addItem("- 家具/清洁用品", "../featuredproducts/Products_list.asp?category_id=156&category_parentid=115");
        menu8.addItem("- 居家装饰/卫浴装潢", "../featuredproducts/Products_list.asp?category_id=157&category_parentid=115");
        menu8.addItem("- 餐饮/厨房用品", "../featuredproducts/Products_list.asp?category_id=160&category_parentid=115");
        menu8.addItem("- 宠物用品/食品", "../featuredproducts/Products_list.asp?category_id=161&category_parentid=115");

var menu9 = ms.addMenu(document.getElementById("menu9"));
        menu9.addItem("- 赛事纪念品", "../featuredproducts/Products_list.asp?category_id=163&category_parentid=116");
        menu9.addItem("- 纪念币/邮票", "../featuredproducts/Products_list.asp?category_id=164&category_parentid=116");
        menu9.addItem("- 明星纪念品", "../featuredproducts/Products_list.asp?category_id=113&category_parentid=116");
        menu9.addItem("- 艺术品其他", "../featuredproducts/Products_list.asp?category_id=167&category_parentid=116");

        GDNetMenuDown.renderAll();
    }
