return function(client)
  vim.notify(
    client.name .. ': Language Server successfully started!',
    'info'
  )
end