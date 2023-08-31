# sakasa-chicken Version-1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[Resource Preview] https://youtube.com/watch?v=XtaP88IJwEg&t=2s

<strong>[EN]</strong>
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Setup;

1;
ensure sakasa-chicken
ensure qb-target
ensure-nh-keyboard
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
We have finished step 1 of the process by assigning the start file to server.cfg or script.cfg,



2;
Add the following to qb-core\shared\items.lua;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     --Chicken
	['tavuk'] 			     = {['name'] = 'tavuk', 			  	        ['label'] = 'Live Chicken', 			    ['weight'] = 2, 		['type'] = 'item', 		['image'] = 'tavuk.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'I need to cut this....'},
	['kesilmistavuk'] 			     = {['name'] = 'kesilmistavuk', 			  	        ['label'] = 'Diced Chicken', 			    ['weight'] = 3, 		['type'] = 'item', 		['image'] = 'kesilmistavuk.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'I need to wrap this up....'},
	['paketlitavuk'] 			 = {['name'] = 'paketlitavuk', 			  	['label'] = 'Packaged Chicken', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'paketlitavuk.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'I need to sell this....'},


3;
Attach the photos we provide in the file sakasa-chicken\images.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Add it to qb-inventory\html\images,

Add it to lj-inventory\html\images.



That's all for installation.


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


<strong>[TR]</strong>
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Kurulum;

1;
ensure sakasa-chicken
ensure qb-target
ensure-nh-keyboard
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
server.cfg veya script.cfg'ye dosyayı başlatlarını atayarak işlemin 1. adımını bitirmiş bulunmaktayız,

2;
qb-core\shared\items.lua'ya aşağıdakileri ekleyiniz;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --Chicken
	['tavuk'] 			     = {['name'] = 'tavuk', 			  	        ['label'] = 'Canlı Tavuk', 			    ['weight'] = 2, 		['type'] = 'item', 		['image'] = 'tavuk.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'bunu kesmem gerek....'},
	['kesilmistavuk'] 			     = {['name'] = 'kesilmistavuk', 			  	        ['label'] = 'Doğranmış Tavuk', 			    ['weight'] = 3, 		['type'] = 'item', 		['image'] = 'kesilmistavuk.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'bunu paketlemem gerek....'},
	['paketlitavuk'] 			 = {['name'] = 'paketlitavuk', 			  	['label'] = 'Paketlenmiş Tavuk', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'paketlitavuk.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'bunu satmam gerek....'},

3;
sakasa-chicken\images dosyasında verdiğimiz fotoları ekleyiniz.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
qb-inventory\html\images adresine ekleyiniz,
 
lj-inventory\html\images adresine ekleyiniz.



<strong>Kurulum bu kadar kolay gelsin.</strong>


![sakasatr com](https://github.com/papdevelopment/qb-portak/assets/127118520/67696232-ef5a-4205-8d35-cb37fb4b6aa8)




