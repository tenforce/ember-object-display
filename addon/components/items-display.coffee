`import Ember from 'ember'`
`import layout from '../templates/components/items-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ItemsDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout

`export default ItemsDisplayComponent`
