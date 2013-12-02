/**
 * 功能：页面内存数据管理操作包
 * 		
 * 作者：Simon Lv
 * 日期：2010年9月27日
 * 版本：1.0.0
 */
 
//复选框打钩后选择对象信息号
var elem=[];
//计数器
var counter=0;

function addEle(pkVal,obj){
	//存放进数组中
	elem.push(pkVal);
  	
  	//存放进Map中
  	HashMap.Set(pkVal,obj);
  	
  	//将计数器加一
  	counter++;
  	
  	//具体的执行方法
  	addFuction(elem, counter, obj, pkVal);
}

function substractEle(pkVal){
	//将选择的对象从数组中删除，同时将计数器减一
  	for(var i=0;i<elem.length;i++){
    	if(elem[i]==pkVal){
    		//移除数组中的当前对象
      		elem.remove(i);
      		//移除HashMap中的当前对象键值对
      		HashMap.Remove(pkVal);
      		//将计数器减一
      		counter--;
    	}
    }
    
    //具体的执行方法
    substractFunction(elem, counter);
}