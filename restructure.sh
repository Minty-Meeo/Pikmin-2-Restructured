## Delete unused files ##
#        Junk in the root
rm -f    "$1/timeStampJP.txt"
rm -f    "$1/timeStampJR.txt"
rm -f    "$1/timeStampJV.txt"
rm -f    "$1/timeStampPD.txt"
rm -f    "$1/timeStampPV.txt"
rm -f    "$1/timeStampUP.txt"
rm -f    "$1/timeStampUR.txt"
rm -f    "$1/timeStampUV.txt"
rm -f    "$1/gameConfig.ini"
rm -f    "$1/スナップショットgameConfig.ini"
rm -f    "$1/プロダクトgameConfig.ini"
rm -f    "$1/マリクラ-Develop-gameConfig.ini"
rm -f    "$1/マリクラ-Release-gameConfig.ini"
#        Old version of "user/Totaka/BgmList.txt"
rm -f    "$1/AudioRes/BgmList.txt"
#        Old version of "user/Ebisawa/effect/game.jpc"
rm -f    "$1/user/Kando/effect/game.jpc"
#        Old version of "user/Matoba/resulttex/arc.szs"
rm -f    "$1/user/Kando/resulttex/arc.szs"
#        Unarchived zukan stage manager file
rm -f    "$1/user/Kando/zukan/course.txt"
#        Old version being an unused copy
rm -f    "$1/user/Abe/Pellet/us/pelletlist_jpn.szs"
#        Old version of forest zukan files
rm -f    "$1/user/Abe/map/zukan/light.ini"
rm -f    "$1/user/Abe/map/zukan/route.txt"
#        Unarchived files
rm -f    "$1/user/Abe/Pellet/us/carcass_config.txt"
rm -f    "$1/user/Abe/Pellet/us/item_config.txt"
rm -f    "$1/user/Abe/Pellet/us/otakara_config.txt"
rm -f    "$1/user/Abe/Pellet/pal/carcass_config.txt"
rm -f    "$1/user/Abe/Pellet/pal/item_config.txt"
rm -f    "$1/user/Abe/Pellet/pal/otakara_config.txt"
rm -f    "$1/user/Abe/Pellet/jpn/carcass_config.txt"
rm -f    "$1/user/Abe/Pellet/jpn/item_config.txt"
rm -f    "$1/user/Abe/Pellet/jpn/otakara_config.txt"

## cardE ##
mv -f    "$1/user/Ebisawa/card_e_reader"                        "$1/cardE"

## movie ##
mv -f    "$1/user/Mukki/movie"                                  "$1/movie"

## testdata ##
mv -f    "$1/user/Ebisawa/testdata"                             "$1/testdata"

## develop ##
mv -f    "$1/user/Kando/develop"                                "$1/develop"

## testResource ##
#         This folder is referenced in the DOL, but does not exist.
#mkdir -p "$1/testResource"

## AudioRes ##
mv -f    "$1/user/Totaka/BgmList.txt"                           "$1/AudioRes/BgmList.txt"
mv -f    "$1/user/Totaka/StreamList.txt"                        "$1/AudioRes/StreamList.txt"
mv -f    "$1/user/Totaka/trackMap_Cond_T.txt"                   "$1/AudioRes/trackMap_Cond_T.txt"
mv -f    "$1/user/Totaka/trackMap_Seq_T.txt"                    "$1/AudioRes/trackMap_Seq_T.txt"
mv -f    "$1/user/Wakai/trackMap_Cond_W.txt"                    "$1/AudioRes/trackMap_Cond_W.txt"
mv -f    "$1/user/Wakai/trackMap_Seq_W.txt"                     "$1/AudioRes/trackMap_Seq_W.txt"

## effects ##
mkdir -p "$1/effects"
mkdir -p "$1/effects/jpc"
mkdir -p "$1/effects/3d"
mv -f    "$1/user/Kando/effect/modeleffect.szs"                 "$1/effects/3d/modeleffect.szs"
mv -f    "$1/user/Kando/texCaster/arc.szs"                      "$1/effects/texCaster.szs"
mv -f    "$1/user/Kando/mizu.bti"                               "$1/effects/mizu.bti"
mv -f    "$1/user/Ebisawa/effect/eff2d_file_select.jpc"         "$1/effects/jpc/eff2d_file_select.jpc"
mv -f    "$1/user/Ebisawa/effect/eff2d_game2d.jpc"              "$1/effects/jpc/eff2d_game2d.jpc"
mv -f    "$1/user/Ebisawa/effect/eff2d_world_map.jpc"           "$1/effects/jpc/eff2d_world_map.jpc"
mv -f    "$1/user/Ebisawa/effect/game.jpc"                      "$1/effects/jpc/game.jpc"

## new_screen ##
mv -f    "$1/user/Kando/vstex/arc.szs"                          "$1/new_screen/vsTex.szs"
mv -f    "$1/user/Yamashita/arc/gameTex.szs"                    "$1/new_screen/gameTex.szs"
mv -f    "$1/user/Koono/mail_icon.szs"                          "$1/new_screen/mail_icon.szs"
mv -f    "$1/user/Koono/mail_table.szs"                         "$1/new_screen/mail_table.szs"

## title ##
mv -f    "$1/user/Ebisawa/title"                                "$1/title"
mv -f    "$1/user/Yamashita/arc/boot_jp.szs"                    "$1/title/boot_jp.szs"
mv -f    "$1/user/Yamashita/arc/boot_pal.szs"                   "$1/title/boot_pal.szs"
mv -f    "$1/user/Yamashita/arc/boot_us.szs"                    "$1/title/boot_us.szs"
mv -f    "$1/user/Yamashita/arc/demoMovieLogo_jp.szs"           "$1/title/demoMovieLogo_jp.szs"
mv -f    "$1/user/Yamashita/arc/demoMovieLogo_pal.szs"          "$1/title/demoMovieLogo_pal.szs"
mv -f    "$1/user/Yamashita/arc/demoMovieLogo_us.szs"           "$1/title/demoMovieLogo_us.szs"

## caves ##
mv -f    "$1/user/Mukki/mapunits"                               "$1/caves"
mv -f    "$1/user/Abe/cave"                                     "$1/caves/light"
mv -f    "$1/user/Abe/vs"                                       "$1/caves/vs"
mv -f    "$1/user/Totaka/BgmList_BgmTest.txt"                   "$1/caves/BgmList_BgmTest.txt"
mv -f    "$1/user/Totaka/BgmList_Forest.txt"                    "$1/caves/BgmList_Forest.txt"
mv -f    "$1/user/Totaka/BgmList_Last.txt"                      "$1/caves/BgmList_Last.txt"
mv -f    "$1/user/Totaka/BgmList_Tutorial.txt"                  "$1/caves/BgmList_Tutorial.txt"
mv -f    "$1/user/Totaka/BgmList_Yakushima.txt"                 "$1/caves/BgmList_Yakushima.txt"
mv -f    "$1/user/Totaka/ChallengeBgmList.txt"                  "$1/caves/ChallengeBgmList.txt"
mv -f    "$1/user/Kando/map/vrbox"                              "$1/caves/vrbox"
mv -f    "$1/user/Matoba/challenge/stages.txt"                  "$1/caves/stages_ch.txt"
mv -f    "$1/user/Matoba/challenge/kfes-stages.txt"             "$1/caves/stages_kfes.txt"
mv -f    "$1/caves/vs/stages.txt"                               "$1/caves/stages_vs.txt"

## objects ##
mv -f    "$1/user/Kando/objects"                                "$1/objects"
mv -f    "$1/objects/bridge"                                    "$1/objects/bridge_back"  # Unused backup copy
mv -f    "$1/user/Kando/bridge"                                 "$1/objects/bridge"
mv -f    "$1/user/Kando/onyon"                                  "$1/objects/onyon"
mv -f    "$1/user/Kando/piki"                                   "$1/objects/piki"
mv -f    "$1/user/Kando/pod"                                    "$1/objects/pod"
mv -f    "$1/user/Kando/pod_gold"                               "$1/objects/pod_gold"
mv -f    "$1/user/Kando/ufo"                                    "$1/objects/ufo"
mv -f    "$1/user/Kando/ufo_gold"                               "$1/objects/ufo_gold"
#         This folder is referenced in the DOL, but does not exist.
#mkdir -p "$1/objects/treasure"
mkdir -p "$1/objects/gates/gate"
mkdir -p "$1/objects/gates/e-gate"
mv -f    "$1/objects/gates/gate-arc.szs"                        "$1/objects/gates/gate/arc.szs"
mv -f    "$1/objects/gates/gate-texts.szs"                      "$1/objects/gates/gate/texts.szs"
mv -f    "$1/objects/gates/e-gate-arc.szs"                      "$1/objects/gates/e-gate/arc.szs"
mv -f    "$1/objects/gates/e-gate-texts.szs"                    "$1/objects/gates/e-gate/texts.szs"
mv -f    "$1/user/Kando/map/waterbox.szs"                       "$1/objects/waterbox.szs"
mv -f    "$1/user/Kando/map/waterbox2p.szs"                     "$1/objects/waterbox2p.szs"
mv -f    "$1/user/Abe/Pellet"                                   "$1/objects/pellet"
mkdir -p "$1/objects/pellet/us/otakara"
mkdir -p "$1/objects/pellet/us/item"
mkdir -p "$1/objects/pellet/us/unused"
mkdir -p "$1/objects/pellet/us/numberpellet"
mkdir -p "$1/objects/pellet/us/fruit"
(cd "$1/objects/pellet/us/"; if [ $? -eq  0 ]; then
  mv -t "./otakara"                                              "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
  mv -t "./item"                                                 "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
  mv -t "./unused"                                               "fue_c.szs" "light_b.szs" "map03.szs" "map04.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs"
  mv -t "./numberpellet"                                         "pellet.szs"
  mv -t "./fruit"                                                "fruits.szs"
fi)
mkdir -p "$1/objects/pellet/pal/otakara"
mkdir -p "$1/objects/pellet/pal/item"
mkdir -p "$1/objects/pellet/pal/unused"
mkdir -p "$1/objects/pellet/pal/numberpellet"
mkdir -p "$1/objects/pellet/pal/fruit"
(cd "$1/objects/pellet/pal/"; if [ $? -eq  0 ]; then
  mv -t "./otakara"                                             "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
  mv -t "./item"                                                "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
  mv -t "./unused"                                              "4parts_clover.szs" "beads.szs" "be_dama.szs" "broken_teala.szs" "button.szs" "candle.szs" "celluloid_doll.szs" "cheese.szs" "cherry.szs" "chessking.szs" "chessqueen.szs" "chocolate_ichigo.szs" "chocolate_white.szs" "contactlens.szs" "copperbell.szs" "diamond.szs" "donuts.szs" "donuts_choco.szs" "donuts_ichigo.szs" "donuts_white.szs" "flower.szs" "fue_c.szs" "fuluitin_jelly.szs" "GCdisc.szs" "GCdisc_luigi.szs" "GCdisc_mario.szs" "GCdisc_pikmin.szs" "GCdisc_zelda.szs" "gear01.szs" "ginka.szs" "goldbell.szs" "goldmedal.szs" "hallowin.szs" "indirect.szs" "kaseki.szs" "kayaku.szs" "kokesi.szs" "kouseki.szs" "kyukon.szs" "light_b.szs" "log" "map03.szs" "map04.szs" "mekki_ring.szs" "momiji.szs" "neji.szs" "neko_head.szs" "ohajiki.szs" "olgoal.szs" "orange.szs" "oukan.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs" "sensya06.szs" "shell1.szs" "silvermedal.szs" "sinju.szs" "suzu_middle.szs" "tomato.szs" "toy_jewel.szs" "toy_spring.szs" "tree_item.szs" "uja.szs" "uja1.szs" "uja2.szs" "yoyo.szs"
  mv -t "./numberpellet"                                        "pellet.szs"
  mv -t "./fruit"                                               "fruits.szs"
fi)
mkdir -p "$1/objects/pellet/jpn/otakara"
mkdir -p "$1/objects/pellet/jpn/item"
mkdir -p "$1/objects/pellet/jpn/unused"
mkdir -p "$1/objects/pellet/jpn/numberpellet"
mkdir -p "$1/objects/pellet/jpn/fruit"
(cd "$1/objects/pellet/jpn/"; if [ $? -eq  0 ]; then
  mv -t "./otakara"                                             "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
  mv -t "./item"                                                "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
  mv -t "./unused"                                              "fue_c.szs" "light_b.szs" "map03.szs" "map04.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs"
  mv -t "./numberpellet"                                        "pellet.szs"
  mv -t "./fruit"                                               "fruits.szs"
fi)

## parms ##
mkdir -p "$1/parms"
mv -f    "$1/user/Abe/piki/naviParms.txt"                       "$1/parms/naviParms.txt"
mv -f    "$1/user/Abe/piki/pikiParms.txt"                       "$1/parms/pikiParms.txt"
mv -f    "$1/user/Abe/time/time.ini"                            "$1/parms/timeMgrParms.ini"
mv -f    "$1/user/Abe/item/barrelParms.txt"                     "$1/parms/barrelParms.txt"
mv -f    "$1/user/Abe/item/bridgeParms.txt"                     "$1/parms/bridgeParms.txt"
mv -f    "$1/user/Abe/item/fountainParms.txt"                   "$1/parms/fountainParms.txt"
mv -f    "$1/user/Abe/item/plantParms.txt"                      "$1/parms/plantParms.txt"
mv -f    "$1/user/Abe/item/rockParms.txt"                       "$1/parms/rockParms.txt"
mv -f    "$1/user/Abe/item/TreasureParms.txt"                   "$1/parms/treasureParms.txt"
mv -f    "$1/user/Kando/aiConstants.txt"                        "$1/parms/aiConstants.txt"
mv -f    "$1/user/Nishimura/Camera/caveCameraParms.txt"         "$1/parms/caveCameraParms.txt"
mv -f    "$1/user/Nishimura/Camera/groundCameraParms.txt"       "$1/parms/groundCameraParms.txt"
mv -f    "$1/user/Nishimura/Camera/引きカメラcameraParms.txt"      "$1/parms/引きカメラcameraParms.txt"
mv -f    "$1/user/Nishimura/Camera/撮影cameraParms.txt"         "$1/parms/撮影cameraParms.txt"
mv -f    "$1/user/Nishimura/Camera/本物 groundCameraParms.txt"  "$1/parms/本物 groundCameraParms.txt"
mv -f    "$1/user/Nishimura/Camera/本物caveCameraParms.txt"     "$1/parms/本物caveCameraParms.txt"
mv -f    "$1/user/Nishimura/Rumble/rumbleParms.txt"             "$1/parms/rumbleParms.txt"
mv -f    "$1/user/Nishimura/Rumble/rumbleData.txt"              "$1/parms/rumbleData.txt"
mv -f    "$1/user/Nishimura/Shadow/shadowParms.txt"             "$1/parms/shadowParms.txt"

## zukan ##
mkdir -p "$1/zukan"
mkdir -p "$1/zukan/maps"
mv -f    "$1/user/Matoba/resulttex"                             "$1/zukan/resulttex"
mv -f    "$1/user/Yamashita/enemytex"                           "$1/zukan/enemytex"
cp -r -f "$1/user/Kando/map/zukan/"*                            "$1/zukan/maps"
cp -r -f "$1/user/Abe/map/zukan/"*                              "$1/zukan/maps"
#        Unused copy of newtest assumed to be from testing the Piklopedia.  It has minor differences.
mv -f    "$1/user/Kando/zukan/map"                              "$1/zukan/maps/newtest"
mkdir -p "$1/zukan/maps/forest/mgr/us"
mkdir -p "$1/zukan/maps/forest/mgr/pal"
mkdir -p "$1/zukan/maps/forest/mgr/jpn"
mkdir -p "$1/zukan/maps/last/mgr/us"
mkdir -p "$1/zukan/maps/last/mgr/pal"
mkdir -p "$1/zukan/maps/last/mgr/jpn"
mkdir -p "$1/zukan/maps/newtest/mgr/us"
mkdir -p "$1/zukan/maps/newtest/mgr/pal"
mkdir -p "$1/zukan/maps/newtest/mgr/jpn"
mkdir -p "$1/zukan/maps/tutorial/mgr/us"
mkdir -p "$1/zukan/maps/tutorial/mgr/pal"
mkdir -p "$1/zukan/maps/tutorial/mgr/jpn"
mkdir -p "$1/zukan/maps/yakushima/mgr/us"
mkdir -p "$1/zukan/maps/yakushima/mgr/pal"
mkdir -p "$1/zukan/maps/yakushima/mgr/jpn"

## maps ##
mkdir -p "$1/maps"
cp -r -f "$1/user/Kando/map/"*                                  "$1/maps"
cp -r -f "$1/user/Abe/map/"*                                    "$1/maps"
#        stages.txt gets overwritten later
mv -f    "$1/user/Abe/stages.txt"                               "$1/maps/stages.txt"

## And now, the moment you've all been waiting for ##
rm -f -r "$1/user"
