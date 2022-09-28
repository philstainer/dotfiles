import os, subprocess, time

# Select first windown
subprocess.run(['tmux', 'select-window', '-t 1'])

cwd = os.getcwd()

# Get other windows:
windows = subprocess.run('tmux list-windows | grep -v active | awk \'BEGIN{FS=":"}{print $1}\' | tac | xargs', shell=True, capture_output=True, text=True)
windows = windows.stdout.replace('\n', '').split(' ')

# Destroy all windows
subprocess.run(['tmux', 'kill-window', '-a', '-t 1'])

for window in windows:
    if window == '':
        continue
    subprocess.run(['tmux', 'new-window', '-d'])

# time.sleep(0.5)
#
# # Skip 
# for window in windows[::-1]:
#     subprocess.run(['tmux', 'send-keys', '-t %s' % window])
#     # time.sleep(0.1)
#     subprocess.run(['tmux', 'send-keys', '-t %s' % window, 'clear', 'Enter'])
