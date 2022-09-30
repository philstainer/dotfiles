import os, subprocess, time, argparse

parser = argparse.ArgumentParser(description='Kill and start some tmux windows')
parser.add_argument('--cwd', type=str, default=os.path.abspath(os.getcwd()), help='CWD for new windows')
args = parser.parse_args()

# Select first windown
subprocess.run(['tmux', 'select-window', '-t 1'])

# Get other windows:
windows = subprocess.run('tmux list-windows | grep -v active | awk \'BEGIN{FS=":"}{print $1}\' | tac | xargs', shell=True, capture_output=True, text=True)
windows = windows.stdout.replace('\n', '').split(' ')

# Destroy all windows
subprocess.run(['tmux', 'kill-window', '-a', '-t 1'])

for window in windows:
    if window == '':
        continue
    subprocess.run('tmux new-window -d -c \'%s\'' % args.cwd, shell=True)

# time.sleep(0.5)
#
# # Skip 
# for window in windows[::-1]:
#     subprocess.run(['tmux', 'send-keys', '-t %s' % window])
#     # time.sleep(0.1)
#     subprocess.run(['tmux', 'send-keys', '-t %s' % window, 'clear', 'Enter'])
