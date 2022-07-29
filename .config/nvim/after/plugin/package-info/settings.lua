local ok, package_info = pcall(require, 'package-info')
if not ok then return end

package_info.setup({
  hide_up_to_date = true,
  package_manager = 'yarn',
  hide_unstable_versions = true
})
