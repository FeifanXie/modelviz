parse_arrow_data <- function(des_block = NULL,
                             advan     = NULL,
                             trans     = NULL,
                             verbose   = FALSE) {

  # Check inputs ------------------------------------------------------------
  if(is.null(advan) || is.null(trans)) {
    stop('Arguments \"advan\" and \"trans\" required.')
  }

  if(!advan %in% c(1:4,11:12) && is.null(des_block)) {
    stop('Argument \"des_block\" required when DES is used.')
  }

  if(advan == 10) {
    stop('ADVAN 10 is not currently supported by modelviz.')
  }

  if(trans > 4) {
    stop('TRANS > 4 are not currently supported by modelviz.')
  }

  # Assign parameters to known advan ----------------------------------------
  if(advan == 1) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = 'A1',
                                 to    = 'A2',
                                 prm   = 'K',
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = 'A1',
                                 to    = 'A2',
                                 prm   = 'CL',
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    }
  }

  if(advan == 2) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = c('A1', 'A2'),
                                 to    = c('A2', 'A3'),
                                 prm   = c('KA', 'K'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = c('A1', 'A2'),
                                 to    = c('A2', 'A3'),
                                 prm   = c('KA', 'CL'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    }
  }

  if(advan == 3) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = c('A1', 'A1', 'A2'),
                                 to    = c('A3', 'A2', 'A1'),
                                 prm   = c('K', 'K12', 'K21'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = c('A1', 'A1'),
                                 to    = c('A3', 'A2'),
                                 prm   = c('CL', 'Q'),
                                 dir   = c('forward', 'both'),
                                 stringsAsFactors = FALSE)
    }
  }

  if(advan == 4) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = c('A1', 'A2', 'A2', 'A3'),
                                 to    = c('A2', 'A4', 'A3', 'A2'),
                                 prm   = c('KA', 'K', 'K23', 'K32'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = c('A1', 'A2', 'A2'),
                                 to    = c('A2', 'A4', 'A3'),
                                 prm   = c('KA', 'CL', 'Q'),
                                 dir   = c('forward', 'forward', 'both'),
                                 stringsAsFactors = FALSE)
    }
  }

  if(advan == 11) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = c('A1', 'A2', 'A1', 'A3', 'A1'),
                                 to    = c('A2', 'A1', 'A3', 'A1', 'A4'),
                                 prm   = c('K12', 'K21', 'K13', 'K31', 'K'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = c('A1', 'A1', 'A1'),
                                 to    = c('A2', 'A3', 'A4'),
                                 prm   = c('Q2', 'Q3', 'CL'),
                                 dir   = c('both', 'both', 'forward'),
                                 stringsAsFactors = FALSE)
    }
  }

  if(advan == 12) {
    if(trans == 1) {
      parsed_arrow <- data.frame(from  = c('A1', 'A2', 'A3', 'A2', 'A4', 'A2'),
                                 to    = c('A2', 'A3', 'A2', 'A4', 'A2', 'A5'),
                                 prm   = c('KA', 'K23', 'K32', 'K24', 'K42', 'K'),
                                 dir   = 'forward',
                                 stringsAsFactors = FALSE)
    } else {
      parsed_arrow <- data.frame(from  = c('A1', 'A2', 'A2', 'A2'),
                                 to    = c('A2', 'A3', 'A4', 'A5'),
                                 prm   = c('KA', 'Q3', 'Q4', 'CL'),
                                 dir   = c('forward', 'both', 'both', 'forward'),
                                 stringsAsFactors = FALSE)
    }
  }

  if(!advan %in% c(1:4,11:12)){
    parsed_arrow <- NULL
  }

  return(parsed_arrow)

} # End parse_arrow_data