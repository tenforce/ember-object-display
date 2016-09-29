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

  checkValue: Ember.observer('object', 'value', () ->
    @get('value').then (value) =>
      #if @get('model.test') is true then debugger
      if value is true or value is false
        @set('isLoading', false)
      else unless value
        @set('empty', true)
      else
        @set('isLoading', false)
  ).on('init')

  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false then @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

  actions:
    ###enter: (value) ->
      if(event.keyCode == 13 && not event.shiftKey && not event.ctrlKey)
        @sendAction('valueConfirmed', @get('model'), value, @get('index'))
        event.preventDefault()
      false###
    keyPress: (value) ->
      if(event.keyCode == 13 && not event.shiftKey && not event.ctrlKey)
        @sendAction('valueConfirmed', @get('model'), value, @get('index'))
        event.preventDefault()

`export default ValueDisplayComponent`
