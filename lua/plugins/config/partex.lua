local status_ok, plugin = pcall(require, "partex")
if not status_ok then return end

plugin.setup()
