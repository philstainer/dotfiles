local worktree = require('git-worktree')

worktree.setup({
  change_directory_command = 'cd',
  update_on_change = true,
  update_on_change_command = 'e .',
  clearjumps_on_change = true,
  autopush = false
})

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
    print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
    local cmd = string.format(
                    'silent !python ~/.local/bin/tmux-worktree-restore.py --cwd %s',
                    metadata.path)
    vim.api.nvim_command(cmd)
  end
end)
