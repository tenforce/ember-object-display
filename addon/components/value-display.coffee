`import Ember from 'ember'`
`import layout from '../templates/components/value-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ValueDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  click: ->
    @sendAction('clicked', @get('object'), @get('model'))
    false


`export default ValueDisplayComponent`
