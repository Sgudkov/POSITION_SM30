form zfix_positioning.

  types:
    begin of ls_keys,
	"Type keys of view
    end of  ls_keys.

  data:
    lt_struct type ls_keys,
    lv_tabix  type sy-tabix,
    lv_succ   type abap_bool.

  field-symbols: <ls_keys> type ls_keys,
                 <wa>      type any,
                 <wa2>     type any,
                 <ls_extr> type "Your view name.

  "<f1_x> - user input in sm30 search fields 
  "Use <table1> instead <f1_x> for newer systems
  assign <f1_x>  to <ls_keys>  casting.
  check <ls_keys> is assigned.

  loop at extract.
    assign extract to <ls_extr> casting.
    check <ls_extr> is assigned.
    lv_tabix = sy-tabix.

    lv_succ = abap_true.

    do .
      assign component sy-index of structure <ls_keys> to <wa>.
      if sy-subrc <> 0.
        exit.
      endif.
      check sy-index > 1. " skip checking MANDT
      check <wa> is not initial.

      assign component sy-index of structure <ls_extr> to <wa2>.
      if <wa2> <> <wa>.
        lv_succ = abap_false.
        exit.
      endif.

    enddo.

    if lv_succ = abap_true.
      nextline = lv_tabix.
      exit.
    endif.

  endloop.


endform. 