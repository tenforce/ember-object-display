`import Ember from 'ember'`
`import AttributesGetterMixin from '../../../mixins/attributes-getter'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | attributes getter'

# Replace this with your real tests.
test 'it works', (assert) ->
  AttributesGetterObject = Ember.Object.extend AttributesGetterMixin
  subject = AttributesGetterObject.create()
  assert.ok subject
