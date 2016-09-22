`import Ember from 'ember'`
`import layout from '../templates/components/container-value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ContainerValueDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  doNotSetAttributes: true
  tagName: ''
  classNames: []
  classNameBindings: []

  displayPrefix: Ember.computed 'model.prefix', 'model.item.prefix', 'hidePrefix', ->
    if @get('hidePrefix') then return false
    if @get('model.prefix') or @get('model.item.prefix') then return true
  displaySuffix: Ember.computed 'model.suffix', 'model.item.suffix', 'hideSuffix', ->
    if @get('hideSuffix') then return false
    if @get('model.suffix') or @get('model.item.suffix') then return true

  prefixIsLoaded: Ember.computed 'displayPrefix', ->
    unless @get('displayPrefix') then return true
    false
  suffixIsLoaded: Ember.computed 'displaySuffix', ->
    unless @get('displaySuffix') then return true
    false
  valueIsLoaded: false
  isLoading: Ember.computed 'object', 'prefixIsLoaded', 'suffixIsLoaded', 'valueIsLoaded', ->
    if @get('prefixIsLoaded') and @get('suffixIsLoaded') and @get('valueIsLoaded') then return false
    true
  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false then @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

  isArray: Ember.computed 'model.type', ->
    type = @get('model.type')
    if 'array' is type then return true
    else return false
  isSimple: Ember.computed 'model.type', ->
    type = @get('model.type')
    if ['property', 'string'].contains(type) then return true
    else return false
  isComponent: Ember.computed 'model.type', ->
    type = @get('model.type')
    if 'component' is type then return true
    else return false
  isHasOne: Ember.computed 'model.type', ->
    type = @get('model.type')
    if 'hasOne' is type then return true
    else return false
  isHasMany: Ember.computed 'model.type', ->
    type = @get('model.type')
    if 'hasMany' is type then return true
    else return false
  isItem: Ember.computed 'model.type', ->
    type = @get('model.type')
    if 'item' is type then return true
    else return false

  ensurePromise: (x) ->
    return new Ember.RSVP.Promise (resolve) ->
      resolve(x)
  value: Ember.computed 'object', 'model.type', 'model.value', ->
    res
    type = @get('model.type')
    val = @get('model.value')
    if ['string', 'component'].contains(type)
      res = val
    else if ['property', 'array', 'hasMany', 'hasOne'].contains(type)
      res = @getProperty(@get('object'), val)
    @ensurePromise(res)

  getProperty: (target, propertyName) ->
    if target then target.get(propertyName)
    else return null

  relation: Ember.computed 'object', 'model.relation', 'model.relation', ->
    @get('model.relation')

  arrayLength: Ember.computed 'object', 'model', 'value', ->
    @get('value').then (value) =>
      if value.get && (value.get('length') is not undefined) then return value.get('length')
      else return value.length
  emptyItems: 0
  loadedItems: 0
  handledItems: Ember.computed 'emptyItems', 'loadedItems', ->
    @get('emptyItems') + @get('loadedItems')

  checkEmptyItems: Ember.observer('object', 'arrayLength', 'emptyItems', () ->
    if ['array', 'hasMany'].contains @get('model.type')
      @get('arrayLength').then (length) =>
        if length is @get('emptyItems') then @sendAction('handleHide', @, @get('index'))
  ).on('init')

  checkHandledItems: Ember.observer('object', 'arrayLength', 'handledItems', () ->
    if ['array', 'hasMany'].contains @get('model.type')
      @get('arrayLength').then (length) =>
        if length is @get('handledItems') then @set('valueIsLoaded', true)
  ).on('init')

  prefixClicked: (context) ->
    if context.get('log') then console.log "prefix clicked"
    context.sendAction('clicked', @)
  suffixClicked: (context) ->
    if context.get('log') then console.log "suffix clicked"
    context.sendAction('clicked', @)
  valueClicked: (context) ->
    if context.get('log') then console.log "value clicked"
    context.sendAction('clicked', @)
  actions:
    handlePrefixClicked: ->
      @get('helpers.prefixClicked')(@)
    handleSuffixClicked: ->
      @get('helpers.suffixClicked')(@)
    handleValueClicked: ->
      @get('helpers.valueClicked')(@)
    handleHideItem: (context, index) ->
      # TODO : Handle
      debugger
      @incrementProperty('emptyItems')
      console.log "handle item should hide"
      context.set('value._shouldHide', true)
    handleHideValue: (context, index)->
      @sendAction('handleHide', @, @get('index'))
    handleHidePrefix: (context, index)->
      @set('hidePrefix', true)
    handleHideSuffix: (context, index)->
      @set('hideSuffix', true)
    handleValueFinishedLoading: (context, index) ->
      @set('valueIsLoaded', true)
    handlePrefixFinishedLoading: (context, index) ->
      @set('prefixIsLoaded', true)
    handleSuffixFinishedLoading: (context, index) ->
      @set('suffixIsLoaded', true)
    handleItemFinishedLoading: (context, index) ->
      # TODO : Handle
      debugger
      @incrementProperty('loadedItems')
      console.log "handle item finished loading"
    handleValueConfirmed: (model, newvalue) ->
      debugger
      if model.type is "string" then model.value = newvalue
      else if model.type is "property"
        checkProm = @get('object').set(model.value, newvalue)
        if checkProm.then
          checkProm.then () =>
            @get('object').save()
        else
          @get('object').save()
    handleItemValueConfirmed: (model, newvalue, index) ->
      debugger
      # TODO : Handle
      false


`export default ContainerValueDisplayComponent`
