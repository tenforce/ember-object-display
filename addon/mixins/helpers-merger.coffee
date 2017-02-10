`import Ember from 'ember'`

HelpersMergerMixin = Ember.Mixin.create
  # DEPRECATED
  helpers: Ember.computed 'inheritedHelpers', 'model.helpers', ->
    if @get 'inheritedHelpers'
      $.extend( true, @get('inheritedHelpers'), @get('model.helpers') )
    else @get 'model.helpers'

`export default HelpersMergerMixin`
