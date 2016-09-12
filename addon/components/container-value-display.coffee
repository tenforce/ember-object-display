`import Ember from 'ember'`
`import layout from '../templates/components/container-value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ContainerValueDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  doNotSetAttributes: true
  tagName: ''
  classNames: []
  classNameBindings: []
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
  value: Ember.computed 'object', 'model.type', 'value', ->
    res
    type = @get('model.type')
    if ['string', 'component'].contains(type)
      res = @get('model.value')
    else if ['property', 'array', 'hasMany', 'hasOne'].contains(type)
      res = @getProperty(@get('object'), @get('model.value'))
    @ensurePromise(res)

  getProperty: (target, propertyName) ->
    if target then target.get(propertyName)
    else return null

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

`export default ContainerValueDisplayComponent`
