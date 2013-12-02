/**
 * 功能：专用的列表框构件操作包
 * 		
 * 作者：Simon Lv
 * 日期：2010年9月27日 * 版本：1.0.0
 */
/**
 * 
 * 功能:列表框类
 * 
 * @return {}
 */
var Tbl = function() {
	/**
	 * 功能:列表框中的常量类
	 */
	var con = {
		nosc : 'nosc',// 不需要排序		asc : 'asc',// 升序
		desc : 'desc',// 降序
		tblstetitle : 'tblstetitle', // title行的样式类名
		tblstematch : 'tblstematch', // match行的样式类名
		head : 'head', // 头		body : 'body',// 体		first : 'first',// 首页
		last : 'last',// 最后		priv : 'priv',// 上一页		next : 'next',// 下一页		tblAjaxAction : './InfoTblAjaxAction', // 调用的action路径
		field : 'field',// 模糊匹配
		sort : 'sort',// 排序
		currentPage : 'currentPage',// 当前页		id : 'id'// id
	};

	// 类的全局变量用来锁定输入框	var inputLock = false;

	// 用来支持页面上存在多个列表框的情况	var infomap = new $T.Map();

    var selectNum=0;
    
	/**
	 * 功能:列表框控制信息类
	 */
	function Limit() {
		// 列表框的排序信息
		this.sortArray = [];
		/* 列表框的检索条件 */
		this.fieldArray = [];
		/* 列表框的当前页 */
		this.currentPag = 1;

		this.getSortArray = function() {
			return this.sortArray;
		};
		this.setSortArray = function(sortArray) {
			this.sortArray = sortArray;
		};
		this.getFieldArray = function() {
			return this.fieldArray;
		};
		this.setFieldArray = function(fieldArray) {
			this.fieldArray = fieldArray;
		};
		this.getCurrentPag = function() {
			return this.currentPag;
		};
		this.setCurrentPag = function(currentPag) {
			this.currentPag = currentPag;
		};
	}
	
	/**
	 * 功能:检查该列表框是否需要chk
	 * 
	 * @param obj 列表框容器中的title
	 * @return true 或 false
	 */
	function isChk(obj) {
		// 注意转换为小写		return obj.firstChild.firstChild.nodeName.toLocaleLowerCase() == 'input'
				? true
				: false;
	}

	/**
	 * 功能: 给Array对象自定义了一个删除方法	 */
	function delArr(arr, n) {
		/* 如果n<0，则不进行任何操作。 */
		if (n < 0)
			return arr;
		else
			return arr.slice(0, n).concat(arr.slice(n + 1, arr.length));
	}

	/**
	 * 功能:查找列表框中的match行	 * 
	 * @param id 列表框标识中body部分的标识
	 */
	function findMatch(id) {
		// 先假设列表框中只有一个table,如果有问题在改动
		// find得到的就是dom节点数组
		var nodes = $('#' + id).find('tr');
		// 第一行为match行		if (nodes[0].className == con.tblstematch) {
			return nodes[0];
		}
		return null;
	}
	
	/**
	 * 功能:改变当前match列中的类容	 * 
	 * @param id 列表框标识中body部分的标识
	 */
	function changeMatch(id) {
		// match行节点		var match = findMatch(id);
		if (match == null)
			return;
		// match行下的div用他们来存放match信息串的
		var cells = $(match).find('div');

		// 列表框的id
		var tblId = id.substring(0, (id.length - con.body.length));
		// 获取match数组
		var matchArr = infomap.get(tblId).getFieldArray();

		var temp = [];
		// 重写match列中的内容		for (var i = 0, len = cells.length; i < len; i++) {
			temp = find(i);
			if (temp !== null) {
				cells[i].innerHTML = temp;
			} else {
				cells[i].innerHTML = '';
			}
		}
		
		// 搜索当前列在检索数组中是否存在数据
		function find(num) {
			var temp = [];
			for (var i = 0, len = matchArr.length; i < len; i++) {
				temp = matchArr[i].split(':');
				if (num == temp[0]) {
					return temp[1];
				}
			}
			return null;
		}

	}
	
	/**
	 * 功能:得到传递到后台的参数串 这样避免了乱码问题,url会乱码
	 * 
	 * @param tableId 列表框的标识
	 */
	function getPar(id) {
		// 列表框控制信息		var limit = infomap.get(id);
		var fieldArray = limit.getFieldArray();
		// 颠倒数组		var sortArray = limit.getSortArray().reverse();

		// 当前页		var currentPage = limit.getCurrentPag();
		var parameter = "id=" + id;
		if (fieldArray !== null && fieldArray.length !== 0) {
			parameter += "&" + con.field + "=" + fieldArray;
		}
		if (sortArray !== null && sortArray.length !== 0) {
			parameter += "&" + con.sort + "=" + sortArray;
		}
		if (currentPage !== null) {
			parameter += "&" + con.currentPage + "=" + currentPage;
		}
		return parameter;
	}
	
	/**
	 * 功能:列表框内部ajax操作成功后调用的函数
	 * 
	 * @param id 列表框标识
	 */
	function ajaxSucc(id) {
		var parameter = getPar(id);
		$.ajax({
			url : con.tblAjaxAction,
			async : true,
			type : "POST",
			dataType : "xml",
			data : parameter,
			success : function(msg) {
				// msg jquery中返回的直接是XML操作类				var head = '';
				if ($(msg).find(con.head) !== null) {
					head = $H._4096($(msg).find(con.head)[0]);
				}
				// 更新头部信息
				if ($('#' + id + con.head) !== null) {
					$('#' + id + con.head).html(head);
				}

				var body = $H._4096($(msg).find(con.body)[0]);
				// 更新主体信息
				$('#' + id + con.body).html(body);
				changeMatch(id + con.body);
			}
		});
	}
	return {
		/**
		 * 功能:初始列表框		 * 
		 * @param id 列表框的id
		 * @param text 列表框要显示的内容
		 */
		initTbl : function(id, text) {
			// 变为jquery需要的格式
			var tid = '#' + id;
			// 主体部分节点标记
			var body = tid + con.body;
			// 头部信息节点标记
			var head = tid + con.head;

			// 列表框容器的高度与框度			var width = $(tid).width();
			var height = $(tid).height();
              
			// 列表框的内容
			$(tid).html(text);
			$(body).css('width', width);
            
			if ($(head) !== null) {
				$(head).css('width', width);
				// 如果是 IE,因为在IE中$(head).height()得到的高度不包括边框的宽
				if ($.browser.msie) {
					// 减1,限定头部的下边框为1,如果需要可以重新设计					height = height - $(head).height() - 1;
				} else if ($.browser.mozilla) {
					height = height - $(head).height();
				}
			}

			// 列表框主体的高			$(body).css('height', height);

			// 初始化该列表框的信息描述map
			//去掉该if 可获得正确的当前页值   即能够在刷新后正常翻页(cheng)
			//if (infomap.get(id) === null) {     
				// 新建一个列表框控制信息
				var limit = new Limit();
				infomap.put(id, limit);
				// 初始进来为第一页如果有分页将派上用场				infomap.get(id).setCurrentPag(1);
			//}

		},
		/**
		 * 
		 * 功能:选取页面的所有行
		 * 
		 * @param obj
		 *            列表框的obj
		 */
		selectAll : function(obj) {
			var parentNode = $(obj).parent().parent().parent();
			var nodes = $(parentNode).find(":checkbox");
			
			// 判断当前的全选框是选中还是没选中.
			var is = nodes[0].checked ? true : false;
			// jquery方法精简了不少			$.each(nodes, function(i, n) {// i表示下标 n表示元素本身
				n.checked = is;
               
				if(i>0){
					Tbl.selectRow(n);
				}
			});
		},
		
		/**
		 * 功能:选取行		 * 
		 * @param obj 事件源
		 */
		selectRow : function(obj) {
			var trObj = $(obj).parent().parent();
			var pkVal = $(obj).val();
			//该行被选中
			if (obj.checked) {
				
				//点亮保存和删除按钮				$("#store").attr("disabled","");
				$("#delete").attr("disabled","");
				
	        	addEle(pkVal,obj);
	        	
	        	//整行着重显示
				trObj.find('div').each(function(i){
					$(this).addClass('sltdBg');
				});
			} else {
			 	substractEle(pkVal);
			 	//取消整行显示
				trObj.find('div').each(function(i){
					$(this).removeClass('sltdBg');
				});
			}
		},
		
		/**
		 * 功能:点击match框时
		 * 
		 * @param obj 事件源
		 */
		clickMatch : function(obj) {
			// 当输入框不处于锁定状态时
			if (!inputLock) {
				inputLock = true;

				// 对象注入到jquery对象中去
				var ob = $(obj);
				var inp = document.createElement('input');
				var ip = $(inp);
				ip.attr({
					type : 'text',
					value : ob.html()
				});
				ip.width(ob.width() - 2);
				ip.height(ob.height() - 2);
				// jquery html方法可以直接注入对象
				ob.html(inp);
				// 获得焦点
				ip.focus();
				// 失去焦点事件
				ip.blur(function() {
					ob.html(ip.val());
					inputLock = false;
				});
			}
		},
		
		/**
		 * 功能:根据限制条件收索字段.
		 * 
		 * @param bodyId 列表框中body标识id
		 */
		match : function(bodyId) {
			// 获取列表框的id
			var id = bodyId.substring(0, (bodyId.length - con.body.length));
			// match行节点
			var matchRow = findMatch(bodyId);

			// 该行下的所有的div在match行中用div来存放信息			var divs = matchRow.getElementsByTagName('div');

			// 模糊匹配信息集合
			var fieldArray = [];

			// 表达式规制			var myd = new RegExp("&gt;");
			var myx = new RegExp("&lt;");
			for (var i = 0, j = divs.length; i < j; i++) {
				// 匹配框中的内容				var s = divs[i].innerHTML;
				// 如果匹配框中有内容				if ($.trim(s) != '') {
					if (myd.test(s)) {
						s = s.replace(myd, "\>");
					}
					if (myx.test(s)) {
						s = s.replace(myx, "\<");
					}
					fieldArray.push(i + ":" + s);
				}
			}

			if (fieldArray == null || fieldArray.length == 0) {
				window.alert("您没有选择检索条件");
			} else {
				infomap.get(id).setFieldArray(fieldArray);
				// match或 sort后都返回到第一页				infomap.get(id).setCurrentPag(1);
				ajaxSucc(id);
			}
		},
		
		/**
		 * 功能:对列表框进行排序
		 * 
		 * @param obj 点击的排序列
		 */
		sort : function(obj) {
			// 标题行			var titleR = obj.parentNode;
			// 该列表框是否有chk
			var ischk = isChk(titleR);
			// 当前点击的列号
			var index = obj.cellIndex;
			// 有多少列(出chk)
			var len = titleR.cells.length;
			if (ischk === true) {
				index = index - 1;
				len = len - 1;
			}

			// 注意tobody哦 body 的id
			var bodyId = titleR.parentNode.parentNode.parentNode
					.getAttribute('id');
			// 获取列表框的id
			var id = bodyId.substring(0, (bodyId.length - con.body.length));

			// 引用而不是赋值(js新手注意)
			var sortArray = $H.copyArr(infomap.get(id).getSortArray());

			// 向数组中加入正确的排序方式
			// 临时变量记录了数组的下标
			var m = 0;
			var scValue = null;

			// 遍历排序数组
			for (var i = 0, j = sortArray.length; i < j; i++) {
				// 从元素中分解出顺序与排序性质
				var value = sortArray[i].split(":");

				// 如果排序数组中已经存在当前点击的排序项则把它移除
				if (value[0] == index) {
					sortArray = delArr(sortArray, i);
					scValue = value;
					break;
				}
			}
			
			// 如果点击的排序项传过来了值			if (scValue !== null) {
				// 如果点击项当前处于升序状态				if (scValue[1] == con.asc) {
					sortArray.push(index + ":" + con.desc);
				}
			}
			// 如果点击项处于无排序状态			else {
				// 第一次点击默认都是升序				sortArray.push(index + ":" + con.asc);
			}

			infomap.get(id).setSortArray(sortArray);
			// match或 sort后都返回到第一页			infomap.get(id).setCurrentPag(1);
			ajaxSucc(id);
		},

		/**
		 * 功能:选择页数,点击分页导向图片
		 * 
		 * @param id 列表框标识
		 * @param type 导向类型,例:向前
		 */
		setPage : function(id, type) {
			// 设置一个临时变量如果操作失败,用它来恢复上一个状态			var argu = arguments;
			var temperr = infomap.get(id);
			if (type == con.first) {
				infomap.get(id).setCurrentPag(1);
			} else if (type == con.last) {
				// 标识最后一页				infomap.get(id).setCurrentPag(argu[2]);
			} else if (type == con.priv) {
				var page = parseInt(infomap.get(id).getCurrentPag()) - 1;
				infomap.get(id).setCurrentPag(page);
			}
			// 下一页			else if (type == con.next) {
				var page = parseInt(infomap.get(id).getCurrentPag()) + 1;
				infomap.get(id).setCurrentPag(page);
			}
			ajaxSucc(id);
			
			//
			revertText();
			initWholeVar();
		},
		
		/**
		 * 功能:单击select框选择页数
		 * 
		 * @param obj 点击源
		 * @param id 列表框标识
		 */
		selPage : function(obj, id) {
			// 当前下拉框中选中的值			var cur = parseInt(obj.value);
			infomap.get(id).setCurrentPag(cur);
			ajaxSucc(id);
		},

		/**
		 * 功能:还原列表框交互信息到初始状态		 * 
		 * @param id 列表框标识
		 */
		clear : function(id) {
			// 重新设置为初始状态			infomap.get(id).setCurrentPag(1);
			infomap.get(id).setSortArray([]);
			infomap.get(id).setFieldArray([]);
			ajaxSucc(id);
		},
		
		/**
		 * 功能：滑过图片的事件
		 * 
		 * @param imgObj 图片对象
		 */
		onMouseOver : function(imgObj){
			$(imgObj).parent().addClass('divBorder');
		},
		
		/**
		 * 功能：滑出图片的事件
		 * 
		 * @param imgObj 图片对象 
		 */
		onMouseOut : function(imgObj){
			$(imgObj).parent().removeClass('divBorder');
		},
		
		opimgMovr : function(opimgObj){
			var src = $(opimgObj).attr("src");
			var newSrc = src.substring(0,src.lastIndexOf("_"))+".png";
			$(opimgObj).attr("src", newSrc);
		},
		
		opimgMout : function(opimgObj){
			var src = $(opimgObj).attr("src");
			var newSrc = src.substring(0,src.lastIndexOf("."))+"_g.png";
			$(opimgObj).attr("src", newSrc);
		}
	}
}();