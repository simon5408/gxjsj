/**
 * 功能：通用的基本功能类操作包
 * 		
 * 作者：Simon Lv
 * 日期：2010年9月27日
 * 版本：1.0.0
 */
var Con = {
	//构件标识
	ddlsta    			: 'ddlsta',			// 下拉框	tblste    			: 'tblste',			// 列表框	tremen    			: 'tremen',			// 树	menuee    			: 'menuee',			// 菜单
	chkbox    			: 'chkbox',			// 复选框
	txtedt    			: 'txtedt',			// 文本框	radiou    			: 'radiou',			// 单选按纽	buinfo    			: 'buinfo',			// 信息栏	ddlsgt    			: 'ddlsgt',			// 模糊下拉框	ddlfbl              : 'ddlfbl',			// 下拉列表框
	//构件属性标识	color     			: 'color',			// "color"标识
	font      			: 'font',			// "font"标识
	type      			: 'type',			// "type"标识
	logId      			: 'logId',			// "logId"标识
	pageId      		: 'pageId',			// "pageId"标识
	pageUrl      		: 'pageUrl',		// "pageUrl"标识
	logPageId      		: 'logPageId',		// "logPageId"标识
	pageOptype      	: 'pageOptype',		// "pageOptype"标识
	infoSmsg      		: 'infoSmsg',		// "infoSmsg"标识
	logStrDate      	: 'logStrDate',		// "logStrDate"标识
	logLngDate      	: 'logLngDate',		// "logLngDate"标识

	//图形标识
	upImg 				: 'ico_up', 		//向上箭头（彩色）
	downImg				: 'ico_down',		//向下箭头（彩色）

	//基本标识	
	rows      			: 'rows',			// "rows"标识
	r         	   		: 'r',				// "r"标识
	n         			: 'n',				// "n"标识
	o         			: 'o',				// "o"标识
	h         			: 'h',				// "h"标识
	b         			: 'b',				// "b"标识 :是否有返回的节点ID数值	v         			: 'v',				// "v"标识

	//属性标识	id					: 'id',				// "id"标识
	title				: 'title',			// "title"标识
	name				: 'name',			// "name"标识
	val       			: 'val',			// "val"标识
	value				: 'value',			// "value"标识	isNeed    			: 'isNeed',			// 是否必选	tex       			: 'tex',			// "tex"标识
	iniv      			: 'inival',			// "iniv"标识
	div       			: 'div',			// "div"标识
	currState 			: 'currState',		// "currState"标识
	currVal 			: 'currVal',		// "currVal"标识
	guid				: 'guid',			// "guid"标识
	biType				: 'biType',			// "biType"标识
	dataType			: 'dataType',		// "dataType"标识
	dateType			: 'dateType',		// "dateType"标识
	timeType			: 'timeType',		// "timeType"标识
	flowType			: 'flowType',		// "flowType"标识
	rtnType				: 'rtnType',		// "rtnType"标识
	content				: 'content',		// "content"标识

	//号元标识
	codeCmpont   		: 'codeCmpont',		// 号元规则
	codeCmpontId   		: 'codeCmpontId',	// 号元标识
	codeCmpontName 		: 'codeCmpontName',	// 号元名称
	codeCmpontType 		: 'codeCmpontType',	// 号元类型
	codeCmpontConj  	: 'codeCmpontConj',	// 号元联标
	codeCmpontProc		: 'codeCmpontProc',	// 号元规则
	codeCount			: 'codeCount',		// 号元数量
	codeStep			: 'codeStep',		// 号元步进
	useCount			: 'useCount',		// 号元被引用次数
	codePad				: 'codePad'	,		// 号元填充
	codeCmpontExt		: 'codeCmpontExt',	// 号元自定义规则
	//组号标识
	codes				: 'codes',			// 组号规则
	codeName			: 'codeName',		// 组号名称
	codeProdId			: 'codeProdId',		// 号数标识
	codeMesgId			: 'codeMesgId',		// 信息标识
	codeMemo			: 'codeMemo',		// 信息备注

	//组号属性标识	cmpontPosition		: 'cmpontPosition', // 所处位置	cmpontGroup			: 'cmpontGroup',	// 所在组
	cmpontCurrentVal	: 'cmpontCurrentVal',//当前值	compontConditionType: 'compontConditionType',//是否变化
	
	//定制功能设置
	pgmInfo				: 'PGM_INFO',		//程序实例
	cndtnCstName		: 'CNDTN_CST_NAME',	//条件域定制信息
	
	sept				: '|',				// 分隔符'|'
	colon				: ':',				// 分隔符':'
	comma				: ',',				// 分隔符','
	hanzi 				: "曌",				// 分隔符'曌'
	mbar				: '-'				// 分隔符'-'
};

//-----======= public function ======-----
/**
 * 根据字符串返回Boolean类型
 * 
 * @param str (字符串)
 * @return
 */
function str2Bolen(str){
	switch(str.toLowerCase()){
	case "true":
	case "yes":
	case "1":
		return true;
	case "false":
	case "no":
	case "0":
		return false;
	}
}

/**
 * 将含有小数点的浮点型字符串转换为Int数字型
 * 
 * @param floatStr (含有小数点的浮点型字符串)
 * @return
 */
function float2Int(floatStr){
	//是否含有小数点
	if(floatStr.indexOf(".")>-1){
		return parseInt(floatStr.substring(0, floatStr.indexOf(".")));
	}

	return parseInt(floatStr);
}

/*
 * 数字类型判断
 */
function checkNumVal(val){
	var reg = new RegExp("^[0-9]+?$","g");
	if(!reg.test(val)){
		return true;;
	}
	return false;
}

/*
 * 字母类型判断
 */
function checkLeteVal(val){
	var reg = new RegExp("^[A-Za-z]?$","g");
	if(!reg.test(val)){
		return true;;
	}
	return false;
}

/**
 * 加载时间选择项
 * 
 * @param timeObj (加载项对象)
 * @param beginNum (开始数字)
 * @param endNUm (结束数字)
 * @param isZero (是否添加零)
 */
function initTimeOption(timeObj, beginNum, endNUm, isZero){
	for(var i=beginNum; i<endNUm; i++){
		//存放于Select对象中
		if(i<10){
			if(isZero){
				timeObj[0].options.add(new Option("0"+i+":00",i));
			}else{
				timeObj[0].options.add(new Option("0"+i,i));
			}
		}else{
			if(isZero){
				timeObj[0].options.add(new Option(i+":00",i));
			}else{
				timeObj[0].options.add(new Option(i,i));
			}
		}
	}
}

/**
 * 根据分割标识分解字符串
 * 
 * @param str (字符串)
 * @param splitType (分割标识)
 */
function splitStrByType(str, splitType){
	if(str != null && str != ""){
		return str.split(splitType);
	}
	
	return null;
}

/**
 * 获得URL中的参数值 */
function getUrlParam(paramName){
 	//定义正则表达式 	var oRegex = new RegExp('[\?&]'+paramName+'=([^&]+)','i');
 	//获得当前窗口的URL值 	var oMatch = oRegex.exec(window.top.location.search);
 	
 	//判断并返回值 	if(oMatch && oMatch.length>1){
 		return oMatch[1];
 	}else{
 		return '';
 	}
 }
 
/**
 * 数组中删除信息列
 */
 Array.prototype.remove = function(dx){

	if(isNaN(dx)||dx>this.length){
		return false;
	}
     
	for(var i=0,n=0; i<this.length; i++){
		if(this[i] != this[dx]){
			this[n++] = this[i];
		}
	}
     
	this.length -=1;
}

String.prototype.replaceAll = function(s1, s2){
	return this.replace(new RegExp(s1, "gm"), s2);
}

//返回主菜单
function back2Mng(url){
	window.location.href = url;
}

/**
 * JS仿HashMap
 */
var HashMap = {
	//在Map数组中插入键值	Set : function(key,value){
		this[key] = value;
	},
	
	//根据键从Map中获得值	Get : function(key){
		return this[key];
	},
	
	//根据键判断Map中是否存在	Contains : function(key){
		return this.Get(key) == null?false:true;
	},
	
	//根据键从Map中删除	Remove : function(key){
		delete this[key];
	}
}

/**
 * 将颜色RGB十进制转为十六进制(还存在问题)
 */
function rgb2hex(rgb){
	if(rgb.charAt(0) == "#"){
		return rgb;
	}
	
	var n = Number(rgb);
//	alert(n);
	var ds = rgb.split("/\D+/");
	var decimal = Number(ds[1])*65536+Number(ds[2])*256+Number(ds[3]);
	return "#"+zeroFillHex(decimal, 6);
}

function zeroFillHex(num, digits){
	var s = num.toString(16);
	while(s.length < digits){
		s = "0" + s;
	}
	return s;
}
//-----======= public function ======-----