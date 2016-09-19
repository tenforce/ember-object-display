`import Ember from 'ember'`
`import layout from '../templates/components/value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ValueDisplayComponent = Ember.Component.extend MixinsContainerMixin,
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
      if @get('model.test') is true then debugger
      unless value
        @set('empty', true)
      else
        @set('isLoading', false)
  ).on('init')

  finishedLoading: Ember.observer('object', 'isLoading', () ->
    if @get('isLoading') is false then @sendAction('handleFinishedLoading', @, @get('index'))
  ).on('init')

`export default ValueDisplayComponent`
