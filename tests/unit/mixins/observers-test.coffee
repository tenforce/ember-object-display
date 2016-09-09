`import Ember from 'ember'`
`import ObserversMixin from '../../../mixins/observers'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | observers'

# Replace this with your real tests.
test 'it works', (assert) ->
  ObserversObject = Ember.Object.extend ObserversMixin
  subject = ObserversObject.create()
  assert.ok subject
