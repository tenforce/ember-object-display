`import Ember from 'ember'`
`import PropertiesGetterMixin from '../../../mixins/properties-getter'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | properties getter'

# Replace this with your real tests.
test 'it works', (assert) ->
  PropertiesGetterObject = Ember.Object.extend PropertiesGetterMixin
  subject = PropertiesGetterObject.create()
  assert.ok subject
