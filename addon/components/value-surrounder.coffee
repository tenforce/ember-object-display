`import Ember from 'ember'`
`import layout from '../templates/components/value-surrounder'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ValueSurrounderComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  defaultTagName: ''
  defaultClassNames: []
  defaultClassNameBindings: []
  defaultCollapsible: false
  defaultCollapsed: false

`export default ValueSurrounderComponent`
