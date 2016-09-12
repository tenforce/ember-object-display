`import Ember from 'ember'`

PropertiesGetterMixin = Ember.Mixin.create
  defaultShowEmpty: false
  defaultCollapsible: false
  defaultCollapsed: false
  defaultModifiable: false
  defaultLoading: false
  defaultHide: false
  defaultLog: false
  empty: false

  showEmpty: Ember.computed 'model.properties.showEmpty', ->
    showEmpty = @get 'model.properties.showEmpty'
    if showEmpty is undefined then showEmpty = @get 'defaultShowEmpty'
    showEmpty
  collapsible: Ember.computed 'model.properties.collapsible', ->
    collapsible = @get 'model.properties.collapsible'
    # So that, if you specify "collapsed" to true, collapsible is implied
    if collapsible is undefined then collapsible = @get 'collapsed'
    if collapsible is undefined then collapsible = @get 'defaultCollapsible'
    collapsible
  collapsed: Ember.computed 'model.properties.collapsed', ->
    collapsed = @get 'model.properties.collapsed'
    if collapsed is undefined then collapsed = @get 'defaultCollapsed'
    collapsed
  modifiable: Ember.computed 'model.properties.modifiable', ->
    modifiable = @get 'model.properties.modifiable'
    if modifiable is undefined then modifiable = @get 'defaultModifiable'
    modifiable
  loading: Ember.computed 'model.properties.loading', ->
    loading = @get 'model.properties.loading'
    if loading is undefined then loading = @get 'defaultLoading'
    loading
  log: Ember.computed 'model.properties.log', ->
    log = @get 'model.properties.log'
    if log is undefined then log = @get 'defaultLog'
    log
  hide: Ember.computed 'model.properties.hide', ->
    hide = @get 'model.properties.hide'
    if hide is undefined then hide = @get 'defaultHide'
    hide
  parameters: Ember.computed 'model.properties.parameters', ->
    parameters = @get 'model.properties.parameters'
    if parameters is undefined then parameters = false
    parameters

`export default PropertiesGetterMixin`
