import Vue from 'vue'
import App from '../front/App.vue'

const assert = require('assert');

describe('App.vue', function () {
  it('should have correct message', function () {
    assert(App.data().msg == 'Discourse Hub')
  })
})
