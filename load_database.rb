require './autoload'
require './modules/database_filler'

include DatabaseFiller

fill_with_fake_data
