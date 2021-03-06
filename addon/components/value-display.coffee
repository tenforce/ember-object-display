`import Ember from 'ember'`
`import layout from '../templates/components/value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`
`import ResizeTextareaMixin from '../mixins/resize-textarea'`

ValueDisplayComponent = Ember.Component.extend MixinsContainerMixin, ResizeTextareaMixin,
  # DEPRECATED
  layout:layout
  defaultTagName: 'div'
  defaultClassNames: ['value-display']
  defaultClassNameBindings: []
  defaultCollapsible: false
  defaultCollapsed: false

  saveAllButton: Ember.inject.service()

  init: ->
    @_super()
    type = @get('model.type')
    if @get('modifiable') && ['property', 'hasMany'].contains(type)
      ref = 'object.' + @get('model.value')
      Ember.defineProperty @, "dirty",
        Ember.computed 'boundValue', ref, ->
          ref = 'object.' + @get('model.value')
          value = @get(ref)
          boundValue = @get('boundValue')
          boundValue != value
      @get('saveAllButton').subscribe(@)

  click: ->
    @sendAction('clicked', @)
    false

  boundValue: undefined

  updateValue: Ember.observer 'boundValue', ->
    if @get('modifiable')
      boundValue = @get('boundValue')
      if boundValue
        @get('value').then (value) =>
          if boundValue isnt value
            @sendAction('valueConfirmed', @get('model'), boundValue, @get('index'))

  # TODO just make this part of init()?
  checkValue: Ember.observer('value', () ->
    @get('value')?.then (value) =>
      if not value
        @set('empty', true)
      else
        @set('isLoading', false)

      @set 'boundValue', value
  ).on('init')


  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false
      @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

  saveAllClick: ->
    @saveField()

  saveField: ->
    boundValue = @get('boundValue')
    @get('object').set(@get('model.value'), boundValue)
    @get('object').save()

  resetField: ->
    ref = 'object.' + @get('reference')
    value = @get(ref)
    @set('boundValue', value)

  actions:
    saveField: ->
      @saveField()

    resetField: ->
      @resetField()



`export default ValueDisplayComponent`
