`import Ember from 'ember'`
`import layout from '../templates/components/value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`
`import ResizeTextareaMixin from '../mixins/resize-textarea'`

ValueDisplayComponent = Ember.Component.extend MixinsContainerMixin, ResizeTextareaMixin,
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
    if @get('modifiable') && ['property', 'hasMany', 'hasOne'].contains(type)
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

  # TODO just make this part of init()? 
  checkValue: Ember.observer('value', () ->
    # console.log "Value changed"
    @get('value').then (value) =>
      if value is true or value is false
        @set('isLoading', false)
      else if not value
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
    console.log "Saving:", @get('model.value'), "from", @get('object.' + @get('model.value')), "to", @get('boundValue')
    boundValue = @get('boundValue')
    @get('object').set(@get('model.value'), boundValue)
    @get('object').save()

  actions:
    saveField: ->
      @saveField()

    resetField: ->
      ref = 'object.' + @get('model.value')
      value = @get(ref)
      @set('boundValue', value)
      # @get('object').resetField(@get('model.value'))



`export default ValueDisplayComponent`
