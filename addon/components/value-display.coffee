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
  click: ->
    @sendAction('clicked', @)
    false

  boundValue: null

  updateValue: Ember.observer 'boundValue', ->
    if @get('modifiable')
      boundValue = @get('boundValue')
      if boundValue
        @get('value').then (value) =>
          if boundValue isnt value
            if not @get('object.isUnderCreation')
              @set('object.dirty', true) 
            @sendAction('valueConfirmed', @get('model'), boundValue, @get('index'))

  checkValue: Ember.observer('object', 'value', () ->
    @get('value').then (value) =>
      #if @get('model.test') is true then debugger
      if value is true or value is false
        @set('isLoading', false)
      else if not value
        @set('empty', true)
      else
        @set('isLoading', false)

      @set 'boundValue', value
  ).on('init')

  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false then @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

  # actions:
  #   keyPress: (value) ->
  #     console.log value

`export default ValueDisplayComponent`
