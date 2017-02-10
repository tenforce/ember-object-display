`import Ember from 'ember'`
`import AttributesGetterMixin from '../mixins/attributes-getter'`
`import PropertiesGetterMixin from '../mixins/properties-getter'`
`import HelpersMergerMixin from '../mixins/helpers-merger'`
`import ObserversMixin from '../mixins/observers'`

MixinsContainerMixin = Ember.Mixin.create AttributesGetterMixin, PropertiesGetterMixin, HelpersMergerMixin, ObserversMixin,
  # DEPRECATED
  init: ->
    @._super()
    @setAttributes()

`export default MixinsContainerMixin`
