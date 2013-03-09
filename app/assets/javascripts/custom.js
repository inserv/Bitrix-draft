function KeepCount(j,k,obj){
	j=j+1;
    k=k+1;
    var count=0;
	for (i=1; i<j; i++){
	if (document.getElementById(obj+i).checked){count=count+1}
    if (count==k){return false;}
    } 
}