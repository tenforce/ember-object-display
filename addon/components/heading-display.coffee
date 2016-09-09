`import Ember from 'ember'`
`import layout from '../templates/components/heading-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

HeadingDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout: layout
  click: () ->
    alert("heading-display clicked")

`export default HeadingDisplayComponent`
