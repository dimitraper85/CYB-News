// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import FavoritorController from "./controllers/favoritor_controller.js"
Stimulus.register("favoritor", FavoritorController)
