class Constants
  #URL to scrape
  URL = "http://www.britishmuseum.org/whats_on.aspx"

  #Messages
  WELCOME_MESSAGE       = "These are the British Museum's main exhibition sections:"
  LEARN_MORE_MESSAGE    = "\nSelect the number of the list you would like to learn more about."
  MESSAGE_CAT1       = "These are the current 'Special Exhibitions':"
  MESSAGE_CAT2          = "These are the current 'Free exhibitions and displays':"
  MESSAGE_CAT3         = "These are 'Today\'s events':"
  INVALID_INPUT_MESSAGE = "\nThat was not a valid option."
  SELECT_AGAIN_MESSAGE  = "Please choose from the following:"
  START_AGAIN_MESSAGE   = "Would you like to start again? (Y/n)"
  EXIT_MESSAGE          = "\nGoodbye!"

  #Selectors
  SPECIFIC_SELECTOR_SPECIAL = ".grid_12 .grid_12 .grid_4"
  SPECIFIC_SELECTOR_FREE    = ".container .grid_12 .grid_4 .titleSpacer"
  SPECIFIC_SELECTOR_TODAY   = ".container .grid_12 ul li"
  NAME_SELECTOR_SPECIAL     = "h3 a"
  NAME_SELECTOR_FREE        = "h3"
  NAME_SELECTOR_TODAY       = "a .grid_6"
end 