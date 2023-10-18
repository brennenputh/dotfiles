local M = {}

M.servers = {
   -- Shell scripting
   "bashls",

   -- C++
   "clangd",
   "cmake",

   -- Rust
   "rust_analyzer",

   -- Webdev
   "html",
   "cssls",
   "tsserver",
   "svelte",

   -- JVM
   "groovyls",
   "kotlin_language_server",
   "gradle_ls",
   "jdtls",

   -- Python
   "pyright",

   -- Lua
   "lua_ls",

   -- Data Formats
   "jsonls",
   "yamlls",

   -- Docker
   "docker_compose_language_service",
   "dockerls"
}

return M
