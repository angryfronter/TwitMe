// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
import * as ActiveStorage from "@rails/activestorage"

import '@popperjs/core'
import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/util'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
