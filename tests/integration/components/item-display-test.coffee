`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'item-display', 'Integration | Component | item display', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{item-display}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#item-display}}
      template block text
    {{/item-display}}
  """

  assert.equal @$().text().trim(), 'template block text'
