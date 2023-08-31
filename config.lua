
Config = {}

--[İTEMS]
Config.ToplaChickenItem = "tavuk"
Config.IsleChickenItem = "kesilmistavuk"
Config.PaketChickenItem = "paketlitavuk"

--[TAVUK-YAKALAMA-YERLERİ](2 farklı yerde)
Config.TavukLokasyon = { 
     vector3(-66.28, 6247.69, 31.09),
     vector3(-68.8, 6263.38, 31.16)
}

--[TAVUK-YAKALAMA-RANDOM]
Config.TavukMin = 1
Config.TavukMax = 3

--[BLIPLER]
Config.Blips = { 
    {title="Tavuk Kümesi", colour=5, id=268, x = -66.28, y = 6247.69, z = 31.09}, 

}

--[KESME]  &BİLMİYORSAN ELLEME
Config.ravz = {

  ["tavuk_kesme"] = {
      isim = "Tavukları Doğra",
      konum = {x = -99.16, y = 6205.47, z = 32.02, h = 327.9}, 
      icerik  = {
          {item = "tavuk", kesme = 1, label = "Tavuk Kes"},
     }
  },
  ["tavuk_kesmeravz"] = {
    isim = "Tavukları Doğra",
    konum = {x = -95.28, y = 6207.57, z = 32.02, h = 327.9},
    icerik  = {
        {item = "tavuk", kesme = 1, label = "Tavuk Kes"},
   }
},
}

--[PAKETLEME]  &BİLMİYORSAN ELLEME
Config.ravzpaket = {

  ["tavuk_paketleme"] = {
     isim = "Tavukları Paketle",
     konum = {x = -104.95, y = 6206.99, z = 31.03, h = 133.69},
     icerik  = {
         {item = "kesilmistavuk", paket = 1, label = "Kesilmiş Tavuk Ambalajla"},
    }
  },
  ["tavuk_paketlemeravz"] = {
    isim = "Tavukları Paketle",
    konum = {x = -102.49, y = 6209.25, z = 31.03, h = 133.69},
    icerik  = {
        {item = "kesilmistavuk", paket = 1, label = "Kesilmiş Tavuk Ambalajla"},
   }
 },
}

Config.ravza = {  --TEXTLERİ KALDIRMAK İSTERSEN KAPAT [resmon değeri oldukça düşüyor]

      [1] = {
         ['label'] = 'Tavuk Kes',
         ['coords'] = vector3(-99.16, 6205.47, 31.07), 
      },
      [2] = {
        ['label'] = 'Tavuk Kes',
        ['coords'] = vector3(-95.28, 6207.57, 31.07),
     },
      [3] = {
         ['label'] = 'Tavuk Paketle',
         ['coords'] = vector3(-104.49, 6207.26, 31.03),
     },
     [4] = {
      ['label'] = 'Tavuk Paketle',
      ['coords'] = vector3(-102.49, 6209.25, 31.03),
    },
     [5] = {
      ['label'] = 'Tavuk Yakala',
      ['coords'] = vector3(-66.19, 6248.04, 31.28),
     },
     [6] = {
      ['label'] = 'Tavuk Yakala',
      ['coords'] = vector3(-68.8, 6263.38, 31.86),
     }
}


