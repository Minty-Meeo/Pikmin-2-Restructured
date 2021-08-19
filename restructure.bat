:: Switch to UTF-8 if not already ::
CHCP 65001

:: Delete unused files ::
REM      Junk in the root
DEL      "%~1timeStampJP.txt"
DEL      "%~1timeStampJR.txt"
DEL      "%~1timeStampJV.txt"
DEL      "%~1timeStampPD.txt"
DEL      "%~1timeStampPV.txt"
DEL      "%~1timeStampUP.txt"
DEL      "%~1timeStampUR.txt"
DEL      "%~1timeStampUV.txt"
DEL      "%~1gameConfig.ini"
DEL      "%~1スナップショットgameConfig.ini"
DEL      "%~1プロダクトgameConfig.ini"
DEL      "%~1マリクラ-Develop-gameConfig.ini"
DEL      "%~1マリクラ-Release-gameConfig.ini"
REM      Old version of "user\Totaka\BgmList.txt"
DEL      "%~1AudioRes\BgmList.txt"
REM      Old version of "user\Ebisawa\effect\game.jpc"
DEL      "%~1user\Kando\effect\game.jpc"
REM      Old version of "user\Matoba\resulttex\arc.szs"
DEL      "%~1user\Kando\resulttex\arc.szs"
REM      Unarchived zukan stage manager file
DEL      "%~1user\Kando\zukan\course.txt"
REM      Old version being an unused copy
DEL      "%~1user\Abe\Pellet\us\pelletlist_jpn.szs"
REM      Old version of forest zukan files
DEL      "%~1user\Abe\map\zukan\light.ini"
DEL      "%~1user\Abe\map\zukan\route.txt"
REM      Unarchived files
DEL      "%~1user\Abe\Pellet\us\carcass_config.txt"
DEL      "%~1user\Abe\Pellet\us\item_config.txt"
DEL      "%~1user\Abe\Pellet\us\otakara_config.txt"
DEL      "%~1user\Abe\Pellet\pal\carcass_config.txt"
DEL      "%~1user\Abe\Pellet\pal\item_config.txt"
DEL      "%~1user\Abe\Pellet\pal\otakara_config.txt"
DEL      "%~1user\Abe\Pellet\jpn\carcass_config.txt"
DEL      "%~1user\Abe\Pellet\jpn\item_config.txt"
DEL      "%~1user\Abe\Pellet\jpn\otakara_config.txt"

:: cardE ::
MOVE     "%~1user\Ebisawa\card_e_reader"                        "%~1cardE"

:: movie ::
MOVE     "%~1user\Mukki\movie"                                  "%~1movie"

:: testdata ::
MOVE     "%~1user\Ebisawa\testdata"                             "%~1testdata"

:: develop ::
MOVE     "%~1user\Kando\develop"                                "%~1develop"

:: testResource ::
REM          This folder is referenced in the DOL, but does not exist.
REM MKDIR    "%~1testResource"

:: AudioRes ::
MOVE     "%~1user\Totaka\BgmList.txt"                           "%~1AudioRes\BgmList.txt"
MOVE     "%~1user\Totaka\StreamList.txt"                        "%~1AudioRes\StreamList.txt"
MOVE     "%~1user\Totaka\trackMap_Cond_T.txt"                   "%~1AudioRes\trackMap_Cond_T.txt"
MOVE     "%~1user\Totaka\trackMap_Seq_T.txt"                    "%~1AudioRes\trackMap_Seq_T.txt"
MOVE     "%~1user\Wakai\trackMap_Cond_W.txt"                    "%~1AudioRes\trackMap_Cond_W.txt"
MOVE     "%~1user\Wakai\trackMap_Seq_W.txt"                     "%~1AudioRes\trackMap_Seq_W.txt"

:: effects ::
MKDIR    "%~1effects"
MKDIR    "%~1effects\jpc"
MKDIR    "%~1effects\3d"
MOVE     "%~1user\Kando\effect\modeleffect.szs"                 "%~1effects\3d\modeleffect.szs"
MOVE     "%~1user\Kando\texCaster\arc.szs"                      "%~1effects\texCaster.szs"
MOVE     "%~1user\Kando\mizu.bti"                               "%~1effects\mizu.bti"
MOVE     "%~1user\Ebisawa\effect\eff2d_file_select.jpc"         "%~1effects\jpc\eff2d_file_select.jpc"
MOVE     "%~1user\Ebisawa\effect\eff2d_game2d.jpc"              "%~1effects\jpc\eff2d_game2d.jpc"
MOVE     "%~1user\Ebisawa\effect\eff2d_world_map.jpc"           "%~1effects\jpc\eff2d_world_map.jpc"
MOVE     "%~1user\Ebisawa\effect\game.jpc"                      "%~1effects\jpc\game.jpc"

:: new_screen ::
MOVE     "%~1user\Kando\vstex\arc.szs"                          "%~1new_screen\vsTex.szs"
MOVE     "%~1user\Yamashita\arc\gameTex.szs"                    "%~1new_screen\gameTex.szs"
MOVE     "%~1user\Koono\mail_icon.szs"                          "%~1new_screen\mail_icon.szs"
MOVE     "%~1user\Koono\mail_table.szs"                         "%~1new_screen\mail_table.szs"

:: title ::
MOVE     "%~1user\Ebisawa\title"                                "%~1title"
MOVE     "%~1user\Yamashita\arc\boot_jp.szs"                    "%~1title\boot_jp.szs"
MOVE     "%~1user\Yamashita\arc\boot_pal.szs"                   "%~1title\boot_pal.szs"
MOVE     "%~1user\Yamashita\arc\boot_us.szs"                    "%~1title\boot_us.szs"
MOVE     "%~1user\Yamashita\arc\demoMovieLogo_jp.szs"           "%~1title\demoMovieLogo_jp.szs"
MOVE     "%~1user\Yamashita\arc\demoMovieLogo_pal.szs"          "%~1title\demoMovieLogo_pal.szs"
MOVE     "%~1user\Yamashita\arc\demoMovieLogo_us.szs"           "%~1title\demoMovieLogo_us.szs"

:: caves ::
MOVE     "%~1user\Mukki\mapunits"                               "%~1caves"
MOVE     "%~1user\Abe\cave"                                     "%~1caves\light"
MOVE     "%~1user\Abe\vs"                                       "%~1caves\vs"
MOVE     "%~1user\Totaka\BgmList_BgmTest.txt"                   "%~1caves\BgmList_BgmTest.txt"
MOVE     "%~1user\Totaka\BgmList_Forest.txt"                    "%~1caves\BgmList_Forest.txt"
MOVE     "%~1user\Totaka\BgmList_Last.txt"                      "%~1caves\BgmList_Last.txt"
MOVE     "%~1user\Totaka\BgmList_Tutorial.txt"                  "%~1caves\BgmList_Tutorial.txt"
MOVE     "%~1user\Totaka\BgmList_Yakushima.txt"                 "%~1caves\BgmList_Yakushima.txt"
MOVE     "%~1user\Totaka\ChallengeBgmList.txt"                  "%~1caves\ChallengeBgmList.txt"
MOVE     "%~1user\Kando\map\vrbox"                              "%~1caves\vrbox"
MOVE     "%~1user\Matoba\challenge\stages.txt"                  "%~1caves\stages_ch.txt"
MOVE     "%~1user\Matoba\challenge\kfes-stages.txt"             "%~1caves\stages_kfes.txt"
MOVE     "%~1caves\vs\stages.txt"                               "%~1caves\stages_vs.txt"

:: objects ::
MOVE     "%~1user\Kando\objects"                                "%~1objects"
REM      Unused backup copy
MOVE     "%~1objects\bridge"                                    "%~1objects\bridge_back"
MOVE     "%~1user\Kando\bridge"                                 "%~1objects\bridge"
MOVE     "%~1user\Kando\onyon"                                  "%~1objects\onyon"
MOVE     "%~1user\Kando\piki"                                   "%~1objects\piki"
MOVE     "%~1user\Kando\pod"                                    "%~1objects\pod"
MOVE     "%~1user\Kando\pod_gold"                               "%~1objects\pod_gold"
MOVE     "%~1user\Kando\ufo"                                    "%~1objects\ufo"
MOVE     "%~1user\Kando\ufo_gold"                               "%~1objects\ufo_gold"
REM          This folder is referenced in the DOL, but does not exist.
REM MKDIR    "%~1objects\treasure"
MKDIR    "%~1objects\gates\gate"
MKDIR    "%~1objects\gates\e-gate"
MOVE     "%~1objects\gates\gate-arc.szs"                        "%~1objects\gates\gate\arc.szs"
MOVE     "%~1objects\gates\gate-texts.szs"                      "%~1objects\gates\gate\texts.szs"
MOVE     "%~1objects\gates\e-gate-arc.szs"                      "%~1objects\gates\e-gate\arc.szs"
MOVE     "%~1objects\gates\e-gate-texts.szs"                    "%~1objects\gates\e-gate\texts.szs"
MOVE     "%~1user\Kando\map\waterbox.szs"                       "%~1objects\waterbox.szs"
MOVE     "%~1user\Kando\map\waterbox2p.szs"                     "%~1objects\waterbox2p.szs"
MOVE     "%~1user\Abe\Pellet"                                   "%~1objects\pellet"
MKDIR    "%~1objects\pellet\us\otakara"
MKDIR    "%~1objects\pellet\us\item"
MKDIR    "%~1objects\pellet\us\unused"
MKDIR    "%~1objects\pellet\us\numberpellet"
MKDIR    "%~1objects\pellet\us\fruit"
ROBOCOPY "%~1objects\pellet\us"                                 "%~1objects\pellet\us\otakara" /MOVE "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
ROBOCOPY "%~1objects\pellet\us"                                 "%~1objects\pellet\us\item"    /MOVE "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
ROBOCOPY "%~1objects\pellet\us"                                 "%~1objects\pellet\us\unused"  /MOVE "fue_c.szs" "light_b.szs" "map03.szs" "map04.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs"
MOVE     "%~1objects\pellet\us\pellet.szs"                      "%~1objects\pellet\us\numberpellet\pellet.szs"
MOVE     "%~1objects\pellet\us\fruits.szs"                      "%~1objects\pellet\us\fruit\fruits.szs"
MKDIR    "%~1objects\pellet\pal\otakara"
MKDIR    "%~1objects\pellet\pal\item"
MKDIR    "%~1objects\pellet\pal\unused"
MKDIR    "%~1objects\pellet\pal\numberpellet"
MKDIR    "%~1objects\pellet\pal\fruit"
ROBOCOPY "%~1objects\pellet\pal"                                "%~1objects\pellet\pal\otakara" /MOVE "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
ROBOCOPY "%~1objects\pellet\pal"                                "%~1objects\pellet\pal\item"    /MOVE "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
ROBOCOPY "%~1objects\pellet\pal"                                "%~1objects\pellet\pal\unused"  /MOVE "4parts_clover.szs" "beads.szs" "be_dama.szs" "broken_teala.szs" "button.szs" "candle.szs" "celluloid_doll.szs" "cheese.szs" "cherry.szs" "chessking.szs" "chessqueen.szs" "chocolate_ichigo.szs" "chocolate_white.szs" "contactlens.szs" "copperbell.szs" "diamond.szs" "donuts.szs" "donuts_choco.szs" "donuts_ichigo.szs" "donuts_white.szs" "flower.szs" "fue_c.szs" "fuluitin_jelly.szs" "GCdisc.szs" "GCdisc_luigi.szs" "GCdisc_mario.szs" "GCdisc_pikmin.szs" "GCdisc_zelda.szs" "gear01.szs" "ginka.szs" "goldbell.szs" "goldmedal.szs" "hallowin.szs" "indirect.szs" "kaseki.szs" "kayaku.szs" "kokesi.szs" "kouseki.szs" "kyukon.szs" "light_b.szs" "log" "map03.szs" "map04.szs" "mekki_ring.szs" "momiji.szs" "neji.szs" "neko_head.szs" "ohajiki.szs" "olgoal.szs" "orange.szs" "oukan.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs" "sensya06.szs" "shell1.szs" "silvermedal.szs" "sinju.szs" "suzu_middle.szs" "tomato.szs" "toy_jewel.szs" "toy_spring.szs" "tree_item.szs" "uja.szs" "uja1.szs" "uja2.szs" "yoyo.szs"
MOVE     "%~1objects\pellet\pal\pellet.szs"                     "%~1objects\pellet\pal\numberpellet\pellet.szs"
MOVE     "%~1objects\pellet\pal\fruits.szs"                     "%~1objects\pellet\pal\fruit\fruits.szs"
MKDIR    "%~1objects\pellet\jpn\otakara"
MKDIR    "%~1objects\pellet\jpn\item"
MKDIR    "%~1objects\pellet\jpn\unused"
MKDIR    "%~1objects\pellet\jpn\numberpellet"
MKDIR    "%~1objects\pellet\jpn\fruit"
ROBOCOPY "%~1objects\pellet\jpn"                                "%~1objects\pellet\jpn\otakara" /MOVE "ahiru.szs" "ahiru_head.szs" "akagai.szs" "apple.szs" "apple_blue.szs" "badminton.szs" "bane.szs" "bane_blue.szs" "bane_red.szs" "bane_yellow.szs" "baum_kuchen.szs" "baum_kuchen_s.szs" "bell.szs" "bell_blue.szs" "bell_red.szs" "bell_yellow.szs" "bey_goma.szs" "be_dama_blue.szs" "be_dama_blue_l.szs" "be_dama_red.szs" "be_dama_red_l.szs" "be_dama_yellow.szs" "be_dama_yellow_l.szs" "bird_hane.szs" "bolt.szs" "bolt_l.szs" "castanets.szs" "channel.szs" "chess_king_black.szs" "chess_king_white.szs" "chess_queen_black.szs" "chess_queen_white.szs" "chocoichigo.szs" "chocoichigo_l.szs" "chocolate.szs" "chocolate_l.szs" "chocowhite.szs" "chocowhite_l.szs" "compact.szs" "compact_make.szs" "cookie.szs" "cookie_m_l.szs" "cookie_s.szs" "cookie_s_l.szs" "cookie_u.szs" "cookie_u_l.szs" "creap.szs" "denchi_1_black.szs" "denchi_1_red.szs" "denchi_2_black.szs" "denchi_2_red.szs" "denchi_3_black.szs" "denchi_3_red.szs" "diamond_blue.szs" "diamond_blue_l.szs" "diamond_green.szs" "diamond_green_l.szs" "diamond_red.szs" "diamond_red_l.szs" "dia_a_blue.szs" "dia_a_green.szs" "dia_a_red.szs" "dia_b_blue.szs" "dia_b_green.szs" "dia_b_red.szs" "dia_c_blue.szs" "dia_c_green.szs" "dia_c_red.szs" "doll.szs" "donguri.szs" "donguri_l.szs" "donutschoco.szs" "donutschoco_s.szs" "donutsichigo.szs" "donutsichigo_s.szs" "donutswhite.szs" "donutswhite_s.szs" "elec.szs" "fire.szs" "fire_helmet.szs" "flask.szs" "flower_blue.szs" "flower_red.szs" "futa_a_gold.szs" "futa_a_silver.szs" "gas.szs" "gear.szs" "gear_silver.szs" "gold_medal.szs" "gum_tape.szs" "gum_tape_s.szs" "g_futa_daisen.szs" "g_futa_hirosima.szs" "g_futa_hiruzen.szs" "g_futa_kajiwara.szs" "g_futa_kitaama.szs" "g_futa_koiwai.szs" "g_futa_kyodo.szs" "g_futa_kyosin.szs" "g_futa_kyusyu.szs" "g_futa_nihonraku.szs" "g_futa_sakotani.szs" "g_futa_sikoku.szs" "g_futa_titiyas.szs" "halloween.szs" "haniwa.szs" "hotate.szs" "ichigo.szs" "ichigo_l.szs" "juji_key.szs" "juji_key_fc.szs" "j_block_blue.szs" "j_block_green.szs" "j_block_red.szs" "j_block_white.szs" "j_block_yellow.szs" "kan.szs" "kan_b_gold.szs" "kan_b_silver.szs" "kan_imuraya.szs" "kan_iwate.szs" "kan_kyokuyo.szs" "kan_maruha.szs" "kan_meidiya.szs" "kan_nichiro.szs" "kinoko.szs" "kinoko_doku.szs" "kinoko_tubu.szs" "kouseki_suisyou.szs" "kumakibori.szs" "kuri.szs" "leaf_kare.szs" "leaf_normal.szs" "leaf_yellow.szs" "locket.szs" "loozy.szs" "makigai.szs" "matu_bokkuri.szs" "medama_yaki.szs" "milk_cap.szs" "mojiban.szs" "momiji_kare.szs" "momiji_normal.szs" "momiji_red.szs" "nut.szs" "nut_l.szs" "otama.szs" "robot_head.szs" "saru_head.szs" "sensya.szs" "silver_medal.szs" "sinjyu.szs" "sinkukan.szs" "sinkukan_b.szs" "sinkukan_c.szs" "tape_blue.szs" "tape_red.szs" "tape_yellow.szs" "tatebue.szs" "teala_dia_a.szs" "teala_dia_b.szs" "teala_dia_c.szs" "teala_dia_d.szs" "tel_dial.szs" "toy_cat.szs" "toy_dog.szs" "toy_gentle.szs" "toy_lady.szs" "toy_ring_a_blue.szs" "toy_ring_a_green.szs" "toy_ring_a_red.szs" "toy_ring_b_blue.szs" "toy_ring_b_green.szs" "toy_ring_b_red.szs" "toy_ring_c_blue.szs" "toy_ring_c_green.szs" "toy_ring_c_red.szs" "toy_teala.szs" "turi_uki.szs" "uji_jisyaku.szs" "wadou_kaichin.szs" "watch.szs" "water.szs" "whistle.szs" "Xmas_item.szs" "yoyo_blue.szs" "yoyo_red.szs" "yoyo_yellow.szs"
ROBOCOPY "%~1objects\pellet\jpn"                                "%~1objects\pellet\jpn\item"    /MOVE "dashboots.szs" "fue_a.szs" "fue_b.szs" "fue_pullout.szs" "fue_wide.szs" "key.szs" "light_a.szs" "map01.szs" "map02.szs" "radar_a.szs" "radar_b.szs" "suit_fire.szs" "suit_powerup.szs"
ROBOCOPY "%~1objects\pellet\jpn"                                "%~1objects\pellet\jpn\unused"  /MOVE "fue_c.szs" "light_b.szs" "map03.szs" "map04.szs" "pal_denchi_1.szs" "pal_denchi_1_pana.szs" "radar_c.szs" "rocket_pac.szs"
MOVE     "%~1objects\pellet\jpn\pellet.szs"                     "%~1objects\pellet\jpn\numberpellet\pellet.szs"
MOVE     "%~1objects\pellet\jpn\fruits.szs"                     "%~1objects\pellet\jpn\fruit\fruits.szs"

:: parms ::
MKDIR    "%~1parms"
MOVE     "%~1user\Abe\piki\naviParms.txt"                       "%~1parms\naviParms.txt"
MOVE     "%~1user\Abe\piki\pikiParms.txt"                       "%~1parms\pikiParms.txt"
MOVE     "%~1user\Abe\time\time.ini"                            "%~1parms\timeMgrParms.ini"
MOVE     "%~1user\Abe\item\barrelParms.txt"                     "%~1parms\barrelParms.txt"
MOVE     "%~1user\Abe\item\bridgeParms.txt"                     "%~1parms\bridgeParms.txt"
MOVE     "%~1user\Abe\item\fountainParms.txt"                   "%~1parms\fountainParms.txt"
MOVE     "%~1user\Abe\item\plantParms.txt"                      "%~1parms\plantParms.txt"
MOVE     "%~1user\Abe\item\rockParms.txt"                       "%~1parms\rockParms.txt"
MOVE     "%~1user\Abe\item\TreasureParms.txt"                   "%~1parms\treasureParms.txt"
MOVE     "%~1user\Kando\aiConstants.txt"                        "%~1parms\aiConstants.txt"
MOVE     "%~1user\Nishimura\Camera\caveCameraParms.txt"         "%~1parms\caveCameraParms.txt"
MOVE     "%~1user\Nishimura\Camera\groundCameraParms.txt"       "%~1parms\groundCameraParms.txt"
MOVE     "%~1user\Nishimura\Camera\引きカメラcameraParms.txt"      "%~1parms\引きカメラcameraParms.txt"
MOVE     "%~1user\Nishimura\Camera\撮影cameraParms.txt"         "%~1parms\撮影cameraParms.txt"
MOVE     "%~1user\Nishimura\Camera\本物 groundCameraParms.txt"  "%~1parms\本物 groundCameraParms.txt"
MOVE     "%~1user\Nishimura\Camera\本物caveCameraParms.txt"     "%~1parms\本物caveCameraParms.txt"
MOVE     "%~1user\Nishimura\Rumble\rumbleParms.txt"             "%~1parms\rumbleParms.txt"
MOVE     "%~1user\Nishimura\Rumble\rumbleData.txt"              "%~1parms\rumbleData.txt"
MOVE     "%~1user\Nishimura\Shadow\shadowParms.txt"             "%~1parms\shadowParms.txt"

:: zukan ::
MKDIR    "%~1zukan"
MKDIR    "%~1zukan\maps"
MOVE     "%~1user\Matoba\resulttex"                             "%~1zukan\resulttex"
MOVE     "%~1user\Yamashita\enemytex"                           "%~1zukan\enemytex"
ROBOCOPY "%~1user\Abe\map\zukan"                                "%~1zukan\maps" /MOVE /E *
ROBOCOPY "%~1user\Kando\map\zukan"                              "%~1zukan\maps" /MOVE /E *
REM      Unused copy of newtest assumed to be from testing the Piklopedia.  It has minor differences.
MOVE     "%~1user\Kando\zukan\map"                              "%~1zukan\maps\newtest"
MKDIR    "%~1zukan\maps\forest\mgr\us"
MKDIR    "%~1zukan\maps\forest\mgr\pal"
MKDIR    "%~1zukan\maps\forest\mgr\jpn"
MKDIR    "%~1zukan\maps\last\mgr\us"
MKDIR    "%~1zukan\maps\last\mgr\pal"
MKDIR    "%~1zukan\maps\last\mgr\jpn"
MKDIR    "%~1zukan\maps\newtest\mgr\us"
MKDIR    "%~1zukan\maps\newtest\mgr\pal"
MKDIR    "%~1zukan\maps\newtest\mgr\jpn"
MKDIR    "%~1zukan\maps\tutorial\mgr\us"
MKDIR    "%~1zukan\maps\tutorial\mgr\pal"
MKDIR    "%~1zukan\maps\tutorial\mgr\jpn"
MKDIR    "%~1zukan\maps\yakushima\mgr\us"
MKDIR    "%~1zukan\maps\yakushima\mgr\pal"
MKDIR    "%~1zukan\maps\yakushima\mgr\jpn"

:: maps ::
MKDIR    "%~1maps"
ROBOCOPY "%~1user\Kando\map"                                    "%~1maps" /MOVE /E *
ROBOCOPY "%~1user\Abe\map"                                      "%~1maps"  /MOVE /E *
REM      stages.txt gets overwritten later
MOVE     "%~1user\Abe\stages.txt"                               "%~1maps\stages.txt"

:: And now, the moment you've all been waiting for ::
RMDIR /S /Q "%~1user"
