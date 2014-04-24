#
##### VENDOR
#
#= require jquery/jquery
#= require underscore/underscore
#= require moment/moment
#= require odometer/odometer
#
##### SPINE
#
#= require spine/src/spine
#= require spine/src/manager
#= require spine/src/ajax
#= require spine/src/relation
#
##### APP
#
#= require_self
#= require_tree ./initalizers
#= require_tree ./lib
#= require_tree ./modules
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#

window.Delay = 30000
window.Format = "('ddd).dd"