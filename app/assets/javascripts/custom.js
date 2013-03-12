function KeepCount(j,k,obj){
	j=j+1;
    k=k+1;
    var count=0;
	for (i=1; i<j; i++){
	if (document.getElementById(obj+i).checked){count=count+1}
    if (count==k){return false;}
    } 
}

function HideMenuKey(){
	var item1 = document.getElementById("call_menu_menu_key1");
	var item2 = document.getElementById("call_menu_menu_key2");
	var item3 = document.getElementById("call_menu_menu_key3");
	if(item1.value==0){ 
		item2.value=0;
		item2.disabled = true;
		item3.value=0;
		item3.disabled = true;
	 }
	if(item1.value!=0){ 
		item2.disabled = false;
		item3.value=0;
		item3.disabled = true;
	 }
	if(item2.value!=0){ 
		item3.disabled = false;
	 }
} 
