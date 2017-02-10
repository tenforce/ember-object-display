`import Ember from 'ember'`

PropertiesGetterMixin = Ember.Mixin.create
  # DEPRECATED
  defaultShowEmpty: false
  defaultCollapsible: false
  defaultCollapsed: false
  defaultModifiable: false
  defaultLoading: false
  defaultHide: false
  defaultLog: false
  empty: false

  showEmpty: Ember.computed 'model.properties.showEmpty', ->
    if @get('model.properties.modifiable') then return true
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
  modifiableCols: Ember.computed 'model.properties.modifiable.cols', ->
    modifiableCols = @get 'model.properties.modifiable.cols'
    if modifiableCols is undefined then modifiableCols = "80"
    modifiableCols
  modifiableRows: Ember.computed 'model.properties.modifiable.rows', ->
    modifiableRows = @get 'model.properties.modifiable.rows'
    if modifiableRows is undefined then modifiableRows = "2"
    modifiableRows
  modifiableSize: Ember.computed 'model.properties.modifiable.size', ->
    modifiableSize = @get 'model.properties.modifiable.size'
    if modifiableSize is undefined then modifiableSize = "80"
    modifiableSize
  modifiablePlaceholder: Ember.computed 'model.properties.modifiable.placeholder', ->
    modifiablePlaceholder = @get 'model.properties.modifiable.placeholder'
    if modifiablePlaceholder is undefined then modifiablePlaceholder = "Enter text here"
    modifiablePlaceholder
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
