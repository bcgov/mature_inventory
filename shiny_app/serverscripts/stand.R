sd_header <- reactive({
  req(input$SelectVar)
  
  text <- paste0("<p>Stock summaries are compiled for 
       all GRID samples at the time of the latest measurement. 
       Small trees (> 0.1m Ht and < 4cm DBH) are tallied by species and size class. 
       Species code names are listed on <b> General Notes</b>.</p>")
  
  return(text)
})

output$sd_header <- renderUI({
  HTML(sd_header())
})



#stockplot_vol <- reactive({
#  req(input$SelectVar)
#  
#  if (!is.null(clstr_id_grid())){
#    
#    fig5_dat <- tree_fh_data %>%
#      filter(CLSTR_ID %in% clstr_id_grid(), DAM_NUM == 1, LV_D == "L") %>%
#      mutate(VOL_WSV_HA = VOL_WSV*PHF_TREE,
#             PERC_TOT_VOL_HA = VOL_WSV_HA/sum(VOL_WSV_HA, na.rm = T),
#             DBH_CLASS = round(DBH/5)*5) %>% 
#      mutate(SPC_GRP1 = substr(SPECIES,1,2)) %>%
#      mutate(SPC_GRP1 = ifelse(SPECIES %in% decidspc, 'Decid', SPC_GRP1))
#    
#    fig5_dat <- fig5_dat %>%
#      group_by(SPC_GRP1, DBH_CLASS) %>%
#      summarise(PERC_TOT_VOL_HA_SPC = sum(PERC_TOT_VOL_HA, na.rm = T)) %>%
#      ungroup()
#    
#    fig5_dat_label <- fig5_dat %>%
#      group_by(SPC_GRP1) %>%
#      summarize(TOT_VOL_HA = sum(PERC_TOT_VOL_HA_SPC, na.rm = T)) %>%
#      arrange(desc(TOT_VOL_HA)) %>%
#      mutate(order = row_number())
#    
#    fig5_dat <- fig5_dat %>%
#      left_join(fig5_dat_label, by = "SPC_GRP1")
#    
#    fig5_dat <- fig5_dat %>%
#      mutate(SPC_GRP2 = ifelse(order <= 7, SPC_GRP1, 'Other'),
#             SPC_GRP2 = ifelse(SPC_GRP2 == 'Decid', 'Decid', SPC_GRP2),
#             DBH_CLASS_relevel = cut(DBH_CLASS, breaks = c(seq(-1, 59, 5), Inf), 
#                                     labels = c(seq(0, 55, 5), "60+")))
#    
#    p <- ggplot(fig5_dat, aes(x = DBH_CLASS_relevel, y = PERC_TOT_VOL_HA_SPC, fill = SPC_GRP1)) + 
#      geom_bar(stat = "identity") + 
#      scale_fill_manual(values = tree_colors, name = NULL) +
#      scale_x_discrete(drop=FALSE) +
#      scale_y_continuous(expand = c(0, 0), labels = scales::percent) +
#      labs(x = "DBH class (cm)", y = "% of whole stem vol/ha",
#           title = "Stock Table - live trees") +
#      theme(
#        #axis.line = element_line(colour="darkgray"), 
#        panel.grid.major.y = element_line(color = 'darkgray'), 
#        panel.grid.major.x = element_blank(),
#        panel.grid.minor.x = element_blank(),
#        rect = element_blank()
#      ) 
#    
#  }
#  return(p)
#})
#
#
#output$stock_table_vol <- renderPlot({
#  
#  stockplot_vol()
#  
#})
#
#
#
#
#stockplot_stem <- reactive({
#  req(input$SelectVar)
#  if (!is.null(clstr_id_grid())){
#    
#    fig5_stem_dat <- tree_fh_data %>%
#      filter(CLSTR_ID %in% clstr_id_grid(), DAM_NUM == 1, LV_D == "L") %>%
#      mutate(#VOL_WSV_HA = VOL_WSV*PHF_TREE,
#        PERC_TOT_STEMS_HA = PHF_TREE/sum(PHF_TREE, na.rm = T),
#        DBH_CLASS = round(DBH/5)*5) %>% 
#      mutate(SPC_GRP1 = substr(SPECIES,1,2)) %>%
#      mutate(SPC_GRP1 = ifelse(SPECIES %in% decidspc, 'Decid', SPC_GRP1))
#    
#    fig5_stem_dat <- fig5_stem_dat %>%
#      group_by(SPC_GRP1, DBH_CLASS) %>%
#      summarise(PERC_TOT_STEMS_HA_SPC = sum(PERC_TOT_STEMS_HA, na.rm = T)) %>%
#      ungroup()
#    
#    fig5_stem_dat_label <- fig5_stem_dat %>%
#      group_by(SPC_GRP1) %>%
#      summarize(TOT_STEMS_HA = sum(PERC_TOT_STEMS_HA_SPC, na.rm = T)) %>%
#      arrange(desc(TOT_STEMS_HA)) %>%
#      mutate(order = row_number())
#    
#    fig5_stem_dat <- fig5_stem_dat %>%
#      left_join(fig5_stem_dat_label, by = "SPC_GRP1")
#    
#    fig5_stem_dat <- fig5_stem_dat %>%
#      mutate(SPC_GRP2 = ifelse(order <= 7, SPC_GRP1, 'Other'),
#             SPC_GRP2 = ifelse(SPC_GRP2 == 'Decid', 'Decid', SPC_GRP2),
#             DBH_CLASS_relevel = cut(DBH_CLASS, breaks = c(seq(-1, 59, 5), Inf), 
#                                     labels = c(seq(0, 55, 5), "60+")))
#    
#    p <- ggplot(fig5_stem_dat, aes(x = DBH_CLASS_relevel, y = PERC_TOT_STEMS_HA_SPC, fill = SPC_GRP1)) + 
#      geom_bar(stat = "identity") + 
#      scale_fill_manual(values = tree_colors, name = NULL) +
#      scale_x_discrete(drop=FALSE) +
#      scale_y_continuous(expand = c(0, 0), labels = scales::percent) +
#      labs(x = "DBH class (cm)", y = "% of total stems/ha") +
#      theme(
#        #axis.line = element_line(colour="darkgray"), 
#        panel.grid.major.y = element_line(color = 'darkgray'), 
#        panel.grid.major.x = element_blank(),
#        panel.grid.minor.x = element_blank(),
#        rect = element_blank()
#      ) 
#    
#  }
#  return(p)
#})
#
#
#output$stock_table_stem <- renderPlot({
#  
#  stockplot_stem()
#  
#})
#
#
#
#
#smalltrplot <- reactive({
#  req(input$SelectVar)
#  if (!is.null(clstr_id_grid())){
#    
#    smtr_dat <- smtr_data %>%
#      filter(CLSTR_ID %in% clstr_id_grid()) %>%
#      mutate(SPC_GRP1 = ifelse(SPECIES %in% decidspc, 'Decid', SPECIES),
#             SPC_GRP1 = factor(SPC_GRP1, levels = species_order),
#             n = length(clstr_id_grid())) %>%
#      pivot_longer(cols = ends_with("_HA"),
#                   names_to = "size",
#                   values_to = "sph") %>%
#      group_by(SPC_GRP1, size) %>%
#      reframe(sph = sum(sph)/length(clstr_id_grid())) %>%
#      mutate(size = factor(size, levels = c("SMTR2_HA", "SMTR3_HA", "SMTR4_HA", "SMTR_HA"),
#                           labels = c("0.1-0.29m Ht", "0.3-1.3m Ht", ">1.3m Ht & \n<4cm DBH", "All"))) 
#    
#    p <- ggplot(smtr_dat, aes(x=size, fill=SPC_GRP1, y=sph)) + 
#      geom_bar(position='stack', stat='identity', width = 0.7) +
#      scale_fill_manual(values = tree_colors, name = NULL) +
#      scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
#      labs(x='Size Class', y='Stems/ha', title = "Small Trees") +
#      theme(
#        #axis.line = element_line(colour="darkgray"), 
#        panel.grid.major.y = element_line(color = 'darkgray'), 
#        panel.grid.major.x = element_blank(),
#        panel.grid.minor.x = element_blank(),
#        rect = element_blank()
#      ) 
#    
#  }
#  return(p)
#})
#
#
#output$smalltree <- renderPlot({
#  
#  smalltrplot()
#  
#})
