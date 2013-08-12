class Rdio.RdioStorage extends Batman.RestStorage
  request: (env, next) ->
    R.ready ->
      R.request
        method: env.options.action
        content: env.options.data
        success: (response) -> env.data = response.result; window.RESULTS = env.data
        error: (response) -> env.error = response.message
        complete: (response) ->
          env.results = response.result
          next()
