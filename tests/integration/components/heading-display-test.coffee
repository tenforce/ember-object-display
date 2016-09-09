`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'heading-display', 'Integration | Component | heading display', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{heading-display}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#heading-display}}
      template block text
    {{/heading-display}}
  """

  assert.equal @$().text().trim(), 'template block text'
