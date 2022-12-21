local status_ok, plugin = pcall(require, "fidget")
if not status_ok then return end

plugin.setup()
