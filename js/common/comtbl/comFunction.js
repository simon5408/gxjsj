/**
 * 功能：通用的功能类操作包
 * 		
 * 作者：Simon Lv
 * 日期：2010年9月27日
 * 版本：1.0.0
 */
var CommonFunction = function(){
	return{
		/**
		 * 隐藏右键
		 */
		forbidRightMouse : function(){
			$(document).bind("contextmenu", function(e){
				return false;
			})
		},
		
		/**
		 * 初始化Loading
		 */
		loadImg : function(loadId){
			$('#'+loadId).bind('ajaxStart',function(){
				$(this).fadeIn(200);
			}).bind('ajaxStop',function(){
				$(this).fadeOut(300);
			});
		},
		
		/**
		 * 组织生成选择框构件对象		 *
		 * @param msg 		（回调数据对象）
		 * @param selName 	（选择框构件的ID名称）		 * @param nodeName 	（回调数据XML对象中节点名称）
		 *
		 */
		createSelectData : function(msg, selName, nodeName){
		   
			//获得选择构件对象
			var sel = $("#"+selName).get(0);
			//定义文本值和属性值           
			var val, tex;
			
			//清空选择构件对象
			sel.options.length = 0;
			//添加选择构件默认初始化值             
			sel.options.add(new Option("-- 不限 --","-99"));
			if(typeof($(msg).find(nodeName)[0]) != 'undefined'){
			
				//定义V节点对象
				var types = $($(msg).find(nodeName)[0]).find(Con.v);
				//循环V节点对象
				for(var i=0;i<types.length;i++){
					//获得属性值
				 	val = $(types[i]).find(Con.val).text();
				 	//获得文本值
				 	tex = $(types[i]).find(Con.tex).text();
				 	
				 	//选择构件添加选择列                     
				 	sel.options.add(new Option(tex,val));
				}
			}
		},
		
		/**
		 * 读取回调对象，组织列表信息		 *
		 * @param msg （回调数据对象）
		 *
		 */
		createTblData : function(msg){
			//获得列表框对象			var elmObj= $($(msg).find(Con.r)[0]);
			 
			//获得存放列表数据对象ID值			var ontoId = elmObj.attr(Con.id);
			
			//获得列表数据
			var text = $H._4096(elmObj[0]);
			
			//组织显示列表数据
			Tbl.initTbl(ontoId, text);
		},
		
				/**
		 * 读取回调对象，组织列表信息
		 *
		 * @param msg （回调数据对象）
		 *
		 */
		createTblDataByWs : function(msg){
			//获得列表框对象
			var elmObj= $($(msg).find(Con.r)[0]);
			 
			//获得存放列表数据对象ID值
			var ontoId = elmObj.attr(Con.id);
			
			//获得列表数据
			var text = $H._4096(elmObj[0]);
			
			//组织显示列表数据
			$JAT.initTbl(ontoId, text);
		},
		
		/**
		 * 读取回调对象，组织文本构件值		 * 说明：回调数据XML对象中的'节点名称'与'文本构件ID名称'需完全一致		 *
		 * @param msg （回调数据对象）
		 * @param eleName （回调数据XML对象中节点名称和文本构件ID名称）		 *
		 */
		revertXml2Data : function(msg, eleName){
			if(typeof($(msg).find(eleName)) != 'undefined'){
				var eleVal = $(msg).find(eleName).text();
				$("#"+eleName).attr("value",eleVal);
			}
		},
		
		/**************************/
		/****** 具体的XML串操作 ******/
		/**************************/
		
		createDocumentHead : function(){
			/* 创建 DOMDocument 对象 */
			var doc = $H.getXMLDocument();
			/* 创建 文挡头 */
			var head = doc.createProcessingInstruction("xml","version=\'1.0\' encoding=\'UTF-8\'");
			/* 添加文档头 */
			doc.appendChild(head);
			
			return doc;
		},
		
		/**
		 * 创建根节点对象		 * 说明：XML Document对象中的'节点名称'与'文本构件ID名称'需完全一致		 *
		 * @param doc 		（XML Document对象）		 * @param root 		（XML 父节点对象）
		 * @param eleName 	（XML对象中节点名称和文本构件ID名称）		 */
		createElement : function(doc, root, eleName){
			//创建节点对象
			var element = doc.createElement(eleName);
			//创建节点值对象			var elementTextNode = doc.createTextNode($.trim($("#"+eleName).val()));
			//将值对象存放于节点对象中			element.appendChild(elementTextNode);
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		},
		
		/**
		 * 创建根节点对象
		 *
		 * @param doc 			（XML Document对象）
		 * @param root 			（XML 父节点对象）
		 * @param eleName 		（XML对象中节点名称）
		 * @param contentName 	（XML对象中内容节点名称）
		 * @param idVal 		（XML对象中属性ID值）
		 * @param objId 		（文本构件ID名称）
		 */
		createContentEle : function(doc, root, eleName, contentName, idVal, objId){
			//创建节点对象
			var element = doc.createElement(eleName);
			//增加属性ID
			if(idVal != null && idVal != ""){
				element.setAttribute(Con.id, idVal);
			}
			
			//定义内容节点对象
			var contentEle;
			//定义节点值对象
			var contentEleNode;
			
			//获得文本构件值
			var objVals = $.trim($("#"+objId).val()).split(Con.sept);
			
			//循环
			for(var i=0; i<objVals.length; i++){
				//创建内容节点对象
				contentEle = doc.createElement(contentName);
				//创建节点值对象
				contentEleNode = doc.createTextNode(objVals[i]);
				
				//将值对象存放于节点对象中
				contentEle.appendChild(contentEleNode);
				
				//将节点对象存放于根节点对象中
				element.appendChild(contentEle);
			}
			
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		},
		
		/**
		 * 创建根节点对象
		 *
		 * @param doc 			（XML Document对象）
		 * @param root 			（XML 父节点对象）
		 * @param eleName 		（XML对象中节点名称）
		 * @param contentName 	（XML对象中内容节点名称）
		 * @param idVal 		（XML对象中属性ID值）
		 * @param objId 		（文本构件ID名称）
		 */
		createSngContentEle : function(doc, root, eleName, contentName, idVal, objId){
			//创建节点对象
			var element = doc.createElement(eleName);
			//增加属性ID
			if(idVal != null && idVal != ""){
				element.setAttribute(Con.id, idVal);
			}
			
			//创建内容节点对象
			var contentEle = doc.createElement(contentName);
			//创建节点值对象
			var contentEleNode = doc.createTextNode($.trim($("#"+objId).val()));
			
			//将值对象存放于节点对象中
			contentEle.appendChild(contentEleNode);
			
			//将节点对象存放于根节点对象中
			element.appendChild(contentEle);
			
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		},
		
		/**
		 * 创建根节点对象(依据ID取值)
		 *
		 * @param doc 		（XML Document对象）
		 * @param root 		（XML 父节点对象）
		 * @param eleName 	（XML对象中节点名称）
		 * @param objId 	（文本构件ID名称）
		 */
		createElementById : function(doc, root, eleName, objId){
			//创建节点对象
			var element = doc.createElement(eleName);
			//创建节点值对象
			var elementTextNode = doc.createTextNode($.trim($("#"+objId).val()));
			//将值对象存放于节点对象中
			element.appendChild(elementTextNode);
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		},
		
		/**
		 * 创建根节点对象(根据给定的值)
		 *
		 * @param doc 		（XML Document对象）
		 * @param root 		（XML 父节点对象）
		 * @param eleName 	（XML对象中节点名称）
		 * @param value 	（文本内容值）
		 */
		createElementByVal : function(doc, root, eleName, value){
			//创建节点对象
			var element = doc.createElement(eleName);
			//创建节点值对象
			var elementTextNode = doc.createTextNode(value);
			//将值对象存放于节点对象中
			element.appendChild(elementTextNode);
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		},
		
		/**
		 * 创建节点对象(包含给定的属性名称及属性对象)
		 *
		 * @param doc 		（XML Document对象）
		 * @param root 		（XML 父节点对象）
		 * @param eleName 	（XML对象中节点名称）
		 * @param attrName 	（XML对象中节点属性名称）
		 * @param attrVal 	（XML对象中节点属性值）
		 * @param eleVal 	（XML对象中节点值）
		 */
		createElementAsAttr : function(doc, root, eleName, attrName, attrVal, eleVal){
			//创建节点对象
			var element = doc.createElement(eleName);
			//增加属性ID
			element.setAttribute(attrName, attrVal);
			//创建节点值对象
			var elementTextNode = doc.createTextNode(eleVal);
			//将值对象存放于节点对象中
			element.appendChild(elementTextNode);
			
			//将节点对象存放于根节点对象中
			root.appendChild(element);
		}
	}
}();

window.$CF = CommonFunction;
