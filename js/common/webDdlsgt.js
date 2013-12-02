/**
 * 功能：模糊下拉框具体页面使用版
 * 具体操作：
 * 	① 文本框点击事件：textClk(obj, event, url, boolean, xmlStr)
 * 		obj   	: <必选> 当前操作的文本框对象
 * 		event 	: <必选> 当前的EVENT对象
 * 		url   	: <必选> 触发的Active路径
 * 		boolean	: <可选> 是否需要下拉区域向上展示
 * 		xmlStr	: <可选> 是否已生成触发的XML字符串
 *  ② 下拉图标点击事件：imgClk(obj, url, boolean, xmlStr)
 * 		obj   	: <必选> 当前操作的图标对象
 * 		url   	: <必选> 触发的Active路径
 * 		boolean	: <可选> 是否需要下拉区域向上展示
 * 		xmlStr	: <可选> 是否已生成触发的XML字符串
 * 		
 * 作者：Simon Lv
 * 日期：2010年10月11日
 * 版本：1.0.0
 */
var WebDdlsgt = function(){
	//定义当前高亮的节点
	//定义当前延时Id
	var timeoutId;
	
	//定义文本选择区创建与否标识
	//定义文本选择区可见与否标识
	//定义文本选择区是否向上展示
	var isUp = false;
	
	//定义模糊下拉框总框架-对象
	var sgtDdlDiv;
	//定义模糊下拉框主操作框架标识-对象
	var sgtOptDiv;
	//定义模糊下拉框.文本选择区-对象
	var sgtTxtDiv;
	
	//定义下拉文本框Value值-对象（不可见）
	//定义下拉文本框Text值-对象（可见）
	var ddlTxtObj;
	
	//需要触发的URL
	var URL;
	var xmlStr = null;
	
	/**
	 * 创建生成下拉框展示块
	 */
	function createSlcDiv(){
		//获取匹配元素在当前视口的相对偏移。
		//返回的对象包含两个整形属性：top 和 left。此方法只对可见元素有效。
		//下拉块距离顶部高度
		
		//下拉块自身宽度
		
		// 各个浏览器对边框效果的影响
			//火狐系列的浏览器
			autoNodeTop = autoNodeTop + 4;
			autoNodeWidth = autoNodeWidth;
		}else if($.browser.msie){
			//微软系列的浏览器
			autoNodeTop = autoNodeTop + 6;
			autoNodeWidth = autoNodeWidth + 2;
		}
		
		//自动补全框开始应该隐藏起来
					.width(autoNodeWidth + "px");
		
		if(isUp){
			$(sgtTxtDiv).css("bottom","28px")
						.css("left", sgtOptDivOffset.left + "px");
		}else{
			$(sgtTxtDiv).css("top", autoNodeTop + "px")
						.css("left", sgtOptDivOffset.left - 200 + "px");
		}
		//创建标识
		isCreate = true;
	}
	
	/**
	 * 点击对页面下拉框块展示的切换
	 */
	function imgToggle(){
		//判断下拉框是否为隐藏状态
		if(isShow){
			//隐藏下拉框块
			$(sgtTxtDiv).hide();
			//下拉框为隐藏状态
		}else{
			//展示下拉框块
			$(sgtTxtDiv).show();
			//查询值，并且组织返回生成的数据串
			doShowVal();
			//下拉框为可见状态
		}
	}
	
	/**
	 * 根据参数组织返回生成
	 */
	function doShowVal(){
		//1.首先获取文本框中的内容
		
		//对上次未完成的延时操作进行取消
		//设定定时器，时间间隔为200毫秒，并返回一个延时Id值
			//获得该模糊下拉框的Id标识
			var ontoId = $(sgtDdlDiv).attr("id");
			//获得当前文本框中的隐含值
			//确认触发，将当前值存放到Session中
			
			//是否参数中已经存在XML数据串
			if(xmlStr == null){
				xmlStr = $H.XML2str(createXmlBody(ontoId, wordText, iptVal));
			}
			
			$.ajax({
				url : URL,
				async : false,// 同步
				type : "POST",
				data : xmlStr,
				dataType : "xml",
				global:false,
				success : function(msg) {
					try {
						//将dom对象data转换成JQuery的对象
						//找到所有的word节点
						var wordNodes = jqueryObj.find("v");
						//需要清空auto的内容
						//遍历所有的word节点，取出单词内容，然后将单词内容添加到弹出框中
						wordNodes.each(function(i) {
							//获取单词内容
							var wordNode = $(this);
							//新建div节点，将单词内容加入到新建的节点中
							//将新建的节点加入到弹出框的节点中
							var newDivNode = $("<div>");
							var titleVal = "";
							if(wordNode.find("val").text()){
								titleVal = wordNode.find("val").text();
							}
							//将查询出来的Value值存放到该对象的Title中
							//设定每一个新建的DIV的高度
							//将查询出来的Text值作为文本HTML值存放在该对象中
							newDivNode.html(wordNode.find("tex").text()).appendTo(sgtTxtDiv);
							//数据整体离左边2个单位
							
							//根据生成的DIV的个数，生成下拉文本框的高度
							$(sgtTxtDiv).height(20*(i+1)+"px");
							//如果下拉文本框的高度大于300单位
							if($(sgtTxtDiv).height()>300){
								//将当前文本框高度设置为300单位
								$(sgtTxtDiv).height("300px");
								//将当前文本框显示滚动条
							}else{
								$(sgtTxtDiv).css("overflow-y","hidden");
							}
							
							//鼠标进入事件，高亮节点
								// 将原来的结果取消高亮
								if (highlightindex != -1) {
									$(sgtTxtDiv).children("div").eq(highlightindex)
										.css("background-color", "white").css('color', '#000000');
								}
								//记录新的高亮索引
								highlightindex = i;
								//鼠标进入的节点高亮
							});
							//增加鼠标移出事件，取消当前节点的高亮
							newDivNode.mouseout(function() {
								//取消鼠标移出节点的高亮
							});
							//增加鼠标点击事件，可以进行补齐
								//将选择好的文本值进行赋值
							});
						});
						//如果服务器没有数据返回，则显示弹出框
						if(wordNodes.length > 0) {
							//下拉框可见
							//下拉框为可见状态
						} else {
							//下拉框为隐藏
							$(sgtTxtDiv).hide();
							//下拉框为隐藏状态
						}
					} catch (e) {
						alert('模糊下拉框触发-初始化控件失败!');
					}
				}
			});
		}, 10);
		
		//清空内存中的XML数据串
		xmlStr = null;
	}
	
	/**
	 * 将选择好的文本值进行赋值
	 */
	function addTxt(idx){
		var chkVal = $(sgtTxtDiv).children("div").eq(idx);
		//取出高亮节点的文本内容
		var comTex = chkVal.text();
		//value
		var comVal = chkVal.attr("title");
		//将索引设置为-1
		idx = -1;
		
		//文本框中的内容变成高亮节点的内容
		$(ddlTxtObj).val(comTex);
		//获得Value值
		
		//隐藏下拉对象
		$(sgtTxtDiv).hide();
		//下拉框为隐藏状态
		isShow = false;
	}
	
	/**
	 * 模糊下拉框根据当前值，返回当前的XML串
	 */
	 function createXmlBody(ontoId, text, value){
	 	/* 创建 DOMDocument 对象 */
		var doc = $H.getXMLDocument();

		/* 创建 文挡头 */
		var head = doc.createProcessingInstruction("xml",
				"version=\'1.0\' encoding=\'UTF-8\'");
		/* 添加文档头 */
		doc.appendChild(head);

		/* 创建根节点 创建元素，使用createElement ie和firefox通用，单独使用ie也可以使用createNode(); */
		var root = doc.createElement(Con.rows);
		
		var r = doc.createElement(Con.r);
		// 设置根节点的标识
		r.setAttribute(Con.id, ontoId);
		root.appendChild(r);
		
		// 以val来标示值节点.
		var val = doc.createElement(Con.val);
		var valueNode = doc.createTextNode(value);
		val.appendChild(valueNode);
		r.appendChild(val);
		
		// 以tex来标示值节点.
		var tex = doc.createElement(Con.tex);
		var textNode = doc.createTextNode(text);
		tex.appendChild(textNode);
		r.appendChild(tex);
		
		/* 把根节点添加到文档对象中 over */
		doc.appendChild(root);
		return doc;
	 }
	
	return{
		/**
		 * 文本框点击事件
		 * 
		 * @param obj (当前操作的文本对象)
		 * @param event (当前的EVENT事件)
		 * @param url (触发的Active路径)
		 */
		textClk:function(obj,event,url){
			//触发的Active路径
			URL = url;
			
			//是否向上展示
			if(typeof(arguments[3]) == "boolean"){
				isUp = true;
			}
			
			//是否存在xml串
			if(typeof(arguments[4]) == "string"){
				xmlStr = arguments[4];
			}
			
			//模糊下拉框总框架-对象
			sgtDdlDiv = $(obj).parent().parent().parent();
			
			//模糊下拉框主操作框架标识-对象
			sgtOptDiv = sgtDdlDiv.children(".sgtOptDiv");
		
			//模糊下拉框.文本选择区-对象
			sgtTxtDiv = sgtDdlDiv.children(".sgtTxtDiv");
			
			//下拉文本框Value值（不可见）
			ddlValObj = $(obj).prev("#ddlVal");
			$(ddlValObj).val("");
			
			//下拉文本框Text值（可见）
			
			//创建生成下拉框展示块
			if(!isCreate){
				createSlcDiv();
			}
			
			//处理文本框中的键盘事件
			var keyCode = myEvent.keyCode;
			//如果输入的是数字或者字母，应该将文本框中最新的信息发送给服务器
				|| (keyCode >= 65 && keyCode <= 90) 
				|| (keyCode >= 96 && keyCode <= 105) 
				|| keyCode == 8 
				|| keyCode == 48){
				/* 说明：
				 * (keyCode >= 65 && keyCode <= 90)：大键盘上的字母键<A~Z> 
				 * (keyCode >= 96 && keyCode <= 105)：小键盘上的数字键<0~9>
				 * (keyCode == 8): 退格键
				 * (keyCode == 48): 删除键
				//根据参数值返回生成好的下拉块
				$(sgtTxtDiv).show();
				//下拉框为可见状态
				//展示下拉框中的数据
			} else if (keyCode == 38 || keyCode == 40) {
				// 如果输入的是向上38向下40按键
				if (keyCode == 38) {
					//向上
					var autoNodes = $(sgtTxtDiv).children("div");
					if (highlightindex != -1) {
						//如果原来存在高亮节点，则将背景色改成白色
						autoNodes.eq(highlightindex).css("background-color", "white").css('color', '#000000');
						highlightindex --;
					}
					if (highlightindex == -1) {
						//如果修改索引值以后index变成-1,则将索引值指向最后一个元素
					}
					
					//让现在选择的高亮内容变成蓝色
				} else {
					//向下
					var autoNodes = $(sgtTxtDiv).children("div");
					if (highlightindex != -1) {
						//如果原来存在高亮节点，则将背景色改成白色
						autoNodes.eq(highlightindex).css("background-color", "white").css('color', '#000000');
					}
					highlightindex ++;
					if (highlightindex == autoNodes.length) {
						//如果修改索引值以后index变成节点的长度,则将索引值指向第一个元素
					}
					//让现在选择的高亮内容变成蓝色
				}
			} else if (keyCode == 13) {
				// 如果输入的是回车
				// 下拉框有高亮内容
				if (highlightindex != -1) {
					//将选择好的文本值进行赋值
				} else {
					//下拉框没有高亮内容
					//下拉框为隐藏状态
					//让文本框失去焦点
					$(ddlTxtObj).get(0).blur();
				}
			}
		},
		/**
		 * 下拉图标点击事件
		 * @param obj (当前操作的文本对象)
		 * @param url (触发的Active路径)
		 */
		imgClk:function(obj, url){
			//触发的Active路径
			URL = url;
			
			//是否向上展示
			if(typeof(arguments[2]) == "boolean"){
				isUp = true;
			}
			
			//是否存在xml串
			if(typeof(arguments[3]) == "string"){
				xmlStr = arguments[3];
			}
			
			//模糊下拉框总框架-对象
			sgtDdlDiv = $(obj).parent().parent().parent();
			
			//模糊下拉框主操作框架标识-对象
			sgtOptDiv = sgtDdlDiv.children(".sgtOptDiv");
		
			//模糊下拉框.文本选择区-对象
			sgtTxtDiv = sgtDdlDiv.children(".sgtTxtDiv");
			
			//模糊下拉框.文本框-对象
			var sgtOptIpt = sgtOptDiv.children(".sgtOptIpt");
			//下拉文本框Value值（不可见）
			ddlValObj = $(sgtOptIpt).children("#ddlVal");
			
			//下拉文本框Text值（可见）
			
			//创建生成下拉框展示块
			if(!isCreate){
				createSlcDiv();
			}
			
			//点击对页面下拉框块展示的切换
			imgToggle();
		}
	}
}();
window.$WDSgt = WebDdlsgt;

//点击页面其他地方隐藏下拉框
	//获得页面的Event事件
	var e = event || window.event;
	//获得当前的触发事件的对象
	var elem = e.srcElement||e.target;
	//当前对象存在，并循环
	while(elem){
		//如果当前选择的对象是"sgtBody"和"ddlTxt"时，无返回
			return;
		}
		//将当前对象推向它的父类对象，并循环
	}
	
	//隐藏该对象
});