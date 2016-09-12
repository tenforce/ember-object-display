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

`export default ValueDisplayComponent`
