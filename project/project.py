import sys
from dol_c_kit import Project, assemble_lis, assemble_ori, write_lis, write_ori, hi, hia, lo

# 0 is USA Demo 1
# 1 is USA v1.00
if len(sys.argv) == 1:
    ver = 0
else:
    ver = int(sys.argv[1])
print("Building version {}".format(ver))


def patch_osarena_low(dol, _rom_end):
    legacy_mode = False
    stack_size = 0x10000
    db_stack_size = 0x2000
    
    # Stacks are 8 byte aligned
    _stack_addr = (_rom_end + stack_size + 7) & 0xFFFFFFF8
    _stack_end = _stack_addr - stack_size
    _db_stack_addr = (_stack_addr + db_stack_size + 7) & 0xFFFFFFF8
    _db_stack_end = _db_stack_addr - db_stack_size
    
    # OSArena is 32 byte aligned
    _osarena_lo = (_stack_addr + 31) & 0xFFFFFFE0
    _db_osarena_lo = (_db_stack_addr + 31) & 0xFFFFFFE0
    
    # Memory is roughly laid out like this:
    # | DOL sections | stack | db_stack | OSArena                                                  | FST |
    # 
    # Older C-Kit starter projects included patchers that would allocate space between the stack and
    # OSArena.  Also, the concept of the conditional db_stack wasn't really understood yet, so zero bytes
    # were allocated for it.
    # | DOL sections | stack | Old C-Kit | OSArena                                                 | FST |
    # 
    # The new and improved patcher allocates space like this instead:
    # | DOL sections | New C-Kit | stack | db_stack | OSArena                                      | FST |
    # 
    # However, what if you wanted to use the new patcher on a DOL previously modified
    # by older C-Kit patchers?  Well, you would obviously have the base address after the
    # last section in memory, but a problem arises:
    # | DOL sections |       | Old C-Kit | New C-Kit | stack | db_stack | OSArena                  | FST |
    # 
    # The space previously allocated for the stack goes totally unused!  To avoid wasting 10kb of space,
    # the new patcher also features a legacy mode, which mimicks the common old patcher's behavior.
    # Legacy mode should ONLY be used when patching DOLs previously modified by older C-Kit patchers.
    # | DOL sections | stack | Old C-Kit | New C-Kit | OSArena                                     | FST |
    
    if ver == 0: # USA Demo 1
        if legacy_mode == True:
            # In [OSInit]...
            # OSSetArenaLo( _osarena_lo );   // _osarena_lo instead of _db_osarena_lo is intentional!
            dol.seek(0x800eb36c); write_lis( dol, 3,    hi( _osarena_lo, True  ) ) 
            dol.seek(0x800eb370); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )
            
            # In [OSInit]...
            # If ( BootInfo->0x0030 == 0 ) && ( *BI2DebugFlag < 2 )
            # OSSetArenaLo( _osarena_lo );
            dol.seek(0x800eb3a4); write_lis( dol, 3,    hi( _osarena_lo, True  ) )
            dol.seek(0x800eb3a8); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )
        else:
            # In [__init_registers]...
            dol.seek(0x80005410); write_lis( dol, 1,    hi( _stack_addr, True  ) ) 
            dol.seek(0x80005414); write_ori( dol, 1, 1, lo( _stack_addr, False ) )
            
            # It can be assumed that the _db_stack_addr value is also set somewhere.
            # However, it does not seem to matter, as the DBStack is not allocated.
            
            # In [__OSThreadInit]...
            # DefaultThread->0x304 = _db_stack_end
            dol.seek(0x800f18bc); write_lis( dol, 3,    hi( _db_stack_end, True  ) )
            dol.seek(0x800f18c0); write_ori( dol, 0, 3, lo( _db_stack_end, False ) )
            
            # In [__OSThreadInit]...
            # DefaultThread->0x308 = _stack_end
            dol.seek(0x800f18c4); write_lis( dol, 3,    hi( _stack_end, True  ) )
            dol.seek(0x800f18cc); write_ori( dol, 0, 3, lo( _stack_end, False ) )
            
            # In [OSInit]...
            # OSSetArenaLo( _db_osarena_lo );
            dol.seek(0x800eb36c); write_lis( dol, 3,    hi( _db_osarena_lo, True  ) ) 
            dol.seek(0x800eb370); write_ori( dol, 3, 3, lo( _db_osarena_lo, False ) )
            
            # In [OSInit]...
            # If ( BootInfo->0x0030 == 0 ) && ( *BI2DebugFlag < 2 )
            # OSSetArenaLo( _osarena_lo );
            dol.seek(0x800eb3a4); write_lis( dol, 3,    hi( _osarena_lo, True  ) )
            dol.seek(0x800eb3a8); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )
    if ver == 1: # USA v1.00
        if legacy_mode == True:
            # In [OSInit]...
            # OSSetArenaLo( _osarena_lo );   // _osarena_lo instead of _db_osarena_lo is intentional!
            dol.seek(0x800eb38c); write_lis( dol, 3,    hi( _osarena_lo, True  ) ) 
            dol.seek(0x800eb390); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )
            
            # In [OSInit]...
            # If ( BootInfo->0x0030 == 0 ) && ( *BI2DebugFlag < 2 )
            # OSSetArenaLo( _osarena_lo );
            dol.seek(0x800eb3c4); write_lis( dol, 3,    hi( _osarena_lo, True  ) )
            dol.seek(0x800eb3c8); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )
        else:
            # In [__init_registers]...
            dol.seek(0x80005410); write_lis( dol, 1,    hi( _stack_addr, True  ) ) 
            dol.seek(0x80005414); write_ori( dol, 1, 1, lo( _stack_addr, False ) )
            
            # It can be assumed that the _db_stack_addr value is also set somewhere.
            # However, it does not seem to matter, as the DBStack is not allocated.
            
            # In [__OSThreadInit]...
            # DefaultThread->0x304 = _db_stack_end
            dol.seek(0x800f18dc); write_lis( dol, 3,    hi( _db_stack_end, True  ) )
            dol.seek(0x800f18e0); write_ori( dol, 0, 3, lo( _db_stack_end, False ) )
            
            # In [__OSThreadInit]...
            # DefaultThread->0x308 = _stack_end
            dol.seek(0x800f18e4); write_lis( dol, 3,    hi( _stack_end, True  ) )
            dol.seek(0x800f18ec); write_ori( dol, 0, 3, lo( _stack_end, False ) )
            
            # In [OSInit]...
            # OSSetArenaLo( _db_osarena_lo );
            dol.seek(0x800eb38c); write_lis( dol, 3,    hi( _db_osarena_lo, True  ) ) 
            dol.seek(0x800eb390); write_ori( dol, 3, 3, lo( _db_osarena_lo, False ) )
            
            # In [OSInit]...
            # If ( BootInfo->0x0030 == 0 ) && ( *BI2DebugFlag < 2 )
            # OSSetArenaLo( _osarena_lo );
            dol.seek(0x800eb3c4); write_lis( dol, 3,    hi( _osarena_lo, True  ) )
            dol.seek(0x800eb3c8); write_ori( dol, 3, 3, lo( _osarena_lo, False ) )

    if p.verbose == True:
        print("")
        print("What's new:")
        print("{0:x} _rom_end".format(_rom_end))
        print("{0:x} _stack_end".format(_stack_end))
        print("{0:x} _stack_addr".format(_stack_addr))
        print("{0:x} _osarena_lo".format(_osarena_lo))
        print("{0:x} _db_stack_end".format(_db_stack_end))
        print("{0:x} _db_stack_addr".format(_db_stack_addr))
        print("{0:x} _db_osarena_lo".format(_db_osarena_lo))


strings = [
# filepaths
#   ((USA Demo 1, USA v1.00 )  Old String                                         , New String                                       ),
    ((0x8047b0d8, 0x8047b238), "/user/Yamashita/arc/gameTex.szs"                  , "/new_screen/gameTex.szs"                        ),
    ((0x8047b130, 0x8047b290), "/user/Yamashita/arc/gameTex.szs"                  , "/new_screen/gameTex.szs"                        ),
    ((0x8049a938, 0x8049aa98), "/user/Yamashita/arc/gameTex.szs"                  , "/new_screen/gameTex.szs"                        ),
    ((0x80483ad0, 0x80483c30), "user/Kando/vstex/arc.szs"                         , "new_screen/vsTex.szs"                           ),
#   ((0x8048e1d8, 0x8048e338), "/new_screen/cmn/res_map_image_tutorial.szs"       , "/new_screen/cmn/res_map_image_tutorial.szs"     ),
#   ((0x8048e204, 0x8048e364), "/new_screen/cmn/res_map_image_forest.szs"         , "/new_screen/cmn/res_map_image_forest.szs"       ),
#   ((0x8048e230, 0x8048e390), "/new_screen/cmn/res_map_image_yakushima.szs"      , "/new_screen/cmn/res_map_image_yakushima.szs"    ),
#   ((0x8048e25c, 0x8048e3bc), "/new_screen/cmn/res_map_image_last.szs"           , "/new_screen/cmn/res_map_image_last.szs"         ),
#   ((0x8048e618, 0x8048e778), "/new_screen/%s%s"                                 , "/new_screen/%s%s"                               ),
    ((0x80498ad0, 0x80498c30), "/user/Koono/mail_table.szs"                       , "/new_screen/mail_table.szs"                     ),
    ((0x80498afc, 0x80498c5c), "/user/Koono/mail_icon.szs"                        , "/new_screen/mail_icon.szs"                      ),
#   ((0x80498dcc, 0x80498f2c), "/new_screen/cmn/result_final_image.szs"           , "/new_screen/cmn/result_final_image.szs"         ),
#   ((0x8049a62c, 0x8049a78c), "new_screen/cmn/message_window.szs"                , "new_screen/cmn/message_window.szs"              ),
#   ((0x8049a650, 0x8049a7b0), "new_screen/cmn/gold_pod_for_message_window.szs"   , "new_screen/cmn/gold_pod_for_message_window.szs" ),
#   ((0x8049a680, 0x8049a7e0), "new_screen/cmn/pod_for_message_window.szs"        , "new_screen/cmn/pod_for_message_window.szs"      ),
#   ((0x8049c428, 0x8049c528), "/new_screen/cmn/res_map_image_tutorial.szs"       , "/new_screen/cmn/res_map_image_tutorial.szs"     ),
#   ((0x8049c454, 0x8049c554), "/new_screen/cmn/res_map_image_forest.szs"         , "/new_screen/cmn/res_map_image_forest.szs"       ),
#   ((0x8049c480, 0x8049c580), "/new_screen/cmn/res_map_image_yakushima.szs"      , "/new_screen/cmn/res_map_image_yakushima.szs"    ),
#   ((0x8049c4ac, 0x8049c5ac), "/new_screen/cmn/res_map_image_last.szs"           , "/new_screen/cmn/res_map_image_last.szs"         ),
    ((0x8047cad8, 0x8047cc38), "user/Kando/mizu.bti"                              , "effects/mizu.bti"                               ),
    ((0x8047caf8, 0x8047cc58), "user/Ebisawa/effect/game.jpc"                     , "effects/jpc/game.jpc"                           ),
    ((0x8047cb18, 0x8047cc78), "user/Ebisawa/effect/eff2d_game2d.jpc"             , "effects/jpc/eff2d_game2d.jpc"                   ),
    ((0x80481b38, 0x80481c98), "user/Kando/effect/modeleffect.szs"                , "effects/3d/modeleffect.szs"                     ),
    ((0x8048257c, 0x804826dc), "user/Ebisawa/effect/eff2d_world_map.jpc"          , "effects/jpc/eff2d_world_map.jpc"                ),
    ((0x80483d68, 0x80483ec8), "user/Kando/texCaster/arc.szs"                     , "effects/texCaster.szs"                          ),
    ((0x80496b50, 0x80496cb0), "user/Ebisawa/effect/eff2d_file_select.jpc"        , "effects/jpc/eff2d_file_select.jpc"              ),
    ((0x80497e54, 0x80497fb4), "user/Ebisawa/effect/eff2d_world_map.jpc"          , "effects/jpc/eff2d_world_map.jpc"                ),
    ((0x8049af34, 0x8049b094), "user/Ebisawa/effect/eff2d_game2d.jpc"             , "effects/jpc/eff2d_game2d.jpc"                   ),
    ((0x8049b12c, 0x8049b28c), "user/Ebisawa/effect/eff2d_game2d.jpc"             , "effects/jpc/eff2d_game2d.jpc"                   ),
    ((0x8047cb9c, 0x8047ccfc), "user/Mukki/mapunits/caveinfo/%s"                  , "caves/caveinfo/%s"                              ),
    ((0x8047cbbc, 0x8047cd1c), "user/Abe/vs/%s"                                   , "caves/vs/%s"                                    ),
    ((0x8047fc4c, 0x8047fdac), "user/Kando/map/vrbox/%s.szs"                      , "caves/vrbox/%s.szs"                             ),
    ((0x8047fc88, 0x8047fde8), "user/Mukki/mapunits/units/%s"                     , "caves/units/%s"                                 ),
    ((0x8047fcb8, 0x8047fe18), "user/Abe/cave/%s"                                 , "caves/light/%s"                                 ),
    ((0x8047fce0, 0x8047fe40), "user/Mukki/mapunits/arc/%s/texts.szs"             , "caves/arc/%s/texts.szs"                         ),
    ((0x8047fd5c, 0x8047febc), "user/Mukki/mapunits/arc/%s"                       , "caves/arc/%s"                                   ),
    ((0x8048fac0, 0x8048fc20), "/user/Totaka/ChallengeBgmList.txt"                , "/caves/ChallengeBgmList.txt"                    ),
    ((0x8048fb28, 0x8048fc88), "/user/Totaka/BgmList_Tutorial.txt"                , "/caves/BgmList_Tutorial.txt"                    ),
    ((0x8048fb4c, 0x8048fcac), "/user/Totaka/BgmList_Forest.txt"                  , "/caves/BgmList_Forest.txt"                      ),
    ((0x8048fb6c, 0x8048fccc), "/user/Totaka/BgmList_Yakushima.txt"               , "/caves/BgmList_Yakushima.txt"                   ),
    ((0x8048fb90, 0x8048fcf0), "/user/Totaka/BgmList_Last.txt"                    , "/caves/BgmList_Last.txt"                        ),
    ((0x8048fbb0, 0x8048fd10), "/user/Totaka/BgmList_BgmTest.txt"                 , "/caves/BgmList_BgmTest.txt"                     ),
    ((0x8047d4e8, 0x8047d648), "user/Abe/piki/naviParms.txt"                      , "parms/naviParms.txt"                            ),
    ((0x8047de78, 0x8047dfd8), "user/Abe/piki/pikiParms.txt"                      , "parms/pikiParms.txt"                            ),
    ((0x8047fa7c, 0x8047fbdc), "user/Abe/time/time.ini"                           , "parms/timeMgrParms.ini"                         ),
    ((0x8047faf0, 0x8047fc50), "/user/Kando/aiConstants.txt"                      , "/parms/aiConstants.txt"                         ),
    ((0x80480820, 0x80480980), "user/Abe/item/plantParms.txt"                     , "parms/plantParms.txt"                           ),
    ((0x804809f0, 0x80480b50), "user/Abe/item/rockParms.txt"                      , "parms/rockParms.txt"                            ),
    ((0x80480ff8, 0x80481158), "user/Abe/item/fountainParms.txt"                  , "parms/fountainParms.txt"                        ),
    ((0x80481138, 0x80481298), "/user/Abe/item/bridgeParms.txt"                   , "/parms/bridgeParms.txt"                         ),
    ((0x80481158, 0x804812b8), "user/Abe/item/bridgeParms.txt"                    , "parms/bridgeParms.txt"                          ),
    ((0x804815cc, 0x8048172c), "user/Abe/item/treasureParms.txt"                  , "parms/treasureParms.txt"                        ),
    ((0x804818c8, 0x80481a28), "user/Abe/item/barrelParms.txt"                    , "parms/barrelParms.txt"                          ),
    ((0x80483ee4, 0x80484044), "/user/Nishimura/Shadow/shadowParms.txt"           , "/parms/shadowParms.txt"                         ),
    ((0x80484058, 0x804841b8), "/user/Nishimura/Camera/caveCameraParms.txt"       , "/parms/caveCameraParms.txt"                     ),
    ((0x80484084, 0x804841e4), "/user/Nishimura/Camera/groundCameraParms.txt"     , "/parms/groundCameraParms.txt"                   ),
    ((0x80484740, 0x804848a0), "/user/Nishimura/Rumble/rumbleParms.txt"           , "/parms/rumbleParms.txt"                         ),
    ((0x80484768, 0x804848c8), "/user/Nishimura/Rumble/rumbleData.txt"            , "/parms/rumbleData.txt"                          ),
    ((0x8047d504, 0x8047d664), "/user/Kando/piki/texts.szs"                       , "/objects/piki/texts.szs"                        ),
    ((0x8047d534, 0x8047d694), "/user/Kando/piki/pikis.szs"                       , "/objects/piki/pikis.szs"                        ),
    ((0x8047de94, 0x8047dff4), "/user/Kando/piki/pikis.szs"                       , "/objects/piki/pikis.szs"                        ),
    ((0x8047e298, 0x8047e3f8), "/user/Abe/Pellet/%s/"                             , "/objects/pellet/%s/"                            ),
    ((0x8047e2b0, 0x8047e410), "user/Kando/pellet/"                               , "objects/pellet/"                                ),
    ((0x8047e6fc, 0x8047e85c), "user/Kando/onyon/arc.szs"                         , "objects/onyon/arc.szs"                          ),
    ((0x8047e73c, 0x8047e89c), "user/Kando/pod_gold/arc.szs"                      , "objects/pod_gold/arc.szs"                       ),
    ((0x8047e758, 0x8047e8b8), "user/Kando/pod/arc.szs"                           , "objects/pod/arc.szs"                            ),
    ((0x8047e7bc, 0x8047e91c), "user/Kando/onyon"                                 , "objects/onyon"                                  ),
    ((0x8047e800, 0x8047e960), "user/Kando/pod_gold"                              , "objects/pod_gold"                               ),
    ((0x8047e814, 0x8047e974), "user/Kando/pod"                                   , "objects/pod"                                    ),
    ((0x8047e83c, 0x8047e99c), "user/Kando/ufo_gold/arc.szs"                      , "objects/ufo_gold/arc.szs"                       ),
    ((0x8047e858, 0x8047e9b8), "user/Kando/ufo/arc.szs"                           , "objects/ufo/arc.szs"                            ),
    ((0x8047e890, 0x8047e9f0), "user/Kando/ufo_gold"                              , "objects/ufo_gold"                               ),
    ((0x8047e8a4, 0x8047ea04), "user/Kando/ufo"                                   , "objects/ufo"                                    ),
    ((0x8047f834, 0x8047f994), "user/Kando/map/waterbox.szs"                      , "objects/waterbox.szs"                           ),
    ((0x8047f850, 0x8047f9b0), "user/Kando/map/waterbox2p.szs"                    , "objects/waterbox2p.szs"                         ),
    ((0x80480074, 0x804801d4), "user/Kando/objects/gates"                         , "objects/gates"                                  ),
    ((0x80480090, 0x804801f0), "gate-arc.szs"                                     , "gate/arc.szs"                                   ),
    ((0x804800b0, 0x80480210), "gate-texts.szs"                                   , "gate/texts.szs"                                 ),
    ((0x804800f8, 0x80480258), "user/Kando/gates/gate-arc.szs"                    , "objects/gates/gate/arc.szs"                     ),
    ((0x80480190, 0x804802f0), "e-gate-arc.szs"                                   , "e-gate/arc.szs"                                 ),
    ((0x804801ac, 0x8048030c), "e-gate-texts.szs"                                 , "e-gate/texts.szs"                               ),
    ((0x804801f4, 0x80480354), "user/Kando/gates/e-gate-arc.szs"                  , "objects/gates/e-gate/arc.szs"                   ),
    ((0x804803e8, 0x80480548), "user/Kando/objects/dungeon_hole"                  , "objects/dungeon_hole"                           ),
    ((0x80480488, 0x804805e8), "user/Kando/objects/honey"                         , "objects/honey"                                  ),
    ((0x80480704, 0x80480864), "user/Kando/objects/pikihead"                      , "objects/pikihead"                               ),  # Logical error in original Restructured
    ((0x80480804, 0x80480964), "user/Kando/objects/plants"                        , "objects/plants"                                 ),
    ((0x804809d0, 0x80480b30), "user/Kando/objects/ojamarock"                     , "objects/ojamarock"                              ),
    ((0x80480ea0, 0x80481000), "user/Kando/objects/dungeon_hole"                  , "objects/dungeon_hole"                           ),
    ((0x80480fcc, 0x8048112c), "user/Kando/objects/kanketusen"                    , "objects/kanketusen"                             ),
    ((0x8048111c, 0x8048127c), "user/Kando/objects/bridge"                        , "objects/bridge_back"                            ),
    ((0x804811e0, 0x80481340), "user/Kando/bridge/s_bridge"                       , "objects/bridge/s_bridge"                        ),
    ((0x8048120c, 0x8048136c), "user/Kando/bridge/slope_u"                        , "objects/bridge/slope_u"                         ),
    ((0x80481234, 0x80481394), "user/Kando/bridge/l_bridge"                       , "objects/bridge/l_bridge"                        ),
    ((0x804815b0, 0x80481710), "user/Kando/objects/treasure"                      , "objects/treasure"                               ),
    ((0x8048173c, 0x8048189c), "user/Kando/objects/downfloor"                     , "objects/downfloor"                              ),
    ((0x804818ac, 0x80481a0c), "user/Kando/objects/barrel"                        , "objects/barrel"                                 ),
    ((0x80481cf4, 0x80481e54), "user/Kando/objects/ujamushi"                      , "objects/ujamushi"                               ),
    ((0x80481eb8, 0x80482018), "user/Kando/objects/weed"                          , "objects/weed"                                   ),
    ((0x80483268, 0x804833c8), "/user/Abe/Pellet/%s/pelletlist_%s.szs"            , "/objects/pellet/%s/pelletlist_%s.szs"           ),
    ((0x804832a4, 0x80483404), "/user/Kando/pelletlist.szs"                       , "/objects/pelletlist.szs"                        ),
    ((0x8049b01c, 0x8049b17c), "/user/Kando/piki/pikis.szs"                       , "/objects/piki/pikis.szs"                        ),
    ((0x8049b050, 0x8049b1b0), "user/Kando/onyon/arc.szs"                         , "objects/onyon/arc.szs"                          ),
    ((0x8049c838, 0x8049c938), "user/Kando/onyon/arc.szs"                         , "objects/onyon/arc.szs"                          ),
    ((0x8049c854, 0x8049c954), "user/Kando/onyon/texts.szs"                       , "objects/onyon/texts.szs"                        ),
    ((0x8049c870, 0x8049c970), "user/Kando/pod/arc.szs"                           , "objects/pod/arc.szs"                            ),
    ((0x8049c888, 0x8049c988), "user/Kando/pod/texts.szs"                         , "objects/pod/texts.szs"                          ),
    ((0x8049c8a4, 0x8049c9a4), "user/Kando/pod_gold/arc.szs"                      , "objects/pod_gold/arc.szs"                       ),
    ((0x8049c8c0, 0x8049c9c0), "user/Kando/pod_gold/texts.szs"                    , "objects/pod_gold/texts.szs"                     ),
    ((0x8049c8e0, 0x8049c9e0), "user/Kando/ufo/arc.szs"                           , "objects/ufo/arc.szs"                            ),
    ((0x8049c8f8, 0x8049c9f8), "user/Kando/ufo/texts.szs"                         , "objects/ufo/texts.szs"                          ),
    ((0x8049c914, 0x8049ca14), "user/Kando/ufo_gold/arc.szs"                      , "objects/ufo_gold/arc.szs"                       ),
    ((0x8049c930, 0x8049ca30), "user/Kando/ufo_gold/texts.szs"                    , "objects/ufo_gold/texts.szs"                     ),
    ((0x8049c950, 0x8049ca50), "user/Kando/objects/gates/gate-arc.szs"            , "objects/gates/gate/arc.szs"                     ),
    ((0x8049c978, 0x8049ca78), "user/Kando/objects/gates/gate-texts.szs"          , "objects/gates/gate/texts.szs"                   ),
    ((0x8049c9a0, 0x8049caa0), "user/Kando/objects/gates/e-gate-arc.szs"          , "objects/gates/e-gate/arc.szs"                   ),
    ((0x8049c9c8, 0x8049cac8), "user/Kando/objects/gates/e-gate-texts.szs"        , "objects/gates/e-gate/texts.szs"                 ),
    ((0x8049c9f4, 0x8049caf4), "user/Kando/objects/dungeon_hole/arc.szs"          , "objects/dungeon_hole/arc.szs"                   ),
    ((0x8049ca1c, 0x8049cb1c), "user/Kando/objects/dungeon_hole/texts.szs"        , "objects/dungeon_hole/texts.szs"                 ),
    ((0x8049ca48, 0x8049cb48), "user/Kando/objects/pikihead/arc.szs"              , "objects/pikihead/arc.szs"                       ),
    ((0x8049ca6c, 0x8049cb6c), "user/Kando/objects/pikihead/texts.szs"            , "objects/pikihead/texts.szs"                     ),
    ((0x8049ca94, 0x8049cb94), "user/Kando/bridge/s_bridge/arc.szs"               , "objects/bridge/s_bridge/arc.szs"                ),
    ((0x8049cab8, 0x8049cbb8), "user/Kando/bridge/s_bridge/texts.szs"             , "objects/bridge/s_bridge/texts.szs"              ),
    ((0x8049cae0, 0x8049cbe0), "user/Kando/bridge/slope_u/arc.szs"                , "objects/bridge/slope_u/arc.szs"                 ),
    ((0x8049cb04, 0x8049cc04), "user/Kando/bridge/slope_u/texts.szs"              , "objects/bridge/slope_u/texts.szs"               ),
    ((0x8049cb28, 0x8049cc28), "user/Kando/bridge/l_bridge/arc.szs"               , "objects/bridge/l_bridge/arc.szs"                ),
    ((0x8049cb4c, 0x8049cc4c), "user/Kando/bridge/l_bridge/texts.szs"             , "objects/bridge/l_bridge/texts.szs"              ),
    ((0x8047f7b4, 0x8047f914), "user/Abe/stages.txt"                              , "maps/stages.txt"                                ),
    ((0x8047feb4, 0x80480014), "/user/Matoba/challenge/kfes-stages.txt"           , "/caves/stages_kfes.txt"                         ),
    ((0x8047fedc, 0x8048003c), "/user/Matoba/challenge/stages.txt"                , "/caves/stages_ch.txt"                           ),
    ((0x804942f8, 0x80494458), "/user/Matoba/challenge/stages.txt"                , "/caves/stages_ch.txt"                           ),
    ((0x80494770, 0x804948d0), "/user/Matoba/challenge/stages.txt"                , "/caves/stages_ch.txt"                           ),  # Typo in original Restructured
    ((0x8047ff00, 0x80480060), "/user/abe/vs/stages.txt"                          , "/caves/stages_vs.txt"                           ),
    ((0x80482d44, 0x80482ea4), "/user/Yamashita/enemyTex/arc.szs"                 , "/zukan/enemytex/arc.szs"                        ),
    ((0x80482f40, 0x804830a0), "user/Yamashita/zukan/%s/%s/arc.szs"               , "zukan/maps/%s/mgr/%s/arc.szs"                   ),
    ((0x80483078, 0x804831d8), "/user/Matoba/resulttex/%s/arc.szs"                , "/zukan/resulttex/%s/arc.szs"                    ),
    ((0x8048f9c4, 0x8048fb24), "/user/Totaka/StreamList.txt"                      , "/AudioRes/StreamList.txt"                       ),
    ((0x8048f9e0, 0x8048fb40), "/user/Totaka/BgmList.txt"                         , "/AudioRes/BgmList.txt"                          ),
    ((0x8049d9c8, 0x8049dac8), "/user/Totaka/trackMap_Seq_T.txt"                  , "/AudioRes/trackMap_Seq_T.txt"                   ),
    ((0x8049d9f8, 0x8049daf8), "/user/Totaka/trackMap_Cond_T.txt"                 , "/AudioRes/trackMap_Cond_T.txt"                  ),
    ((0x8049da3c, 0x8049db3c), "/user/Wakai/trackMap_Cond_W.txt"                  , "/AudioRes/trackMap_Cond_W.txt"                  ),
    ((0x8049da5c, 0x8049db5c), "/user/Wakai/trackMap_Seq_W.txt"                   , "/AudioRes/trackMap_Seq_W.txt"                   ),
    ((0x80495e50, 0x80495fb0), "user/Ebisawa/title/title.szs"                     , "title/title.szs"                                ),
    ((0x80495fd8, 0x80496138), "user/Ebisawa/title/bg_spring.szs"                 , "title/bg_spring.szs"                            ),
    ((0x80495ffc, 0x8049615c), "user/Ebisawa/title/bg_summer.szs"                 , "title/bg_summer.szs"                            ),
    ((0x80496020, 0x80496180), "user/Ebisawa/title/bg_autumn.szs"                 , "title/bg_autumn.szs"                            ),
    ((0x80496044, 0x804961a4), "user/Ebisawa/title/bg_winter.szs"                 , "title/bg_winter.szs"                            ),
    ((0x8049ae64, 0x8049afc4), "/user/yamashita/arc/boot_us.szs"                  , "/title/boot_us.szs"                             ),
    ((0x8049b2c8, 0x8049b428), "/user/yamashita/arc/demoMovieLogo_us.szs"         , "/title/demoMovieLogo_us.szs"                    ),
    ((0x80497848, 0x804979a8), "user/Ebisawa/card_e_reader/pp1.dwn"               , "cardE/pp1.dwn"                                  ),
    ((0x8049786c, 0x804979cc), "user/Ebisawa/card_e_reader/pp2.dwn"               , "cardE/pp2.dwn"                                  ),
    ((0x80497890, 0x804979f0), "user/Ebisawa/card_e_reader/pp3.dwn"               , "cardE/pp3.dwn"                                  ),
#   ((0x80499788, 0x804998e8), "/pikmin2UP.map"                                   , "/pikmin2UP.map"                                 ),
    ((0x80499e0c, 0x80499f6c), "/user/Mukki/movie/%s/demo.stb"                    , "/movie/%s/demo.stb"                             ),
    ((0x80499e2c, 0x80499f8c), "/user/Mukki/movie/%s/demo.szs"                    , "/movie/%s/demo.szs"                             ),
    ((0x8049a290, 0x8049a3f0), "user/Mukki/movie/demos.txt"                       , "movie/demos.txt"                                ),
    ((0x8049c4d4, 0x8049c5d4), "/user/Mukki/movie/s00_coursein/demo.szs"          , "/movie/s00_coursein/demo.szs"                   ),
    ((0x8049c4fc, 0x8049c5fc), "/user/Mukki/movie/s0B_cv_coursein/demo.szs"       , "/movie/s0B_cv_coursein/demo.szs"                ),
    ((0x8049c528, 0x8049c628), "/user/Mukki/movie/s09_holein/demo.szs"            , "/movie/s09_holein/demo.szs"                     ),
    ((0x8049c550, 0x8049c650), "/user/Mukki/movie/g2F_appear_hole/demo.szs"       , "/movie/g2F_appear_hole/demo.szs"                ),
    ((0x8049c57c, 0x8049c67c), "/user/Mukki/movie/g30_appear_fountain/demo.szs"   , "/movie/g30_appear_fountain/demo.szs"            ),
    ((0x8049c5ac, 0x8049c6ac), "/user/Mukki/movie/s10_suck_treasure/demo.szs"     , "/movie/s10_suck_treasure/demo.szs"              ),
    ((0x8049c5dc, 0x8049c6dc), "/user/Mukki/movie/s17_suck_equipment/demo.szs"    , "/movie/s17_suck_equipment/demo.szs"             ),
    ((0x8049c60c, 0x8049c70c), "/user/Mukki/movie/s22_cv_suck_equipment/demo.szs" , "/movie/s22_cv_suck_equipment/demo.szs"          ),
    ((0x8049c640, 0x8049c740), "/user/Mukki/movie/s22_cv_suck_treasure/demo.szs"  , "/movie/s22_cv_suck_treasure/demo.szs"           ),
    ((0x8049c670, 0x8049c770), "/user/Mukki/movie/s01_dayend/demo.szs"            , "/movie/s01_dayend/demo.szs"                     ),
    ((0x8049c698, 0x8049c798), "/user/Mukki/movie/s02_dayend_result/demo.szs"     , "/movie/s02_dayend_result/demo.szs"              ),
    ((0x8049c6c8, 0x8049c7c8), "/user/Mukki/movie/s03_orimadown/demo.szs"         , "/movie/s03_orimadown/demo.szs"                  ),
    ((0x8049c6f4, 0x8049c7f4), "/user/Mukki/movie/s04_dayend_orimadown/demo.szs"  , "/movie/s04_dayend_orimadown/demo.szs"           ),
    ((0x8049c724, 0x8049c824), "/user/Mukki/movie/s05_pikminzero/demo.szs"        , "/movie/s05_pikminzero/demo.szs"                 ),
    ((0x8049c750, 0x8049c850), "/user/Mukki/movie/s06_dayend_pikminzero/demo.szs" , "/movie/s06_dayend_pikminzero/demo.szs"          ),
    ((0x8049c784, 0x8049c884), "/user/Mukki/movie/s0C_cv_escape/demo.szs"         , "/movie/s0C_cv_escape/demo.szs"                  ),
    ((0x8049c7b0, 0x8049c8b0), "/user/Mukki/movie/s0E_return_cave/demo.szs"       , "/movie/s0E_return_cave/demo.szs"                ),
    ((0x8049c7dc, 0x8049c8dc), "/user/Mukki/movie/s12_cv_giveup/demo.szs"         , "/movie/s12_cv_giveup/demo.szs"                  ),
    ((0x8049c808, 0x8049c908), "/user/Mukki/movie/s21_dayend_takeoff/demo.szs"    , "/movie/s21_dayend_takeoff/demo.szs"             ),
#   ((0x8049acc8, 0x8049ae28), "/memoryCard/memoryCardHeader.szs"                 , "/memoryCard/memoryCardHeader.szs"               ),
#   ((0x8049cb74, 0x8049cc74), "/enemy/data/Queen/queenchappy_model.btk"          , "/enemy/data/Queen/queenchappy_model.btk"        ),
#   ((0x8049cb9c, 0x8049cc9c), "/enemy/data/Queen/model.szs"                      , "/enemy/data/Queen/model.szs"                    ),
#   ((0x8049cbb8, 0x8049ccb8), "/enemy/data/Queen/anim.szs"                       , "/enemy/data/Queen/anim.szs"                     ),
#   ((0x8049cbd4, 0x8049ccd4), "/enemy/data/BigTreasure/model.szs"                , "/enemy/data/BigTreasure/model.szs"              ),
#   ((0x8049cbf8, 0x8049ccf8), "/enemy/data/BigTreasure/anim.szs"                 , "/enemy/data/BigTreasure/anim.szs"               ),
#   ((0x8049cc1c, 0x8049cd1c), "/enemy/data/Baby/model.szs"                       , "/enemy/data/Baby/model.szs"                     ),
#   ((0x8049cc38, 0x8049cd38), "/enemy/data/Baby/anim.szs"                        , "/enemy/data/Baby/anim.szs"                      ),
    ((0x8049b1d0, 0x8049b330), "/user/Yamashita/testResource/tex"                 , "/testResource/tex"                              ),
    ((0x8047b27c, 0x8047b3dc), "/user/Yamashita/testResource/light/light.ini"     , "/testResource/light/light.ini"                  ),
# OSReport
#   ((USA Demo 1, USA v1.00 )  Old String														, New String														),
    ((0x80482f8c, 0x804830ec), "ペレット草なのでペレットをロードします free:%d \n"							, "Since this is pelplant, load the pellets\tfree:%d\n"				),
    ((0x80482fc0, 0x80483120), "だした free:%d \n"												, "post-load\tfree:%d\n"											),
    ((0x80482fd4, 0x80483134), "敵をアロック %d匹　free:%d \n"										, "Alloc %d enemies\tfree:%d\n"										),
    ((0x80499724, 0x80499884), "コンソールがありません\n"												, "There is no JUTConsole\n"										),
    ((0x80499bc0, 0x80499d20), "\tメモリーカード書き込み終了待ち\n"									, "\tWaiting for memory card\n"										),
    ((0x80499be4, 0x80499d44), "\tオーディオ終了待ち\n"												, "\tWaiting for audio\n"											),
    ((0x80499bfc, 0x80499d5c), "\tGP処理終了待ち\n"												, "\tWaiting for GP\n"												),
    ((0x80499c10, 0x80499d70), "\tリセットボタンが押されている\n"										, "\tThe reset button is pressed\n"									),
    ((0x80499c30, 0x80499d90), "許可が出ていない\n"												, "\tPermission denied\n"											),
    ((0x8049b380, 0x8049b4e0), "THPPlayerPrepare()終了\n"										, "THPPlayerPrepare done\n"											),
    ((0x8049b398, 0x8049b4f8), "オーディオ関係を初期化\n"											, "Initialize audio\n"												),
# panic_f
#   ((USA Demo 1, USA v1.00 ), Old String														, New String														),
#   ((0x8047c5dc, 0x8047c73c), "damedayo!\n"													, ""																),
#   ((0x8047c5e8, 0x8047c748), "zama--------n\n"												, ""																),
    ((0x8047c640, 0x8047c7A0), "ザンーー（・д・）−−ネン\n"												, "Too bad (D:)\n"													),
    ((0x8047c818, 0x8047c978), "２回は無理ｗ\n"													, "Can't do twice\n"												),
    ((0x8047c828, 0x8047c988), "useSpecificFBTexture してないｗ\n"									, "Do useSpecificFBTexture first\n"									),
#   ((0x8047ca30, 0x8047cb90), "KESHIMASU!\n"													, ""																),
    ((0x8047cebc, 0x8047d01c), "illegal layerLevel %d : out of bounds 0〜%d\n"					, "illegal layerLevel %d : out of bounds 0~%d\n"					),
    ((0x8047ceec, 0x8047d04c), "Cell Inf-Loop かもしれない\n"										, "Cell maybe infinite loop\n"										),
#   ((0x8047deb0, 0x8047e010), "pikis.szs not found !\n"										, ""																),
    ((0x8047e22c, 0x8047e38c), "がっかり\n"														, "No item\n"														),
#   ((0x80518930, 0x805189f0), "manda!\n"														, ""																),
#   ((0x8047e4e8, 0x8047e648), "BIKKURI no boot!\n"												, ""																),
#   ((0x8047e52c, 0x8047e68c), "damedayo !: arrive  ufoSuckState=%d\n"							, ""																),
    ((0x8047e668, 0x8047e7c8), "だめです"															, "No joint\n"														),
#   ((0x8047e59c, 0x8047e6fc), "bikkuri!\n"														, ""																),
#   ((0x8047e5a8, 0x8047e708), "I'am bikkuri-ed\n"												, ""																),
#   ((0x8047eb30, 0x8047ec90), "---------- だめだよ〜\n"											, "---------- No good~\n"											),
    ((0x8047ec74, 0x8047edd4), "rapCnt の使い方がよくなので凍結中! (RAPTURE)\n"						, "Freeze due to extraordinary rapCnt! (RAPTURE)\n"					),
#   ((0x8047ef88, 0x8047f0e8), "zannen !\n"														, ""																),
#   ((0x805191e0, 0x805192a0), "dame\n"															, ""																),
    ((0x8047f814, 0x8047f974), "まんだ! startUp\n"												, "manda! startUp\n"												),
#   ((0x8047fd8c, 0x8047feec), "siboudesu !\n"													, ""																),
#   ((0x8047fea8, 0x80480008), "zannenn\n"														, ""																),
#   ((0x8047ffb4, 0x80480114), "oosugi %d\n"													, ""																),
    ((0x80480500, 0x80480660), "変なペレットネームです!\n"											, "Strange pellet name!\n"											),
    ((0x80480750, 0x804808b0), "これはありえないよ\n"												, "Invalid birth mode\n"											),
    ((0x80480dd0, 0x80480f30), "セーブしたときと洞窟の数があいません\n"									, "Cave number doesn't match savedata\n"							),
#   ((0x80481288, 0x804813e8), "hame-dokkuri vs nakamoto-kouji\n"								, ""																),
#   ((0x804812a8, 0x80481408), "hame-dokkuri\n"													, ""																),
    ((0x80481cd0, 0x80481e30), "ダメック\n"														, "No good\n"														),
    ((0x80481e94, 0x80481ff4), "ダメック\n"														, "No good\n"														),
#   ((0x80482564, 0x804826c4), "MOC = Mouse on Cars!\n"											, ""																),
#   ((0x80519fa8, 0x8051a068), "damek\n"														, ""																),
#   ((0x8051a164, 0x8051a224), "damek\n"														, ""																),
#   ((0x804830b4, 0x80483214), "failed to open resulttex/arc.szs\n%s\n"							, ""																),
#   ((0x804832c0, 0x80483420), "no pelletlist.szs\n"											, ""																),
    ((0x8048348c, 0x804835ec), "ありえないっす\n"													, "Impossible\n"													),
    ((0x8051a1d0, 0x8051a290), "ない\n"															, "No\n"															),
#   ((0x8051a2f8, 0x8051a3b8), "ZANNEN\n"														, ""																),
    ((0x80483afc, 0x80483c5c), "vstex/arc.szs not found !\n"									, "vsTex.szs not found !\n"											),
    ((0x8048dfcc, 0x8048e12c), "ERR! in ObjCave Create失敗！\n"									, "ERR! in ObjCave Create!\n"										),
    ((0x8048e548, 0x8048e6a8), "だめです\n"														, "Do not do\n"														),
    ((0x8048e5d8, 0x8048e738), "ERR! in ObjCourseName Create失敗！\n"							, "ERR! in ObjCourseName Create!\n"									),
    ((0x8048e858, 0x8048e9b8), "ERR! in ObjKantei Create失敗！\n"								, "ERR! in ObjKantei Create!\n"										),
    ((0x8048e990, 0x8048eaf0), "ERR! in ObjTest Create失敗！\n"									, "ERR! in ObjTest Create!\n"										),
    ((0x8048ea58, 0x8048ebb8), "ERR! in ObjFloor Create失敗！\n"									, "ERR! in ObjFloor Create!\n"										),
    ((0x8048ebd4, 0x8048ed34), "ERR! in ObjCave Create失敗！\n"									, "ERR! in ObjCave Create!\n"										),
    ((0x8048ec8c, 0x8048edec), "ERR! in ObjAnaDemo Create失敗！\n"								, "ERR! in ObjAnaDemo Create!\n"									),
    ((0x8048ed14, 0x8048ee74), "だめです\n"														, "Do not do\n"														),
    ((0x8048ed4c, 0x8048eeac), "洞窟メニューではありません！\n"										, "Not a cave menu!\n"												),
    ((0x8048eda8, 0x8048ef08), "ERR! in ObjChallenge2P Create失敗！\n"							, "ERR! in ObjChallenge2P Create!\n"								),
    ((0x8048eeb0, 0x8048f010), "ERR! in ObjContena Create失敗！\n"								, "ERR! in ObjContena Create!\n"									),
    ((0x8048ef8c, 0x8048f0ec), "だめです\n"														, "Do not do\n"														),
    ((0x8048f158, 0x8048f2b8), "だめです\n"														, "Do not do\n"														),
    ((0x8048f198, 0x8048f2f8), "ERR! in ObjSave Create失敗！\n"									, "ERR! in ObjSave Create!\n"										),
    ((0x8048f214, 0x8048f374), "ERR! in ObjVs Create失敗！\n"									, "ERR! in ObjVs Create!\n"											),
    ((0x8048f2ec, 0x8048f44c), "ERR! in ObjChallenge1P Create失敗！\n"							, "ERR! in ObjChallenge1P Create!\n"								),
    ((0x8048f954, 0x8048fab4), "flagは0 or1です"													, "flag is 0 or 1"													),
    ((0x8048f99c, 0x8048fafc), "2重にグローバルシーンを作成しようとした"									, "Cannot have two global scenes at once"							),
    ((0x8048f9fc, 0x8048fb5c), "scene noが不正"													, "Bad scene no."													),
    ((0x8048fa18, 0x8048fb78), "前回のmCurrentSceneの後処理が不正"									, "Prior scene was processed wrong"									),
    ((0x8048fd1c, 0x8048fe7c), "ユニゾンマスタートラックはユニゾントラックより若い番号のトラックである必要があります"	, "Unison Master Track must have a lower index than Unison Track"	),
    ((0x8048ff8c, 0x804900ec), "リンクがありません"													, "No link"															),
#   ((0x80496248, 0x804963a8), "illegal kourin color %d\n"										, ""																),
    ((0x80496cf8, 0x80496e58), "想定外です。ありえねー"												, "This is unexpected."												),
    ((0x80496d88, 0x80496ee8), "ありえない！ありえない！たはあっ！\n"									, "Impossible!  Impossible!  TAHA!\n"								),
    ((0x80496f30, 0x80497090), "※メモリーカードエラー:想定外のケースです\n"								, "* Memory card error: Unexpected case\n"							),
    ((0x80496f5c, 0x804970bc), "※ロードでシリアルエラーはありえない\n"									, "* Serial error while loading\n"									),
    ((0x80496f84, 0x804970e4), "※　mgr->mCardErrorMgr->getEnd=%d ってありえない！\n"				, "* mgr->mCardErrorMgr->getEnd=%d out of range!\n"					),
#   ((0x80499b20, 0x80499c80), "go to hell !\n"													, ""																),
    ((0x80499cd8, 0x80499e38), "有りえないー　有りえない― ザマシメック！！\n"								, "Impossible!!  This is impossible!!\n"							),
    ((0x80499de4, 0x80499f44), "******* ★キューにはいりきらんよ〜！！\n"								, "I don't want to go to the queue!!\n"								),
#   ((0x80499e5c, 0x80499fbc), "The Bikkuri\n"													, ""																),
    ((0x80499ecc, 0x8049a02c), "まぢかｗ\n"														, "No STB\n"														),
    ((0x80499ed8, 0x8049a038), "demo.szs がないとだめだよｗ\n"										, "Can't go on without demo.szs\n"									),
    ((0x80499e80, 0x80499fe0), " キューになにもないぞーー(T^T)\n"										, "Nothing is in the queue (T^T)\n"									),
    ((0x80499f20, 0x8049a080), "データを解釈できましぇん\n"											, "I can't read the data\n"											),
    ((0x8049a4fc, 0x8049a65c), "有りえない状態でございます \n"										, "This state is impossible\n"										),
#   ((0x8049ab24, 0x8049ac84), "nanda~~~~?\n"													, ""																),
#   ((0x805208b8, 0x80520978), "dameck\n"														, ""																),
    ((0x8049b8b0, 0x8049b9b0), "【エラー】コマンドバッファが足りません\n"									, "[Error] Insufficient command buffer\n "							),
    ((0x8049b900, 0x8049ba00), "シーンの生成に失敗"                                   			 	, "doGetSceneBase fail"												),
    ((0x8049cee8, 0x8049cfe8), "使用禁止再生関数"												, "Prohibited function"												),
    ((0x8049cefc, 0x8049cffc), "JAIAnimeSound::playActorAnimSound  dataCounterが異常です。\n"		, "JAIAnimeSound::playActorAnimSound  dataCounter is strange\n"		),
    ((0x8049e0ec, 0x8049e1ec), "ありえないケース1"													, "Impossible Case 1"												),
    ((0x8049e100, 0x8049e200), "ありえないケース2"													, "Impossible Case 2"												),
# misc
#   ((USA Demo 1, USA v1.00 ), Old String														, New String														),
    ((0x8051921c, 0x805192dc), "folder"															, "course"															),   # Path to arc.szs and texts.szs for maps
    ((0x8047f768, 0x8047f8c8), "abe_folder"														, "stage"															),   # Path to generator files for maps
#   ((0x80480f24, 0x80481084), "# id (for stages.txt)\r\n"										, "# id (for stages.txt)\r\n"										),   # This file got renamed
]

if ver == 0: # USA Demo 1
    p = Project(base_addr=0x80520e00, verbose=True)
    p.project_name = "Pikmin 2 Restructured"
    p.set_osarena_patcher(patch_osarena_low)
    p.set_sda_bases(0x8051c5c0, 0x8051e2a0)
    p.src_dir = "src/"
    p.obj_dir = "obj/"
    p.gcc_flags.extend(("-D", "__DOLVERSION__=0")) # Macro for knowing which DOL version in C source
    p.as_flags.extend(("--defsym", "__DOLVERSION__=0")) # Symbol for knowing which DOL version in ASM source
    p.add_linker_script_file("misc/sections.ld")
    p.add_linker_script_file("misc/symbols (USA Demo 1).ld")
    for addr_tuple, old_path, new_path in strings:
        p.add_string(addr_tuple[0], new_path, encoding = "shift_jis", max_strlen = (len(old_path.encode("shift_jis")) + 4) & -4)
    p.add_gecko_txt_file("misc/geckocodes (USA Demo 1).txt")
    
    # Add other things to the project here.
    
    p.build_dol("misc/USA Demo 1.dol", "../patch/sys/main.dol")
    p.save_map("../patch/files/romhack.map")
    p.cleanup()
elif ver == 1: # USA v1.00
    p = Project(base_addr=0x80520ee0, verbose=True)
    p.project_name = "Pikmin 2 Restructured"
    p.set_osarena_patcher(patch_osarena_low)
    p.set_sda_bases(0x8051c680, 0x8051e360)
    p.src_dir = "src/"
    p.obj_dir = "obj/"
    p.gcc_flags.extend(("-D", "__DOLVERSION__=1")) # Macro for knowing which DOL version in C source
    p.as_flags.extend(("--defsym", "__DOLVERSION__=1")) # Symbol for knowing which DOL version in ASM source
    p.add_linker_script_file("misc/sections.ld")
    p.add_linker_script_file("misc/symbols (USA v1.00).ld")
    for addr_tuple, old_path, new_path in strings:
        p.add_string(addr_tuple[1], new_path, encoding = "shift_jis", max_strlen = (len(old_path.encode("shift_jis")) + 4) & -4)
    p.add_gecko_txt_file("misc/geckocodes (USA v1.00).txt")
    
    # Add other things to the project here.
    
    p.build_dol("misc/USA v1.00.dol", "../patch/sys/main.dol")
    p.save_map("../patch/files/romhack.map")
    p.cleanup()

