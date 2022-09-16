require_relative './config/environment'

use UserController
run UserController

use RegistryController
run RegistryController

use ProductsController
run ProductsController