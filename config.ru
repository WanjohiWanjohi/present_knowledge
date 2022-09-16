require_relative './config/environment'
run Sinatra::Application

use UserController
run UserController

use RegistryController
run RegistryController

use ProductsController
run ProductsController