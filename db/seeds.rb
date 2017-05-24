# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "HI IM SEED"

Product.delete_all

Product.create(products_data = [
  {:title => "Warm Reflection",:size=>"4” x 3” x 7”",:materials=>"Copper\nJerusalem Stone", :description => "Copper, the oldest metal known to man, was used in the building of the Tabernacle during the Exodus in the desert.\n\nIts polished surface sets off this Light of Remembrance and creates a golden glow of Warm Reflection that speaks of our collective longing for the Promised Land…and our abiding love for those who have gone before us.\n\nThe remembrance lamp is mounted on a base of Jerusalem stone with each copper background unique to itself.\n  By personalizing Warm Reflection with the addition of the Jerusalem stone, you will find the graduated tones in polished copper evocative of a desert sunset.\n\nEach lamp comes with a starter bottle of lamp oil, extra wicks and two polished stones.\n\nPersonalization available", :price => 118, :image =>"http://i.imgur.com/uLYAL0a.jpg", :group => "yahrzeit"},
  {:title => "Stone Menorah", :size=>"24” x 12” x 3”", :materials => "Jerusalem Stone Base\nGlass Bottles\nAcrylic Support",:description => "Why the Broken Stone?\n\n For centuries... they have tried to break us...\nto tear down our walls...to tear us asunder\nBut as long as we recite the Baracha...\n... As long as we light the Chanukah lights...\n\n “AM YISROEL CHAI”",
    :price => 165, :image =>"http://i.imgur.com/xpHmf5y.jpg", :group => "holidays"},
  {:title => "Mezuzah", :size=>"1.5” x 5”", :materials=>"Black Onyx Stone\nJerusalem Stone\nCopper & Brass\nIncludes paper scroll", :description => "Removable waterproof cap.Can be placed in an outside environment\nThe Shomer Series is designed to incorporate the beautiful symbols of our tradition.\nThe Jerusalem Stone is an enduring symbol of our strength & heritage. \nCopper & Brass were used in the building of the Tabernacle.\nStones & Jewels were part of the High Priests’ vestments and Ephod (Breastplate", :price => 118, :image =>"http://i.imgur.com/gVipV9m.jpg", :group => "judaica"},
  {:title => "Challah Board", :size => '12” x17” x2”', :materials => 'Cherry, Walnut, Maple and Jerusalem Stone',:description => "Sheva Minim (Seven Species) Bush \n Wheat, Barley, Grapes, Figs, Pomegranate, Olives, and Dates.  \n Collectively they are known as the Sheva Minim,The seven species of sacred fruits & grains grown in the Land of Israel.\n\n The two birds represent the two angels accompanying persons returning from synagogue on Friday night. \n That’s Why we sing “Shalom Aleichem”\n\nCustomization available",:price => 320, :image =>"http://i.imgur.com/4EC59Br.jpg", :group => "holidays"},
  {:title => "Chanu-Kotel", :size => "Case 8”x20”x3” \n Support 4”x18”x4”", :materials =>"The wall pieces are genuine Jerusalem Stone. \n Case: Choice of Mahagony or Walnut", :description => "A unique and marvelous menorah that expresses the joy and wonder of the beautiful holiday of Hanukah.\n\nAdd a section every night...\n...by the eighth night you have built \nthe Western Wall...The Kotel! ",
  :price => 1150, :image =>"http://i.imgur.com/GwOpBgW.jpg", :group => "holidays"},
  {:title => "Menorah-Copper Glow", :size=>"3” x 11” x 10”", :materials=> "Flamed Copper\nJerusalem Stone\nGlass Bottles",:description => "Copper, the oldest metal known to man, was used in the building of the Tabernacle during the Exodus in the desert.\n\nIts polished surface sets off this menorah and creates a golden glow evocative of a desert sunset.\n\nThe menorah lamps are mounted on a base of Jerusalem stone, an enduring symbol of strength & heritage.\n\nThe broken walls are mute testimony to the story of Chanukah.", :price => 320, :image =>"http://i.imgur.com/yL1HfJA.jpg", :group => "holidays"},
  {:title => "Serenity", :size=>"4 x 4x 7”", :materials=>"Clear Optical Crystal",:description => "Solid yet reassuring, the perfect harmony of a sphere and a cube echoes how the lasting memory of a loved one continuesto bless our lives with Serenity…undimmed by time.\nEngraving available. (’Yizkor’ is included)",
   :price => 320, :image =>"http://i.imgur.com/jf6871k.jpg", :group => "yahrzeit"},
  {:title => "Strong Memories", :size=>"3”x 4“x 5”", :materials=>"Jerusalem Stone\nGlass Bottle\nGlass Wick Holder",:description => "Shattered stones reflect the precarious balance of life.\nYet it is the strength of the Jerusalem stone thats helps us to remember and be comforted.\n\nPersonalization available\nLamp burns over 24 hours",
    :price => 136, :image =>"http://i.imgur.com/THI5Qm9.jpg", :group => "yahrzeit"},
  {:title => "Shofar Holder",:size=>"5” x 8” x 6”",:materials=>"Wood Base\nMetalisized Manzanita Bush", :description => "Abraham then looked up and saw a ram caught by its horns in a thicket.\n He went and got the ram, sacrificing it as an all-burned offering in his son's place.\n\nShofar not included",
    :price => 150, :image =>"http://i.imgur.com/1X8fQKM.jpg", :group => "holidays"},
    {:title => "Children's Mezuzot",:size=>"Custom",:materials=>"Custom", :description => "Custom designed Mezuzot for a child’s room in whichever theme, style, or design they desire.", :price => 1, :image =>"http://i.imgur.com/kgT3yQX.jpg", :group => "judaica"}
  ])
