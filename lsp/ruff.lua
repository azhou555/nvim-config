return {
  on_attach = function(client)
    -- Defer hover and go-to-definition to basedpyright
    client.server_capabilities.hoverProvider = false
  end,
}
